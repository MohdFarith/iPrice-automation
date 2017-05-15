*** Settings ***
Documentation    This file will only store variables and keywords for PH.

*** Variables ***

${PH_homeURL}    https://iprice.ph/
${PH_homeTitle}    Online Shopping, Coupons & Discount Codes at iprice Philippines
${PH_header_logo_link}    //div[@id='logo']//a[@href='https://iprice.ph/']
${PH_header_search_input}    //div[@id='search']//input[@placeholder='Search for products, coupons or brands...']
${PH_header_search_icon}    //div[@id='search']//i[@class='icon icon-search-blue']
${PH_header_popular_searches_text}    //div[@id='popular-searches']//li[normalize-space(text())='Popular Searches:']
${PH_header_coupon_logo_link}    //div[@id='news-button']//a[@href='https://iprice.ph/coupons/']
${PH_header_coupon_text}    //div[@id='news-button']//button[normalize-space(text())='Coupons & Offers']
${PH_header_categories_clothing_link}    //div[@id='menu']//a[@href='https://iprice.ph/clothing/']//span[text()='Clothing']
${PH_header_categories_clothing_men}    //div[@id='menu']//a[contains(@href,'https://iprice.ph/clothing/men/') and text()='Men']
${PH_header_categories_clothing_women}    //div[@id='menu']//a[contains(@href,'https://iprice.ph/clothing/women/') and text()='Women']
${PH_header_categories_shoes_link}    //div[@id='menu']//a[@href='https://iprice.ph/shoes/']//span[text()='Shoes']
${PH_header_categories_shoes_men}    //div[@id='menu']//a[contains(@href,'https://iprice.ph/shoes/men/') and text()='Men']
${PH_header_categories_shoes_women}    //div[@id='menu']//a[contains(@href,'https://iprice.ph/shoes/women/') and text()='Women']
${PH_header_categories_bags_link}  //div[@id='menu']//a[@href='https://iprice.ph/bags/']//span[text()='Bags']
${PH_header_categories_watches_link}  //div[@id='menu']//a[@href='https://iprice.ph/watches/']//span[text()='Watches']
${PH_header_categories_jewellery_link}  //div[@id='menu']//a[@href='https://iprice.ph/jewellery/']//span[text()='Jewellery']
${PH_header_categories_computing_link}  //div[@id='menu']//a[@href='https://iprice.ph/computing/']//span[text()='Computing']
${PH_header_categories_phones_tablets_link}  //div[@id='menu']//a[@href='https://iprice.ph/phones-tablets/']//span[text()='Phones & Tablets']
${PH_header_categories_gaming_link}  //div[@id='menu']//a[@href='https://iprice.ph/gaming/']//span[text()='Gaming']
${PH_header_categories_camera_photo_link}  //div[@id='menu']//a[@href='https://iprice.ph/camera-photo/']//span[text()='Camera & Photo']
${PH_header_categories_tv_video_dvd_link}  //div[@id='menu']//a[@href='https://iprice.ph/tv-video-dvd/']//span[text()='TV, Video & DVD']
${PH_header_categories_appliances_link}  //div[@id='menu']//a[@href='https://iprice.ph/appliances/']//span[text()='Appliances']
${PH_header_categories_automotive_link}  //div[@id='menu']//a[@href='https://iprice.ph/automotive/']//span[text()='Automotive']

${PH_coupon_page_title}     Get Exclusive Sales, Vouchers & Promotions in 2017 | iPrice Philippines

*** Keywords ***

Get All Available Links In PH
    ${AllLinksCount}  Get Matching Xpath Count  //a
    ${LinkItems}  Create List

    :FOR  ${INDEX}  IN RANGE  1  ${AllLinksCount}
    \  ${href}  Get Element Attribute  xpath=(//a)[${INDEX}]@href
    \  Run Keyword If  "${href}"!="None"  Append To list  ${LinkItems}  ${href}

    ${LinkItemsCount}  Get Length  ${LinkItems}
    ${filter_link1}  Create List
    Set Suite Variable  ${filter_link1}
    ${filter_link2}  Create List
    Set Suite Variable  ${filter_link2}

    :FOR  ${INDEX}  IN RANGE  0  ${LinkItemsCount}
    \  ${url}  Get From List  ${LinkItems}  ${INDEX}
    \  ${match}  Get Regexp Matches  ${url}  r/pc
    \  ${matchCount}  Get Length  ${match}
    \  Run Keyword If  ${matchCount}>0  Append To List  ${filter_link2}  ${url}
    \  ...  ELSE  Append To List  ${filter_link1}  ${url}

    ${filter_link1_count}  Get Length  ${filter_link1}
    Set Suite Variable  ${filter_link1_count}
    ${filter_link2_count}  Get Length  ${filter_link2}
    Set Suite Variable  ${filter_link2_count}

Check All Links Response In PH
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link1_count}
    \  ${link}  Get From List  ${filter_link1}  ${INDEX}
    \  ${status}  Run Keyword And Return Status   HttpLibrary.HTTP.Get  ${link}
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to ${link} failed and not return 200.
    Run Keyword If  ${filter_link2_count}>0  Check On 3rd Part Site

Check On 3rd Part Site
    # Go To  http://www.urlitor.com/
    # Title Should Be  Bulk HTTP Status & Redirect Checker | URLitor
    # Wait Until Element Is Visible  //div[@class='container']//textarea[@id='message']

    # :FOR  ${INDEX}  IN RANGE  0  ${filter_link2_count}
    # \  ${link}  Get From List  ${filter_link2}  ${INDEX}
    # \  Clear Element Text  //div[@class='container']//textarea[@id='message']
    # \  Input Text  //div[@class='container']//textarea[@id='message']  ${link}
    # \  Click Element  //div[@class='container']//button[text()='Submit']
    # \  ${status}  Run Keyword And Return Status
    # ...  Wait Until Page Contains Element  //div[@class='row']//td[@data-title='HTTP Status final']//span[text()='200']  timeout=30
    # \  Run Keyword If  "${status}"=="False"
    # ...  Run Keyword And Continue On Failure  Fail  Request to ${link} failed and not return 200.

    :FOR  ${INDEX}  IN RANGE  0  ${filter_link2_count}
    \  Create Session  iprice  https://iprice.ph/  disable_warnings=0
    \  Sleep  1
    \  ${link}  Get From List  ${filter_link2}  ${INDEX}
    \  ${link2}  Replace String  ${link}  https://iprice.ph/  ${empty}
    \  ${link3}  Replace String  ${link2}  ${space}  ${empty}
    \  ${resp}  RequestsLibrary.Get Request  iprice  ${link3}
    \  ${status}  Run Keyword And Return Status  Should Be Equal As Strings  ${resp.status_code}  200
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to ${link} failed and not return 200.
    # \  Should Be Equal As Strings  ${resp.status_code}  200
    \  Delete All Sessions

SEO Check Internal Link In PH
    ${internal_links}   Create List
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link1_count}
    \  ${link}  Get From List  ${filter_link1}  ${INDEX}
    \  ${match}  Get Regexp Matches  ${link}  iprice.ph
    \  ${matchCount}  Get Length  ${match}
    \  Run Keyword If  ${matchCount}>0  Append To List  ${internal_links}  ${link}
    ${internal_links_count}  Get Length  ${internal_links}

    ${internal_links2}   Create List
    :FOR  ${INDEX}  IN RANGE  0  ${internal_links_count}
    \  ${link}  Get From List  ${internal_links}  ${INDEX}
    \  ${match}  Get Regexp Matches  ${link}  /#
    \  ${matchCount}  Get Length  ${match}
    \  Run Keyword If  ${matchCount}==0  Append To List  ${internal_links2}  ${link}
    ${internal_links2_count}  Get Length  ${internal_links2}

    :FOR  ${INDEX}  IN RANGE  0  ${internal_links2_count}
    \  ${link}  Get From List  ${internal_links2}  ${INDEX}
    \  ${status}  Run Keyword And Return Status  Should Start With  ${link}  https
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  ${link} does not start with https.
    \  ${status2}  Run Keyword And Return Status  Should End With  ${link}  /
    \  Run Keyword If  "${status2}"=="False"  Run Keyword And Continue On Failure  Fail  ${link} does not end with trailing "/".

Access iPrice PH Homepage
    Go To    ${PH_homeURL}
    Sleep    1
    iPrice PH Homepage Landing

iPrice PH Homepage Landing
    Title Should Be    ${PH_homeTitle}
    Wait Until Element Is Visible    ${PH_header_logo_link}
    Wait Until Element Is Visible    ${PH_header_search_input}
    Wait Until Element Is Visible    ${PH_header_popular_searches_text}
    Wait Until Element Is Visible    ${PH_header_coupon_logo_link}
    Wait Until Element Is Visible    ${PH_header_coupon_text}

iPrice PH Homepage Categories Landing
    Wait Until Element Is Visible    ${PH_header_categories_clothing_link}
    Wait Until Element Is Visible    ${PH_header_categories_shoes_link}
    Wait Until Element Is Visible    ${PH_header_categories_bags_link}
    Wait Until Element Is Visible    ${PH_header_categories_watches_link}
    Wait Until Element Is Visible    ${PH_header_categories_jewellery_link}
    Wait Until Element Is Visible    ${PH_header_categories_computing_link}
    Wait Until Element Is Visible    ${PH_header_categories_phones_tablets_link}
    Wait Until Element Is Visible    ${PH_header_categories_gaming_link}
    Wait Until Element Is Visible    ${PH_header_categories_camera_photo_link}
    Wait Until Element Is Visible    ${PH_header_categories_tv_video_dvd_link}
    # Wait Until Element Is Visible    ${PH_header_categories_appliances_link}
    # Wait Until Element Is Visible    ${PH_header_categories_automotive_link}
    Mouse Over    ${PH_header_categories_clothing_link}
    Wait Until Element Is Visible    ${PH_header_categories_clothing_men}
    Wait Until Element Is Visible    ${PH_header_categories_clothing_women}
    Mouse Over    ${PH_header_categories_shoes_link}
    Wait Until Element Is Visible    ${PH_header_categories_shoes_men}
    Wait Until Element Is Visible    ${PH_header_categories_shoes_women}

iPrice PH Access Header Link
    Click Element    ${PH_header_logo_link}
    Sleep    1
    iPrice PH Homepage Landing

iPrice PH Search In Header    [Arguments]    ${itemNames}
    Input Text    ${PH_header_search_input}    ${itemNames}
    Click Element    ${PH_header_search_icon}
    Sleep    1

iPrice PH Search Page Landing    [Arguments]    ${itemNames}
    Title Should Be    ${itemNames} - Buy ${itemNames} online in Philippines | iPrice
    Wait Until Element Is Visible    //div[@id='products-header']//h1[text()='${itemNames}']

iPrice PH Access Coupons Link
    Click Element    ${PH_header_coupon_logo_link}
    Sleep    1
    iPrice PH Coupons Page Landing

iPrice PH Coupons Page Landing
    Title Should Be    ${PH_coupon_page_title}