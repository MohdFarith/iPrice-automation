*** Settings ***
Documentation  This file will only store variables and keywords for MY.

*** Variables ***

${MY_homeURL}  https://iprice.my/
${MY_homeTitle}  Online Shopping, Coupons & Discount Codes at iprice Malaysia
${MY_header_logo_link}  //div[@id='logo']//a[@href='https://iprice.my/']
${MY_header_search_input}  //div[@id='search']//input[@placeholder='Search for products, coupons or brands...']
${MY_header_search_icon}  //div[@id='search']//i[@class='icon icon-search-blue']
${MY_header_popular_searches_text}  //div[@id='popular-searches']//li[normalize-space(text())='Popular Searches:']
${MY_header_coupon_logo_link}  //div[@id='news-button']//a[@href='https://iprice.my/coupons/']
${MY_header_coupon_text}  //div[@id='news-button']//button[normalize-space(text())='Coupons & Offers']
${MY_header_categories_clothing_link}  //div[@id='menu']//a[@href='https://iprice.my/clothing/']//span[text()='Clothing']
${MY_header_categories_clothing_men}  //div[@id='menu']//a[contains(@href,'https://iprice.my/clothing/men/') and text()='Men']
${MY_header_categories_clothing_women}  //div[@id='menu']//a[contains(@href,'https://iprice.my/clothing/women/') and text()='Women']
${MY_header_categories_shoes_link}  //div[@id='menu']//a[@href='https://iprice.my/shoes/']//span[text()='Shoes']
${MY_header_categories_shoes_men}  //div[@id='menu']//a[contains(@href,'https://iprice.my/shoes/men/') and text()='Men']
${MY_header_categories_shoes_women}  //div[@id='menu']//a[contains(@href,'https://iprice.my/shoes/women/') and text()='Women']
${MY_header_categories_bags_link}  //div[@id='menu']//a[@href='https://iprice.my/bags/']//span[text()='Bags']
${MY_header_categories_watches_link}  //div[@id='menu']//a[@href='https://iprice.my/watches/']//span[text()='Watches']
${MY_header_categories_jewellery_link}  //div[@id='menu']//a[@href='https://iprice.my/jewellery/']//span[text()='Jewellery']
${MY_header_categories_computing_link}  //div[@id='menu']//a[@href='https://iprice.my/computing/']//span[text()='Computing']
${MY_header_categories_phones_tablets_link}  //div[@id='menu']//a[@href='https://iprice.my/phones-tablets/']//span[text()='Phones & Tablets']
${MY_header_categories_gaming_link}  //div[@id='menu']//a[@href='https://iprice.my/gaming/']//span[text()='Gaming']
${MY_header_categories_camera_photo_link}  //div[@id='menu']//a[@href='https://iprice.my/camera-photo/']//span[text()='Camera & Photo']
${MY_header_categories_tv_video_dvd_link}  //div[@id='menu']//a[@href='https://iprice.my/tv-video-dvd/']//span[text()='TV, Video & DVD']
${MY_header_categories_appliances_link}  //div[@id='menu']//a[@href='https://iprice.my/appliances/']//span[text()='Appliances']
${MY_header_categories_automotive_link}  //div[@id='menu']//a[@href='https://iprice.my/automotive/']//span[text()='Automotive']
${MY_header_categories_hobbies_link}  //div[@id='menu']//a[@href='https://iprice.my/hobbies/']//span[text()='Hobbies']
${MY_header_categories_audio_hifi_link}  //div[@id='menu']//a[@href='https://iprice.my/audio-hi-fi/']//span[text()='Audio & Hi Fi']
${MY_header_categories_action_sport_link}  //div[@id='menu']//a[@href='https://iprice.my/action-sports/']//span[text()='Action Sports']
${MY_header_categories_adventure_link}  //div[@id='menu']//a[@href='https://iprice.my/adventure/']//span[text()='Adventure']
${MY_header_categories_baby_clothing_link}  //div[@id='menu']//a[@href='https://iprice.my/baby-clothing/']//span[text()='Baby Clothing']
${MY_header_categories_baby_gear_link}  //div[@id='menu']//a[@href='https://iprice.my/baby-gear/']//span[text()='Baby Gear']
${MY_header_categories_bath_body_link}  //div[@id='menu']//a[@href='https://iprice.my/bath-body/]//span[text()='Bath & Body']

${MY_product_images}  //img[contains(@class,'lazy product-img')]

${MY_coupon_page_title}  Get Exclusive Coupons, Discount Codes & Vouchers in 2017 | iPrice Malaysia

*** Keywords ***

Get All Available Links In MY
    ${AllLinksCount}  Get Matching Xpath Count  //a
    ${LinkItems}  Create List
    Set Suite Variable  ${LinkItems}

    :FOR  ${INDEX}  IN RANGE  1  ${AllLinksCount}
    \  ${href}  Get Element Attribute  xpath=(//a)[${INDEX}]@href
    \  Run Keyword If  "${href}"!="None"  Append To list  ${LinkItems}  ${href}

    ${LinkItemsCount}  Get Length  ${LinkItems}
    Set Suite Variable  ${LinkItemsCount}
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

Check All Links Response In MY
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
    \  Create Session  iprice  https://iprice.my/  disable_warnings=0
    \  Sleep  1
    \  ${link}  Get From List  ${filter_link2}  ${INDEX}
    \  ${link2}  Replace String  ${link}  https://iprice.my/  ${empty}
    \  ${link3}  Replace String  ${link2}  ${space}  ${empty}
    \  ${resp}  RequestsLibrary.Get Request  iprice  ${link3}
    \  ${status}  Run Keyword And Return Status  Should Be Equal As Strings  ${resp.status_code}  200
    \  ${status}  Run Keyword And Return Status  Should Be Equal As Strings  ${resp.status_code}  200
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to ${link} failed and not return 200.
    # \  Should Be Equal As Strings  ${resp.status_code}  200
    \  Delete All Sessions

SEO Check Internal Link In MY
    ${internal_links}   Create List
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link1_count}
    \  ${link}  Get From List  ${filter_link1}  ${INDEX}
    \  ${match}  Get Regexp Matches  ${link}  iprice.my
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
    ${match}  Get Matching Xpath Count  ${MY_product_images}
    Run Keyword If  "${match}"!="${imageCount}"  Run Keyword And Continue On Failure  Fail  Images count wrong.
    :FOR  ${INDEX}  IN RANGE  1  ${imageCount}
    \  ${altImages}  Get Element Attribute  xpath=(${MY_product_images})[${INDEX}]@alt
    \  Run Keyword If  "${altImages}"=="None"  Run Keyword And Continue On Failure  Fail  Image does not contains alt.

Access iPrice MY Homepage
    Go To    ${MY_homeURL}
    Sleep    1

iPrice MY Homepage Landing
    Title Should Be    ${MY_homeTitle}
    Wait Until Element Is Visible    ${MY_header_logo_link}
    Wait Until Element Is Visible    ${MY_header_search_input}
    Wait Until Element Is Visible    ${MY_header_popular_searches_text}
    Wait Until Element Is Visible    ${MY_header_coupon_logo_link}
    Wait Until Element Is Visible    ${MY_header_coupon_text}

iPrice MY Homepage Categories Landing
    Wait Until Element Is Visible    ${MY_header_categories_clothing_link}
    Wait Until Element Is Visible    ${MY_header_categories_shoes_link}
    Wait Until Element Is Visible    ${MY_header_categories_bags_link}
    Wait Until Element Is Visible    ${MY_header_categories_watches_link}
    Wait Until Element Is Visible    ${MY_header_categories_jewellery_link}
    Wait Until Element Is Visible    ${MY_header_categories_computing_link}
    Wait Until Element Is Visible    ${MY_header_categories_phones_tablets_link}
    Wait Until Element Is Visible    ${MY_header_categories_gaming_link}
    Wait Until Element Is Visible    ${MY_header_categories_camera_photo_link}
    Wait Until Element Is Visible    ${MY_header_categories_tv_video_dvd_link}
    Wait Until Page COntains Element    ${MY_header_categories_appliances_link}
    Wait Until Page COntains Element    ${MY_header_categories_automotive_link}
    Wait Until Page COntains Element  ${MY_header_categories_hobbies_link}
    Wait Until Page COntains Element  ${MY_header_categories_audio_hifi_link}
    Wait Until Page COntains Element  ${MY_header_categories_action_sport_link}
    Wait Until Page COntains Element  ${MY_header_categories_adventure_link}
    Wait Until Page COntains Element  ${MY_header_categories_baby_clothing_link}
    Wait Until Page COntains Element  ${MY_header_categories_baby_gear_link}
    Wait Until Page COntains Element  ${MY_header_categories_bath_body_link}
    Mouse Over    ${MY_header_categories_clothing_link}
    Wait Until Element Is Visible    ${MY_header_categories_clothing_men}
    Wait Until Element Is Visible    ${MY_header_categories_clothing_women}
    Mouse Over    ${MY_header_categories_shoes_link}
    Wait Until Element Is Visible    ${MY_header_categories_shoes_men}
    Wait Until Element Is Visible    ${MY_header_categories_shoes_women}

iPrice MY Access Header Link
    Click Element    ${MY_header_logo_link}
    Sleep    1
    iPrice MY Homepage Landing

iPrice MY Search In Header    [Arguments]    ${itemNames}
    Input Text    ${MY_header_search_input}    ${itemNames}
    Click Element    ${MY_header_search_icon}
    Sleep    1

iPrice MY Search Page Landing    [Arguments]    ${itemNames}
    Title Should Be    ${itemNames} - Buy ${itemNames} online in Malaysia | iPrice
    Wait Until Element Is Visible    //div[@id='products-header']//h1[text()='${itemNames}']

iPrice MY Access Coupons Link
    Click Element    ${MY_header_coupon_logo_link}
    Sleep    1
    iPrice MY Coupons Page Landing

iPrice MY Coupons Page Landing
    Title Should Be    ${MY_coupon_page_title}