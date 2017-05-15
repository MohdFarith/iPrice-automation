*** Settings ***
Documentation    This file will only store variables and keywords for SG.

*** Variables ***

${SG_homeURL}    https://iprice.sg/
${SG_homeTitle}    Online Shopping, Coupons & Discount Codes at iprice Singapore
${SG_header_logo_link}    //div[@id='logo']//a[@href='https://iprice.sg/']
${SG_header_search_input}    //div[@id='search']//input[@placeholder='Search for products, coupons or brands...']
${SG_header_search_icon}    //div[@id='search']//i[@class='icon icon-search-blue']
${SG_header_popular_searches_text}    //div[@id='popular-searches']//li[normalize-space(text())='Popular Searches:']
${SG_header_coupon_logo_link}    //div[@id='news-button']//a[@href='https://iprice.sg/coupons/']
${SG_header_coupon_text}    //div[@id='news-button']//button[normalize-space(text())='Coupons & Offers']
${SG_header_categories_clothing_link}    //div[@id='menu']//a[@href='https://iprice.sg/clothing/']//span[text()='Clothing']
${SG_header_categories_clothing_men}    //div[@id='menu']//a[contains(@href,'https://iprice.sg/clothing/men/') and text()='Men']
${SG_header_categories_clothing_women}    //div[@id='menu']//a[contains(@href,'https://iprice.sg/clothing/women/') and text()='Women']
${SG_header_categories_shoes_link}    //div[@id='menu']//a[@href='https://iprice.sg/shoes/']//span[text()='Shoes']
${SG_header_categories_shoes_men}    //div[@id='menu']//a[contains(@href,'https://iprice.sg/shoes/men/') and text()='Men']
${SG_header_categories_shoes_women}    //div[@id='menu']//a[contains(@href,'https://iprice.sg/shoes/women/') and text()='Women']
${SG_header_categories_bags_link}  //div[@id='menu']//a[@href='https://iprice.sg/bags/']//span[text()='Bags']
${SG_header_categories_watches_link}  //div[@id='menu']//a[@href='https://iprice.sg/watches/']//span[text()='Watches']
${SG_header_categories_jewellery_link}  //div[@id='menu']//a[@href='https://iprice.sg/jewellery/']//span[text()='Jewellery']
${SG_header_categories_computing_link}  //div[@id='menu']//a[@href='https://iprice.sg/computing/']//span[text()='Computing']
${SG_header_categories_phones_tablets_link}  //div[@id='menu']//a[@href='https://iprice.sg/phones-tablets/']//span[text()='Phones & Tablets']
${SG_header_categories_gaming_link}  //div[@id='menu']//a[@href='https://iprice.sg/gaming/']//span[text()='Gaming']
${SG_header_categories_camera_photo_link}  //div[@id='menu']//a[@href='https://iprice.sg/camera-photo/']//span[text()='Camera & Photo']
${SG_header_categories_tv_video_dvd_link}  //div[@id='menu']//a[@href='https://iprice.sg/tv-video-dvd/']//span[text()='TV, Video & DVD']
${SG_header_categories_appliances_link}  //div[@id='menu']//a[@href='https://iprice.sg/appliances/']//span[text()='Appliances']
${SG_header_categories_automotive_link}  //div[@id='menu']//a[@href='https://iprice.sg/automotive/']//span[text()='Automotive']

${SG_coupon_page_title}     Get Exclusive Sales, Promotions & Vouchers in 2017 | iPrice Singapore

*** Keywords ***

Get All Available Links In SG
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

Check All Links Response In SG
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
    \  Create Session  iprice  https://iprice.sg/  disable_warnings=0
    \  Sleep  1
    \  ${link}  Get From List  ${filter_link2}  ${INDEX}
    \  ${link2}  Replace String  ${link}  https://iprice.sg/  ${empty}
    \  ${link3}  Replace String  ${link2}  ${space}  ${empty}
    \  ${resp}  RequestsLibrary.Get Request  iprice  ${link3}
    \  ${status}  Run Keyword And Return Status  Should Be Equal As Strings  ${resp.status_code}  200
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to ${link} failed and not return 200.
    # \  Should Be Equal As Strings  ${resp.status_code}  200
    \  Delete All Sessions

SEO Check Internal Link In SG
    ${internal_links}   Create List
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link1_count}
    \  ${link}  Get From List  ${filter_link1}  ${INDEX}
    \  ${match}  Get Regexp Matches  ${link}  iprice.sg
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

Access iPrice SG Homepage
    Go To    ${SG_homeURL}
    Sleep    1
    iPrice SG Homepage Landing

iPrice SG Homepage Landing
    Title Should Be    ${SG_homeTitle}
    Wait Until Element Is Visible    ${SG_header_logo_link}
    Wait Until Element Is Visible    ${SG_header_search_input}
    Wait Until Element Is Visible    ${SG_header_popular_searches_text}
    Wait Until Element Is Visible    ${SG_header_coupon_logo_link}
    Wait Until Element Is Visible    ${SG_header_coupon_text}

iPrice SG Homepage Categories Landing
    Wait Until Element Is Visible    ${SG_header_categories_clothing_link}
    Wait Until Element Is Visible    ${SG_header_categories_shoes_link}
    Wait Until Element Is Visible    ${SG_header_categories_bags_link}
    Wait Until Element Is Visible    ${SG_header_categories_watches_link}
    Wait Until Element Is Visible    ${SG_header_categories_jewellery_link}
    Wait Until Element Is Visible    ${SG_header_categories_computing_link}
    Wait Until Element Is Visible    ${SG_header_categories_phones_tablets_link}
    Wait Until Element Is Visible    ${SG_header_categories_gaming_link}
    Wait Until Element Is Visible    ${SG_header_categories_camera_photo_link}
    Wait Until Element Is Visible    ${SG_header_categories_tv_video_dvd_link}
    # Wait Until Element Is Visible    ${SG_header_categories_appliances_link}
    # Wait Until Element Is Visible    ${SG_header_categories_automotive_link}
    Mouse Over    ${SG_header_categories_clothing_link}
    Wait Until Element Is Visible    ${SG_header_categories_clothing_men}
    Wait Until Element Is Visible    ${SG_header_categories_clothing_women}
    Mouse Over    ${SG_header_categories_shoes_link}
    Wait Until Element Is Visible    ${SG_header_categories_shoes_men}
    Wait Until Element Is Visible    ${SG_header_categories_shoes_women}

iPrice SG Access Header Link
    Click Element    ${SG_header_logo_link}
    Sleep    1
    iPrice SG Homepage Landing

iPrice SG Search In Header    [Arguments]    ${itemNames}
    Input Text    ${SG_header_search_input}    ${itemNames}
    Click Element    ${SG_header_search_icon}
    Sleep    1

iPrice SG Search Page Landing    [Arguments]    ${itemNames}
    Title Should Be    Search | iprice Singapore
    Wait Until Element Is Visible    //div[@id='products-header']//h1[text()='${itemNames}']

iPrice SG Access Coupons Link
    Click Element    ${SG_header_coupon_logo_link}
    Sleep    1
    iPrice SG Coupons Page Landing

iPrice SG Coupons Page Landing
    Title Should Be    ${SG_coupon_page_title}