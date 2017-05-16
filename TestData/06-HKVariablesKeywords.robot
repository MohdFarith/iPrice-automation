*** Settings ***
Documentation    This file will only store variables and keywords for HK..

*** Variables ***

${HK_homeURL}    https://iprice.hk/
${HK_homeTitle}    Online Shopping, Coupons & Discount Codes at iprice Hong Kong
${HK_header_logo_link}    //div[@id='logo']//a[@href='https://iprice.hk/']
${HK_header_search_input}    //div[@id='search']//input[@placeholder='Search for products, coupons or brands...']
${HK_header_search_icon}    //div[@id='search']//i[@class='icon icon-search-blue']
${HK_header_popular_searches_text}    //div[@id='popular-searches']//li[normalize-space(text())='Popular Searches:']
${HK_header_coupon_logo_link}    //div[@id='news-button']//a[@href='https://iprice.hk/coupons/']
${HK_header_coupon_text}    //div[@id='news-button']//button[normalize-space(text())='Coupons & Offers']
${HK_header_categories_clothing_link}    //div[@id='menu']//a[@href='https://iprice.hk/clothing/']//span[text()='Clothing']
${HK_header_categories_clothing_men}    //div[@id='menu']//a[contains(@href,'https://iprice.hk/clothing/men/') and text()='Men']
${HK_header_categories_clothing_women}    //div[@id='menu']//a[contains(@href,'https://iprice.hk/clothing/women/') and text()='Women']
${HK_header_categories_shoes_link}    //div[@id='menu']//a[@href='https://iprice.hk/shoes/']//span[text()='Shoes']
${HK_header_categories_shoes_men}    //div[@id='menu']//a[contains(@href,'https://iprice.hk/shoes/men/') and text()='Men']
${HK_header_categories_shoes_women}    //div[@id='menu']//a[contains(@href,'https://iprice.hk/shoes/women/') and text()='Women']
${HK_header_categories_bags_link}  //div[@id='menu']//a[@href='https://iprice.hk/bags/']//span[text()='Bags']
${HK_header_categories_watches_link}  //div[@id='menu']//a[@href='https://iprice.hk/watches/']//span[text()='Watches']
${HK_header_categories_jewellery_link}  //div[@id='menu']//a[@href='https://iprice.hk/jewellery/']//span[text()='Jewellery']
${HK_header_categories_computing_link}  //div[@id='menu']//a[@href='https://iprice.hk/computing/']//span[text()='Computing']
${HK_header_categories_phones_tablets_link}  //div[@id='menu']//a[@href='https://iprice.hk/phones-tablets/']//span[text()='Phones & Tablets']
${HK_header_categories_gaming_link}  //div[@id='menu']//a[@href='https://iprice.hk/gaming/']//span[text()='Gaming']
${HK_header_categories_camera_photo_link}  //div[@id='menu']//a[@href='https://iprice.hk/camera-photo/']//span[text()='Camera & Photo']
${HK_header_categories_tv_video_dvd_link}  //div[@id='menu']//a[@href='https://iprice.hk/tv-video-dvd/']//span[text()='TV, Video & DVD']
${HK_header_categories_appliances_link}  //div[@id='menu']//a[@href='https://iprice.hk/appliances/']//span[text()='Appliances']
${HK_header_categories_automotive_link}  //div[@id='menu']//a[@href='https://iprice.hk/automotive/']//span[text()='Automotive']

${HK_product_images}  //img[contains(@class,'lazy product-img')]

${HK_coupon_page_title}     Get Exclusive Sales, Coupons & Promotions in 2017 | iPrice Hong Kong

*** Keywords ***

Get All Available Links In HK
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

Check All Links Response In HK
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
    \  Create Session  iprice  https://iprice.hk/  disable_warnings=0
    \  Sleep  1
    \  ${link}  Get From List  ${filter_link2}  ${INDEX}
    \  ${link2}  Replace String  ${link}  https://iprice.hk/  ${empty}
    \  ${link3}  Replace String  ${link2}  ${space}  ${empty}
    \  ${resp}  RequestsLibrary.Get Request  iprice  ${link3}
    \  ${status}  Run Keyword And Return Status  Should Be Equal As Strings  ${resp.status_code}  200
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to ${link} failed and not return 200.
    # \  Should Be Equal As Strings  ${resp.status_code}  200
    \  Delete All Sessions

SEO Check Internal Link In HK
    ${internal_links}   Create List
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link1_count}
    \  ${link}  Get From List  ${filter_link1}  ${INDEX}
    \  ${match}  Get Regexp Matches  ${link}  iprice.hk
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

SEO Check Images ALT  [Arguments]  ${imageCount}
    ${match}  Get Matching Xpath Count  ${HK_product_images}
    Run Keyword If  "${match}"!="${imageCount}"  Run Keyword And Continue On Failure  Fail  Images count wrong.
    :FOR  ${INDEX}  IN RANGE  1  ${imageCount}
    \  ${altImages}  Get Element Attribute  xpath=(${HK_product_images})[${INDEX}]@alt
    \  Run Keyword If  "${altImages}"=="None"  Run Keyword And Continue On Failure  Fail  Image does not contains alt.

Access iPrice HK Homepage
    Go To    ${HK_homeURL}
    Sleep    1
    iPrice HK Homepage Landing

iPrice HK Homepage Landing
    Title Should Be    ${HK_homeTitle}
    Wait Until Element Is Visible    ${HK_header_logo_link}
    Wait Until Element Is Visible    ${HK_header_search_input}
    Wait Until Element Is Visible    ${HK_header_popular_searches_text}
    Wait Until Element Is Visible    ${HK_header_coupon_logo_link}
    Wait Until Element Is Visible    ${HK_header_coupon_text}

iPrice HK Homepage Categories Landing
    Wait Until Element Is Visible    ${HK_header_categories_clothing_link}
    Wait Until Element Is Visible    ${HK_header_categories_shoes_link}
    Wait Until Element Is Visible    ${HK_header_categories_bags_link}
    Wait Until Element Is Visible    ${HK_header_categories_watches_link}
    Wait Until Element Is Visible    ${HK_header_categories_jewellery_link}
    Wait Until Element Is Visible    ${HK_header_categories_computing_link}
    Wait Until Element Is Visible    ${HK_header_categories_phones_tablets_link}
    Wait Until Element Is Visible    ${HK_header_categories_gaming_link}
    Wait Until Element Is Visible    ${HK_header_categories_camera_photo_link}
    Wait Until Element Is Visible    ${HK_header_categories_tv_video_dvd_link}
    # Wait Until Element Is Visible    ${HK_header_categories_appliances_link}
    # Wait Until Element Is Visible    ${HK_header_categories_automotive_link}
    Mouse Over    ${HK_header_categories_clothing_link}
    Wait Until Element Is Visible    ${HK_header_categories_clothing_men}
    Wait Until Element Is Visible    ${HK_header_categories_clothing_women}
    Mouse Over    ${HK_header_categories_shoes_link}
    Wait Until Element Is Visible    ${HK_header_categories_shoes_men}
    Wait Until Element Is Visible    ${HK_header_categories_shoes_women}

iPrice HK Access Header Link
    Click Element    ${HK_header_logo_link}
    Sleep    1
    iPrice HK Homepage Landing

iPrice HK Search In Header    [Arguments]    ${itemNames}
    Input Text    ${HK_header_search_input}    ${itemNames}
    Click Element    ${HK_header_search_icon}
    Sleep    1

iPrice HK Search Page Landing    [Arguments]    ${itemNames}
    Title Should Be    Search | iprice Hong Kong
    Wait Until Element Is Visible    //div[@id='products-header']//h1[text()='${itemNames}']

iPrice HK Access Coupons Link
    Click Element    ${HK_header_coupon_logo_link}
    Sleep    1
    iPrice HK Coupons Page Landing

iPrice HK Coupons Page Landing
    Title Should Be    ${HK_coupon_page_title}