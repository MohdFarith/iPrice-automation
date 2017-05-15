*** Settings ***
Documentation    This file will only store variables and keywords for TH.

*** Variables ***

${TH_homeURL}    https://ipricethailand.com/
${TH_homeTitle}    ipriceThailand - ค้นหา เช็กราคา ที่เดียวครบสุดคุ้ม
${TH_header_logo_link}    //div[@id='logo']//a[@href='https://ipricethailand.com/']
${TH_header_search_input}    //div[@id='search']//input[@placeholder='ค้นหาสินค้า,คูปองหรือแบรนด์...']
${TH_header_search_icon}    //div[@id='search']//i[@class='icon icon-search-blue']
${TH_header_popular_searches_text}    //div[@id='popular-searches']//li[normalize-space(text())='คำค้นหายอดนิยม:']
${TH_header_coupon_logo_link}    //div[@id='news-button']//a[@href='https://ipricethailand.com/coupons/']
${TH_header_coupon_text}    //div[@id='news-button']//*[(contains(text(),'คูปอง &') and (normalize-space(text()='ข้อเสนอ')))]
${TH_header_categories_clothing_link}    //div[@id='menu']//a[@href='https://ipricethailand.com/เครองแตงกาย/']//span[text()='เครื่องแต่งกาย']
${TH_header_categories_clothing_men}    //div[@id='menu']//a[contains(@href,'https://ipricethailand.com/เครองแตงกาย/ผชาย/') and text()='ผู้ชาย']
${TH_header_categories_clothing_women}    //div[@id='menu']//a[contains(@href,'https://ipricethailand.com/เครองแตงกาย/ผหญง/') and text()='ผู้หญิง']
${TH_header_categories_shoes_link}    //div[@id='menu']//a[@href='https://ipricethailand.com/รองเทา/']//span[text()='รองเท้า']
${TH_header_categories_shoes_men}    //div[@id='menu']//a[contains(@href,'https://ipricethailand.com/รองเทา/ผชาย/') and text()='ผู้ชาย']
${TH_header_categories_shoes_women}    //div[@id='menu']//a[contains(@href,'https://ipricethailand.com/รองเทา/ผหญง/') and text()='ผู้หญิง']
${TH_header_categories_bags_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/กระเปา/']//span[text()='กระเป๋า']
${TH_header_categories_watches_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/นาฬกาขอมอ/']//span[text()='นาฬิกาข้อมือ']
${TH_header_categories_jewellery_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/เครองประดบ/']//span[text()='เครื่องประดับ']
${TH_header_categories_computing_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/อปกรณคอมพวเตอร/']//span[text()='อุปกรณ์คอมพิวเตอร์']
${TH_header_categories_phones_tablets_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/โทรศพทและแทบเลต/']//span[text()='โทรศัพท์และแท็บเล็ต']
${TH_header_categories_gaming_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/เครองเลนเกมส/']//span[text()='เครื่องเล่นเกมส์']
${TH_header_categories_camera_photo_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/กลองถายรปและรปภาพ/']//span[text()='กล้องถ่ายรูปและรูปภาพ']
# ${TH_header_categories_tv_video_dvd_link}  //div[@id='menu']//a[@href='https://iprice.hk/tv-video-dvd/']//span[text()='TV, Video & DVD']
# ${TH_header_categories_appliances_link}  //div[@id='menu']//a[@href='https://iprice.hk/appliances/']//span[text()='Appliances']
# ${TH_header_categories_automotive_link}  //div[@id='menu']//a[@href='https://iprice.hk/automotive/']//span[text()='Automotive']

${TH_coupon_page_title}    แจก ดีล คูปอง รหัสส่วนลด บัตรส่วนลด โปรโมชั่น  ที่ iprice ประเทศไทย

*** Keywords ***

Get All Available Links In TH
    ${AllLinksCount}  Get Matching Xpath Count  //a
    ${LinkItems}  Create List

    :FOR  ${INDEX}  IN RANGE  1  ${AllLinksCount}
    \  ${href}  Get Element Attribute  xpath=(//a)[${INDEX}]@href
    \  Run Keyword If  "${href}"!="None"  Append To list  ${LinkItems}  ${href}

    ${LinkItemsCount}  Get Length  ${LinkItems}
    ${filter_link1}  Create List
    Set Suite Variable  ${filter_link2}
    ${filter_link2}  Create List
    Set Suite Variable  ${filter_link2}

    :FOR  ${INDEX}  IN RANGE  0  ${LinkItemsCount}
    \  ${url}  Get From List  ${LinkItems}  ${INDEX}
    \  ${match}  Get Regexp Matches  ${url}  r/pc
    \  ${matchCount}  Get Length  ${match}
    \  Run Keyword If  ${matchCount}>0  Append To List  ${filter_link2}  ${url}
    \  ...  ELSE  Append To List  ${filter_link1}  ${url}

    ${filter_link1_count}  Get Length  ${filter_link1}
    Set Suite Variable  ${filter_link2_count}
    ${filter_link2_count}  Get Length  ${filter_link2}
    Set Suite Variable  ${filter_link2_count}

Check All Links Response In TH
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
    \  Create Session  iprice  https://ipricethailand.com/  disable_warnings=0
    \  Sleep  1
    \  ${link}  Get From List  ${filter_link2}  ${INDEX}
    \  ${link2}  Replace String  ${link}  https://ipricethailand.com/  ${empty}
    \  ${link3}  Replace String  ${link2}  ${space}  ${empty}
    \  ${resp}  RequestsLibrary.Get Request  iprice  ${link3}
    \  ${status}  Run Keyword And Return Status  Should Be Equal As Strings  ${resp.status_code}  200
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to ${link} failed and not return 200.
    # \  Should Be Equal As Strings  ${resp.status_code}  200
    \  Delete All Sessions

SEO Check Internal Link In TH
    ${internal_links}   Create List
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link1_count}
    \  ${link}  Get From List  ${filter_link1}  ${INDEX}
    \  ${match}  Get Regexp Matches  ${link}  ipricethailand.com
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

Access iPrice TH Homepage
    Go To    ${TH_homeURL}
    Sleep    1
    iPrice TH Homepage Landing

iPrice TH Homepage Landing
    Title Should Be    ${TH_homeTitle}
    Wait Until Element Is Visible    ${TH_header_logo_link}
    Wait Until Element Is Visible    ${TH_header_search_input}
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${TH_header_popular_searches_text}
    Wait Until Element Is Visible    ${TH_header_coupon_logo_link}
    Wait Until Element Is Visible    ${TH_header_coupon_text}

iPrice TH Homepage Categories Landing
    Wait Until Element Is Visible    ${TH_header_categories_clothing_link}
    Wait Until Element Is Visible    ${TH_header_categories_shoes_link}
    Wait Until Element Is Visible    ${TH_header_categories_bags_link}
    Wait Until Element Is Visible    ${TH_header_categories_watches_link}
    Wait Until Element Is Visible    ${TH_header_categories_jewellery_link}
    Wait Until Element Is Visible    ${TH_header_categories_computing_link}
    Wait Until Element Is Visible    ${TH_header_categories_phones_tablets_link}
    Wait Until Element Is Visible    ${TH_header_categories_gaming_link}
    Wait Until Element Is Visible    ${TH_header_categories_camera_photo_link}
    # Wait Until Element Is Visible    ${TH_header_categories_tv_video_dvd_link}
    # Wait Until Element Is Visible    ${TH_header_categories_appliances_link}
    # Wait Until Element Is Visible    ${TH_header_categories_automotive_link}
    Mouse Over    ${TH_header_categories_clothing_link}
    Wait Until Element Is Visible    ${TH_header_categories_clothing_men}
    Wait Until Element Is Visible    ${TH_header_categories_clothing_women}
    Mouse Over    ${TH_header_categories_shoes_link}
    Wait Until Element Is Visible    ${TH_header_categories_shoes_men}
    Wait Until Element Is Visible    ${TH_header_categories_shoes_women}

iPrice TH Access Header Link
    Click Element    ${TH_header_logo_link}
    Sleep    1
    iPrice TH Homepage Landing

iPrice TH Search In Header    [Arguments]    ${itemNames}
    Input Text    ${TH_header_search_input}    ${itemNames}
    Click Element    ${TH_header_search_icon}
    Sleep    1

iPrice TH Search Page Landing    [Arguments]    ${itemNames}
    Title Should Be    ค้นหา | iprice ประเทศไทย
    Wait Until Element Is Visible    //div[@id='products-header']//h1[text()='${itemNames}']

iPrice TH Access Coupons Link
    Click Element    ${TH_header_coupon_logo_link}
    Sleep    1
    iPrice TH Coupons Page Landing

iPrice TH Coupons Page Landing
    Title Should Be    ${TH_coupon_page_title}
