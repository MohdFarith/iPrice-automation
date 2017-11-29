*** Settings ***
Documentation  This file will only store keywords for homepage.
*** Variables ***

*** Keywords ***

Access iPrice Homepage  [Arguments]  ${country}
    Run Keyword If  "${country}"=="my"  Go To  ${MY_homeURL}
    ...  ELSE IF  "${country}"=="vn"  Go To  ${VN_homeURL}
    ...  ELSE IF  "${country}"=="id"  Go To  ${ID_homeURL}
    ...  ELSE IF  "${country}"=="sg"  Go To  ${SG_homeURL}
    ...  ELSE IF  "${country}"=="ph"  Go To  ${PH_homeURL}
    ...  ELSE IF  "${country}"=="hk"  Go To  ${HK_homeURL}
    ...  ELSE IF  "${country}"=="th"  Go To  ${TH_homeURL}
    Sleep  2
    Run Keyword If  "${country}"=="my"  Run Keyword And Continue On Failure  Title Should Be  ${MY_homeTitle}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Title Should Be  ${VN_homeTitle}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Title Should Be  ${ID_homeTitle}
    ...  ELSE IF  "${country}"=="sg"  Run Keyword And Continue On Failure  Title Should Be  ${SG_homeTitle}
    ...  ELSE IF  "${country}"=="ph"  Run Keyword And Continue On Failure  Title Should Be  ${PH_homeTitle}
    ...  ELSE IF  "${country}"=="hk"  Run Keyword And Continue On Failure  Title Should Be  ${HK_homeTitle}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Title Should Be  ${TH_homeTitle}

Get All Available Links In Homepage
    ${AllLinksCount}  Get Matching Xpath Count  //a
    ${LinkItems}  Create List
    Set Suite Variable  ${LinkItems}

    :FOR  ${INDEX}  IN RANGE  1  ${AllLinksCount}
    \  ${href}  Selenium2Library.Get Element Attribute  xpath=(//a)[${INDEX}]@href
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
    Log  ${filter_link1}
    Log  ${filter_link2}

Check All Links Response In Homepage  [Arguments]  ${country}
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link1_count}
    \  ${link}  Get From List  ${filter_link1}  ${INDEX}
    \  ${status}  Run Keyword And Return Status   HttpLibrary.HTTP.Get  ${link}
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to ${link} failed and not return 200.
    Run Keyword If  ${filter_link2_count}>0  Check Redirection URL  ${country}

Check Redirection URL  [Arguments]  ${country}
    Sleep  2
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link2_count}
    \  Run Keyword If  "${country}"=="my"  Create Session  iprice  ${MY_homeURL}  disable_warnings=0
    \  ...  ELSE IF  "${country}"=="vn"  Create Session  iprice  ${VN_homeURL}  disable_warnings=0
    \  ...  ELSE IF  "${country}"=="id"  Create Session  iprice  ${ID_homeURL}  disable_warnings=0
    \  ...  ELSE IF  "${country}"=="sg"  Create Session  iprice  ${SG_homeURL}  disable_warnings=0
    \  ...  ELSE IF  "${country}"=="ph"  Create Session  iprice  ${PH_homeURL}  disable_warnings=0
    \  ...  ELSE IF  "${country}"=="hk"  Create Session  iprice  ${HK_homeURL}  disable_warnings=0
    \  ...  ELSE IF  "${country}"=="th"  Create Session  iprice  ${TH_homeURL}  disable_warnings=0
    \  Sleep  1
    \  ${link}  Get From List  ${filter_link2}  ${INDEX}
    \  ${link2}  Run Keyword If  "${country}"=="my"  Replace String  ${link}  ${MY_homeURL}  ${empty}
    \  ...  ELSE IF  "${country}"=="vn"  Replace String  ${link}  ${VN_homeURL}  ${empty}
    \  ...  ELSE IF  "${country}"=="id"  Replace String  ${link}  ${ID_homeURL}  ${empty}
    \  ...  ELSE IF  "${country}"=="sg"  Replace String  ${link}  ${SG_homeURL}  ${empty}
    \  ...  ELSE IF  "${country}"=="ph"  Replace String  ${link}  ${PH_homeURL}  ${empty}
    \  ...  ELSE IF  "${country}"=="hk"  Replace String  ${link}  ${HK_homeURL}  ${empty}
    \  ...  ELSE IF  "${country}"=="th"  Replace String  ${link}  ${TH_homeURL}  ${empty}
    \  ${link3}  Replace String  ${link2}  ${space}  ${empty}
    \  ${link4}  Replace String  ${link3}  %3Fnocache%3D1  ${empty}
    \  ${link5}  Replace String  ${link4}  ${space}  ${empty}
    \  ${resp}  RequestsLibrary.Get Request  iprice  ${link5}  allow_redirects=True
    \  Run Keyword If  "${resp.status_code}" == "403"  Retry Check Redirection URL  ${country}  ${link5}
    \  ...  ELSE IF  "${resp.status_code}" == "404" and "${country}" == "my"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.my/${link5} failed and not return 200.
    \  ...  ELSE IF  "${resp.status_code}" == "404" and "${country}"=="vn"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.vn/${link5} failed and not return 200.
    \  ...  ELSE IF  "${resp.status_code}" == "404" and "${country}"=="id"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.co.id/${link5} failed and not return 200.
    \  ...  ELSE IF  "${resp.status_code}" == "404" and "${country}"=="sg"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.sg/${link5} failed and not return 200.
    \  ...  ELSE IF  "${resp.status_code}" == "404" and "${country}"=="ph"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.ph/${link5} failed and not return 200.
    \  ...  ELSE IF  "${resp.status_code}" == "404" and "${country}"=="hk"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.hk/${link5} failed and not return 200.
    \  ...  ELSE IF  "${resp.status_code}" == "404" and "${country}"=="th"  Run Keyword And Continue On Failure  Fail  Request to https://ipricethailand.com/${link5} failed and not return 200.
    \  Delete All Sessions

Retry Check Redirection URL  [Arguments]  ${country}  ${link5}
    :FOR  ${INDEX}  IN RANGE  0  500
    \  Delete All Sessions
    \  Run Keyword If  "${country}"=="my"  Create Session  iprice  ${MY_homeURL}  disable_warnings=0
    \  ...  ELSE IF  "${country}"=="vn"  Create Session  iprice  ${VN_homeURL}  disable_warnings=0
    \  ...  ELSE IF  "${country}"=="id"  Create Session  iprice  ${ID_homeURL}  disable_warnings=0
    \  ...  ELSE IF  "${country}"=="sg"  Create Session  iprice  ${SG_homeURL}  disable_warnings=0
    \  ...  ELSE IF  "${country}"=="ph"  Create Session  iprice  ${PH_homeURL}  disable_warnings=0
    \  ...  ELSE IF  "${country}"=="hk"  Create Session  iprice  ${HK_homeURL}  disable_warnings=0
    \  ...  ELSE IF  "${country}"=="th"  Create Session  iprice  ${TH_homeURL}  disable_warnings=0
    \  ${resp}  RequestsLibrary.Get Request  iprice  ${link5}  allow_redirects=True
    \  Run Keyword If  "${resp.status_code}" == "404" and "${country}" == "my"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.my/${link5} failed and not return 200.
    \  ...  ELSE IF  "${resp.status_code}" == "404" and "${country}"=="vn"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.vn/${link5} failed and not return 200.
    \  ...  ELSE IF  "${resp.status_code}" == "404" and "${country}"=="id"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.co.id/${link5} failed and not return 200.
    \  ...  ELSE IF  "${resp.status_code}" == "404" and "${country}"=="sg"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.sg/${link5} failed and not return 200.
    \  ...  ELSE IF  "${resp.status_code}" == "404" and "${country}"=="ph"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.ph/${link5} failed and not return 200.
    \  ...  ELSE IF  "${resp.status_code}" == "404" and "${country}"=="hk"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.hk/${link5} failed and not return 200.
    \  ...  ELSE IF  "${resp.status_code}" == "404" and "${country}"=="th"  Run Keyword And Continue On Failure  Fail  Request to https://ipricethailand.com/${link5} failed and not return 200.
    \  ...  ELSE IF  "${resp.status_code}" == "200"  Exit For Loop

iPrice Homepage Courtesy Validation  [Arguments]  ${country}
    Run Keyword If  "${country}"=="my"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_courtesy_products}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_courtesy_products}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_courtesy_products}
    ...  ELSE IF  "${country}"=="sg"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_courtesy_products}
    ...  ELSE IF  "${country}"=="ph"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_courtesy_products}
    ...  ELSE IF  "${country}"=="hk"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_courtesy_products}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_courtesy_products}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Run Keyword And Continue On Failure  Element Should Be Visible  ${EN_courtesy_products_highlight}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_courtesy_products_highlight}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_courtesy_products_highlight}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_courtesy_products_highlight}
    Run Keyword If  "${country}"=="my"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_courtesy_coupons}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_courtesy_coupons}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_courtesy_coupons}
    ...  ELSE IF  "${country}"=="sg"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_courtesy_coupons}
    ...  ELSE IF  "${country}"=="ph"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_courtesy_coupons}
    ...  ELSE IF  "${country}"=="hk"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_courtesy_coupons}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_courtesy_coupons}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${EN_courtesy_coupons_highlight}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${VN_courtesy_coupons_highlight}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${ID_courtesy_coupons_highlight}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${TH_courtesy_coupons_highlight}
    Run Keyword If  "${country}"=="my"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_courtesy_trends}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_courtesy_trends}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_courtesy_trends}
    ...  ELSE IF  "${country}"=="sg"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_courtesy_trends}
    ...  ELSE IF  "${country}"=="ph"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_courtesy_trends}
    ...  ELSE IF  "${country}"=="hk"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_courtesy_trends}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_courtesy_trends}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${en_courtesy_trends_highlight}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${VN_courtesy_trends_highlight}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${ID_courtesy_trends_highlight}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${TH_courtesy_trends_highlight}

iPrice Header Validation  [Arguments]  ${country}
    Run Keyword If  "${country}"=="my"  Element Should Be Visible  ${MY_header_logo_link}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_header_logo_link}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_header_logo_link}
    ...  ELSE IF  "${country}"=="sg"  Element Should Be Visible  ${SG_header_logo_link}
    ...  ELSE IF  "${country}"=="ph"  Element Should Be Visible  ${PH_header_logo_link}
    ...  ELSE IF  "${country}"=="hk"  Element Should Be Visible  ${HK_header_logo_link}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_header_logo_link}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Element Should Be Visible  ${EN_header_search_compare_save}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_header_search_compare_save}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_header_search_compare_save}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_header_search_compare_save}
    Run Keyword If  "${country}"=="my"  Element Should Be Visible  ${MY_header_search_input}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_header_search_input}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_header_search_input}
    ...  ELSE IF  "${country}"=="sg"  Element Should Be Visible  ${SG_header_search_input}
    ...  ELSE IF  "${country}"=="ph"  Element Should Be Visible  ${PH_header_search_input}
    ...  ELSE IF  "${country}"=="hk"  Element Should Be Visible  ${HK_header_search_input}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_header_search_input}
    Element Should Be Visible  ${header_search_icon}

iPrice Products Mega Menu Validation  [Arguments]  ${country}
    Element Should Be Visible  ${products_mega_menu_electronics_icon}
    Element Should Be Visible  ${products_mega_menu_fashion_icon}
    Element Should Be Visible  ${products_mega_menu_sports_outdoors_icon}
    Element Should Be Visible  ${products_mega_menu_home_living_icon}
    Element Should Be Visible  ${products_mega_menu_kid_toys_icon}
    Element Should Be Visible  ${products_mega_menu_health_beauty_icon}
    Element Should Be Visible  ${products_mega_menu_automotive_icon}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Element Should Be Visible  ${EN_products_mega_menu_electronics}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_products_mega_menu_electronics}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_products_mega_menu_electronics}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_products_mega_menu_electronics}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Element Should Be Visible  ${EN_products_mega_menu_fashion}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_products_mega_menu_fashion}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_products_mega_menu_fashion}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_products_mega_menu_fashion}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Element Should Be Visible  ${EN_products_mega_menu_sports_outdoors}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_products_mega_menu_sports_outdoors}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_products_mega_menu_sports_outdoors}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_products_mega_menu_sports_outdoors}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Element Should Be Visible  ${EN_products_mega_menu_home_living}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_products_mega_menu_home_living}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_products_mega_menu_home_living}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_products_mega_menu_home_living}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Element Should Be Visible  ${EN_products_mega_menu_kids_toys}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_products_mega_menu_kids_toys}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_products_mega_menu_kids_toys}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_products_mega_menu_kids_toys}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Element Should Be Visible  ${EN_products_mega_menu_health_beauty}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_products_mega_menu_health_beauty}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_products_mega_menu_health_beauty}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_products_mega_menu_health_beauty}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Element Should Be Visible  ${EN_products_mega_menu_automotive}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_products_mega_menu_automotive}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_products_mega_menu_automotive}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_products_mega_menu_automotive}

iPrice Products Carousel Banner Validation  [Arguments]  ${displayed}
    Run Keyword If  "${displayed}"=="yes"  Run Keyword And Continue On Failure  Element Should Be Visible  ${products_banner}
    ...  ELSE IF  "${displayed}"=="no"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${products_banner}

iPrice Search, Compare & Save Section Validation  [Arguments]  ${country}
    Mouse Over  ${search_compare_save_electronic_gaming_box}
    ${box1_text1}  Get Text  //div[@id='hp-electronics']/h2[@class='title']/strong/span[1]
    ${box1_text2}  Get Text  //div[@id='hp-electronics']/h2[@class='title']/strong/span[2]
    ${box1}  Catenate  ${box1_text1}  ${box1_text2}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Should Be Equal  ${box1}  Electronics & Gaming
    ...  ELSE IF  "${country}"=="vn"  Should Be Equal  ${box1}  Điện máy & Chơi game
    ...  ELSE IF  "${country}"=="id"  Should Be Equal  ${box1}  Elektronik & Gaming
    ...  ELSE IF  "${country}"=="th"  Should Be Equal  ${box1}  อิเล็กทรอนิกส์ & เกมส์
    ${box2_text1}  Get Text  //div[@id='hp-fashion']/h2[@class='title']/strong/span[1]
    ${box2_text2}  Get Text  //div[@id='hp-fashion']/h2[@class='title']/strong/span[2]
    ${box2}  Catenate  ${box2_text1}  ${box2_text2}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Should Be Equal  ${box2}  Fashion & Beauty
    ...  ELSE IF  "${country}"=="vn"  Should Be Equal  ${box2}  Thời trang & Làm đẹp
    ...  ELSE IF  "${country}"=="id"  Should Be Equal  ${box2}  Fashion & Kecantikan
    ...  ELSE IF  "${country}"=="th"  Should Be Equal  ${box2}  แฟชั่น & ความงาม
    ${box3_text1}  Get Text  //div[@id='hp-coupon']/h2[@class='title']/strong/span[1]
    ${box3_text2}  Get Text  //div[@id='hp-coupon']/h2[@class='title']/strong/span[2]
    ${box3}  Catenate  ${box3_text1}  ${box3_text2}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Should Be Equal  ${box3}  Coupons & Offers
    ...  ELSE IF  "${country}"=="vn"  Should Be Equal  ${box3}  Coupon & Ưu đãi
    ...  ELSE IF  "${country}"=="id"  Should Be Equal  ${box3}  Kupon & Penawaran
    ...  ELSE IF  "${country}"=="th"  Should Be Equal  ${box3}  คูปอง & ข้อเสนอ

iPrice Search, Compare & Save Section Electronic Gaming Validation  [Arguments]  ${country}
    Click Element  ${search_compare_save_electronic_gaming_box}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_electronic_gaming_box_computing}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_electronic_gaming_box_computing}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_electronic_gaming_box_computing}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_electronic_gaming_box_computing}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_electronic_gaming_box_phone_tablet}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_electronic_gaming_box_phone_tablet}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_electronic_gaming_box_phone_tablet}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_electronic_gaming_box_phone_tablet}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_electronic_gaming_box_gaming}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_electronic_gaming_box_gaming}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_electronic_gaming_box_gaming}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_electronic_gaming_box_gaming}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_electronic_gaming_box_camera_photo}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_electronic_gaming_box_camera_photo}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_electronic_gaming_box_camera_photo}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_electronic_gaming_box_camera_photo}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_electronic_gaming_box_tv_video_dvd}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_electronic_gaming_box_tv_video_dvd}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_electronic_gaming_box_tv_video_dvd}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_electronic_gaming_box_tv_video_dvd}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_electronic_gaming_box_appliances}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_electronic_gaming_box_appliances}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_electronic_gaming_box_appliances}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_electronic_gaming_box_appliances}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_electronic_gaming_box_see_all_categories}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_electronic_gaming_box_see_all_categories}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_electronic_gaming_box_see_all_categories}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_electronic_gaming_box_see_all_categories}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_electronic_gaming_box_shop_by_brands}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_electronic_gaming_box_shop_by_brands}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_electronic_gaming_box_shop_by_brands}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_electronic_gaming_box_shop_by_brands}

iPrice Search, Compare & Save Section Fashion Beauty Validation  [Arguments]  ${country}
    Click Element  ${search_compare_save_fashion_beauty_box}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_fashion_beauty_box_clothing}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_fashion_beauty_box_clothing}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_fashion_beauty_box_clothing}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_fashion_beauty_box_clothing}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_fashion_beauty_box_shoes}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_fashion_beauty_box_shoes}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_fashion_beauty_box_shoes}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_fashion_beauty_box_shoes}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_fashion_beauty_box_bags}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_fashion_beauty_box_bags}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_fashion_beauty_box_bags}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_fashion_beauty_box_bags}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_fashion_beauty_box_health_beauty}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_fashion_beauty_box_health_beauty}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_fashion_beauty_box_health_beauty}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_fashion_beauty_box_health_beauty}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_fashion_beauty_box_jewellery}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_fashion_beauty_box_jewellery}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_fashion_beauty_box_jewellery}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_fashion_beauty_box_jewellery}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_fashion_beauty_box_watches}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_fashion_beauty_box_watches}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_fashion_beauty_box_watches}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_fashion_beauty_box_watches}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_fashion_beauty_box_see_all_categories}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_fashion_beauty_box_see_all_categories}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_fashion_beauty_box_see_all_categories}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_fashion_beauty_box_see_all_categories}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_fashion_beauty_box_shop_by_brands}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_fashion_beauty_box_shop_by_brands}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_fashion_beauty_box_shop_by_brands}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_fashion_beauty_box_shop_by_brands}

iPrice Search, Compare & Save Section Coupons Offers Validation  [Arguments]  ${country}
    Click Element  ${search_compare_save_coupons_offers_box}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_coupons_offers_box_electronics}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_coupons_offers_box_electronics}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_coupons_offers_box_electronics}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_coupons_offers_box_electronics}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_coupons_offers_box_fashion}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_coupons_offers_box_fashion}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_coupons_offers_box_fashion}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_coupons_offers_box_fashion}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_coupons_offers_box_beauty_health}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_coupons_offers_box_beauty_health}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_coupons_offers_box_beauty_health}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_coupons_offers_box_beauty_health}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_coupons_offers_box_home_living}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_coupons_offers_box_home_living}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_coupons_offers_box_olahraga_outdoor}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_coupons_offers_box_home_living}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_coupons_offers_box_kids_toys}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_coupons_offers_box_kids_toys}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_coupons_offers_box_kids_toys}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_coupons_offers_box_kids_toys}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_coupons_offers_box_travel_hotels}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_coupons_offers_box_travel_hotels}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_coupons_offers_box_travel_hotels}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_coupons_offers_box_travel_hotels}
    ...  ELSE IF  "${country}"=="ph"  Mouse Over  ${PH_search_compare_save_coupons_offers_box_sports_outdoors}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_coupons_offers_box_see_all_coupons}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_coupons_offers_box_see_all_coupons}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_coupons_offers_box_see_all_coupons}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_coupons_offers_box_see_all_coupons}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_search_compare_save_coupons_offers_box_shop_by_brands}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_search_compare_save_coupons_offers_box_shop_by_brands}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_search_compare_save_coupons_offers_box_shop_by_brands}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_search_compare_save_coupons_offers_box_shop_by_brands}

iPrice Homepage Recommended Products Validation  [Arguments]  ${country}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_recommended_products_header}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_recommended_products_header}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_recommended_products_header}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_recommended_products_header}
    ${count}  Get Matching Xpath Count  ${recommended_product_list}
    Run Keyword If  "${count}"!="6"  Run Keyword And Continue On Failure  Fail  Recommended products count not 6.
    ${loop_count}  Evaluate  ${count}+1
    :FOR  ${INDEX}  IN RANGE  1  ${loop_count}
    \  Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Element Should Be Visible  //div[@id='top-comparable-products']//div[@class='product-unit hover-popup offer'][${INDEX}]//div[text()=' Compare Prices ']
    \  ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  //div[@id='top-comparable-products']//div[@class='product-unit hover-popup offer'][${INDEX}]//div[text()=' So sánh giá ']
    \  ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  //div[@id='top-comparable-products']//div[@class='product-unit hover-popup offer'][${INDEX}]//div[text()=' Bandingkan Harga ']
    \  ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  //div[@id='top-comparable-products']//div[@class='product-unit hover-popup offer'][${INDEX}]//div[text()=' เปรียบเทียบราคา ']

iPrice Homepage Footer Validation  [Arguments]  ${country}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_homepage_footer_international_header}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_homepage_footer_international_header}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_homepage_footer_international_header}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_homepage_footer_international_header}
    Run Keyword If  "${country}"=="my"  MY International URL Validation
    ...  ELSE IF  "${country}"=="vn"  VN International URL Validation
    ...  ELSE IF  "${country}"=="id"  ID International URL Validation
    ...  ELSE IF  "${country}"=="sg"  SG International URL Validation
    ...  ELSE IF  "${country}"=="ph"  PH International URL Validation
    ...  ELSE IF  "${country}"=="hk"  HK International URL Validation
    ...  ELSE IF  "${country}"=="th"  TH International URL Validation
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_homepage_footer_ipricegroup_header}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_homepage_footer_ipricegroup_header}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_homepage_footer_ipricegroup_header}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_homepage_footer_ipricegroup_header}
    Run Keyword If  "${country}"=="my"  MY iPrice Group Footer Validation
    ...  ELSE IF  "${country}"=="vn"  VN iPrice Group Footer Validation
    ...  ELSE IF  "${country}"=="id"  ID iPrice Group Footer Validation
    ...  ELSE IF  "${country}"=="sg"  SG iPrice Group Footer Validation
    ...  ELSE IF  "${country}"=="ph"  PH iPrice Group Footer Validation
    ...  ELSE IF  "${country}"=="hk"  HK iPrice Group Footer Validation
    ...  ELSE IF  "${country}"=="th"  TH iPrice Group Footer Validation
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Mouse Over  ${EN_footer_social_header}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_footer_social_header}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_footer_social_header}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_footer_social_header}
    Run Keyword If  "${country}"=="my"  Element Should Be Visible  ${MY_footer_social_facebook_link}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_footer_social_facebook_link}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_footer_social_facebook_link}
    ...  ELSE IF  "${country}"=="sg"  Element Should Be Visible  ${SG_footer_social_facebook_link}
    ...  ELSE IF  "${country}"=="ph"  Element Should Be Visible  ${PH_footer_social_facebook_link}
    ...  ELSE IF  "${country}"=="hk"  Element Should Be Visible  ${HK_footer_social_facebook_link}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_footer_social_facebook_link}
    Run Keyword If  "${country}"=="my"  Element Should Be Visible  ${MY_footer_social_pinterest_link}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_footer_social_pinterest_link}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_footer_social_pinterest_link}
    ...  ELSE IF  "${country}"=="sg"  Element Should Be Visible  ${SG_footer_social_pinterest_link}
    ...  ELSE IF  "${country}"=="ph"  Element Should Be Visible  ${PH_footer_social_pinterest_link}
    ...  ELSE IF  "${country}"=="hk"  Element Should Be Visible  ${HK_footer_social_pinterest_link}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_footer_social_pinterest_link}
    Run Keyword If  "${country}"=="my"  Element Should Be Visible  ${MY_footer_social_twitter_link}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_footer_social_twitter_link}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_footer_social_twitter_link}
    ...  ELSE IF  "${country}"=="sg"  Element Should Be Visible  ${SG_footer_social_twitter_link}
    ...  ELSE IF  "${country}"=="ph"  Element Should Be Visible  ${PH_footer_social_twitter_link}
    ...  ELSE IF  "${country}"=="hk"  Element Should Be Visible  ${HK_footer_social_twitter_link}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_footer_social_twitter_link}
    Element Should Be Visible  ${all_footer_social_google+_text}
    Run Keyword If  "${country}"=="my"  Mouse Over  ${MY_footer_iprice_logo}
    ...  ELSE IF  "${country}"=="vn"  Mouse Over  ${VN_footer_iprice_logo}
    ...  ELSE IF  "${country}"=="id"  Mouse Over  ${ID_footer_iprice_logo}
    ...  ELSE IF  "${country}"=="sg"  Mouse Over  ${SG_footer_iprice_logo}
    ...  ELSE IF  "${country}"=="ph"  Mouse Over  ${PH_footer_iprice_logo}
    ...  ELSE IF  "${country}"=="hk"  Mouse Over  ${HK_footer_iprice_logo}
    ...  ELSE IF  "${country}"=="th"  Mouse Over  ${TH_footer_iprice_logo}
    # ${elem}  Execute Javascript  return document.getElementsByClassName("flex wrapper en_my")[0];
    ${elem}  Run Keyword If  "${country}"=="my"  Execute Javascript  return document.getElementsByClassName("flex wrapper en_my")[0];
    ...  ELSE IF  "${country}"=="vn"  Execute Javascript  return document.getElementsByClassName("flex wrapper vi")[0];
    ...  ELSE IF  "${country}"=="id"  Execute Javascript  return document.getElementsByClassName("flex wrapper id")[0];
    ...  ELSE IF  "${country}"=="sg"  Execute Javascript  return document.getElementsByClassName("flex wrapper en_sg")[0];
    ...  ELSE IF  "${country}"=="ph"  Execute Javascript  return document.getElementsByClassName("flex wrapper en_ph")[0];
    ...  ELSE IF  "${country}"=="hk"  Execute Javascript  return document.getElementsByClassName("flex wrapper en_hk")[0];
    ...  ELSE IF  "${country}"=="th"  Execute Javascript  return document.getElementsByClassName("flex wrapper th")[0];
    ${bg}  Call Method  ${elem}  value_of_css_property  background
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Should Contain  ${bg}  /images/logos/logo-footer_en
    ...  ELSE IF  "${country}"=="vn"  Should Contain  ${bg}  /images/logos/logo-footer_vn
    ...  ELSE IF  "${country}"=="id"  Should Contain  ${bg}  /images/logos/logo-footer_id
    ...  ELSE IF  "${country}"=="th"  Should Contain  ${bg}  /images/logos/logo-footer_th
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Element Should Be Visible  ${EN_footer_disclaimer_copyright}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_footer_disclaimer_copyright}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_footer_disclaimer_copyright}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_footer_disclaimer_copyright}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Element Should Be Visible  ${EN_footer_disclaimer_notes}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_footer_disclaimer_notes}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_footer_disclaimer_notes}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_footer_disclaimer_notes}

MY International URL Validation
    # Element Should Not Be Visible  ${EN_homepage_footer_international_malaysia_link}
    Element Should Be Visible  ${EN_homepage_footer_international_singapore_link}
    Element Should Be Visible  ${EN_homepage_footer_international_indonesia_link}
    Element Should Be Visible  ${EN_homepage_footer_international_philippines_link}
    Element Should Be Visible  ${EN_homepage_footer_international_hong_kong_link}
    Element Should Be Visible  ${EN_homepage_footer_international_thailand_link}
    Element Should Be Visible  ${EN_homepage_footer_international_vietnam_link}

VN International URL Validation
    Element Should Be Visible  ${VN_homepage_footer_international_malaysia_link}
    Element Should Be Visible  ${VN_homepage_footer_international_singapore_link}
    Element Should Be Visible  ${VN_homepage_footer_international_indonesia_link}
    Element Should Be Visible  ${VN_homepage_footer_international_philippines_link}
    Element Should Be Visible  ${VN_homepage_footer_international_hong_kong_link}
    Element Should Be Visible  ${VN_homepage_footer_international_thailand_link}

ID International URL Validation
    Element Should Be Visible  ${ID_homepage_footer_international_malaysia_link}
    Element Should Be Visible  ${ID_homepage_footer_international_singapore_link}
    Element Should Be Visible  ${ID_homepage_footer_international_philippines_link}
    Element Should Be Visible  ${ID_homepage_footer_international_hong_kong_link}
    Element Should Be Visible  ${ID_homepage_footer_international_thailand_link}
    Element Should Be Visible  ${ID_homepage_footer_international_vietnam_link}

SG International URL Validation
    Element Should Be Visible  ${EN_homepage_footer_international_malaysia_link}
    # Element Should Not Be Visible  ${EN_homepage_footer_international_singapore_link}
    Element Should Be Visible  ${EN_homepage_footer_international_indonesia_link}
    Element Should Be Visible  ${EN_homepage_footer_international_philippines_link}
    Element Should Be Visible  ${EN_homepage_footer_international_hong_kong_link}
    Element Should Be Visible  ${EN_homepage_footer_international_thailand_link}
    Element Should Be Visible  ${EN_homepage_footer_international_vietnam_link}

PH International URL Validation
    Element Should Be Visible  ${EN_homepage_footer_international_malaysia_link}
    Element Should Be Visible  ${EN_homepage_footer_international_singapore_link}
    Element Should Be Visible  ${EN_homepage_footer_international_indonesia_link}
    # Element Should Not Be Visible  ${EN_homepage_footer_international_philippines_link}
    Element Should Be Visible  ${EN_homepage_footer_international_hong_kong_link}
    Element Should Be Visible  ${EN_homepage_footer_international_thailand_link}
    Element Should Be Visible  ${EN_homepage_footer_international_vietnam_link}

HK International URL Validation
    Element Should Be Visible  ${EN_homepage_footer_international_malaysia_link}
    Element Should Be Visible  ${EN_homepage_footer_international_singapore_link}
    Element Should Be Visible  ${EN_homepage_footer_international_indonesia_link}
    Element Should Be Visible  ${EN_homepage_footer_international_philippines_link}
    # Element Should Not Be Visible  ${EN_homepage_footer_international_hong_kong_link}
    Element Should Be Visible  ${EN_homepage_footer_international_thailand_link}
    Element Should Be Visible  ${EN_homepage_footer_international_vietnam_link}

TH International URL Validation
    Element Should Be Visible  ${TH_homepage_footer_international_malaysia_link}
    Element Should Be Visible  ${TH_homepage_footer_international_singapore_link}
    Element Should Be Visible  ${TH_homepage_footer_international_indonesia_link}
    Element Should Be Visible  ${TH_homepage_footer_international_philippines_link}
    Element Should Be Visible  ${TH_homepage_footer_international_hong_kong_link}
    Element Should Be Visible  ${TH_homepage_footer_international_vietnam_link}

MY iPrice Group Footer Validation
    Element Should Be Visible  ${MY_footer_ipricegroup_about_us_link}
    Element Should Be Visible  ${MY_footer_ipricegroup_trends_link}
    Element Should Be Visible  ${MY_footer_ipricegroup_contact_us_link}
    Element Should Be Visible  ${MY_footer_ipricegroup_carreers_link}
    Element Should Be Visible  ${MY_footer_ipricegroup_partners_link}
    Element Should Be Visible  ${MY_footer_ipricegroup_privacy_policy_link}
    Element Should Be Visible  ${MY_footer_ipricegroup_terms_of_use_link}
    Element Should Be Visible  ${MY_footer_ipricegroup_iema_link}

VN iPrice Group Footer Validation
    Element Should Be Visible  ${VN_footer_ipricegroup_about_us_link}
    Element Should Be Visible  ${VN_footer_ipricegroup_trends_link}
    Element Should Be Visible  ${VN_footer_ipricegroup_contact_us_link}
    Element Should Be Visible  ${VN_footer_ipricegroup_carreers_link}
    Element Should Be Visible  ${VN_footer_ipricegroup_partners_link}
    Element Should Be Visible  ${VN_footer_ipricegroup_privacy_policy_link}
    Element Should Be Visible  ${VN_footer_ipricegroup_terms_of_use_link}
    Element Should Be Visible  ${VN_footer_ipricegroup_iema_link}

ID iPrice Group Footer Validation
    Element Should Be Visible  ${ID_footer_ipricegroup_about_us_link}
    Element Should Be Visible  ${ID_footer_ipricegroup_trends_link}
    Element Should Be Visible  ${ID_footer_ipricegroup_contact_us_link}
    Element Should Be Visible  ${ID_footer_ipricegroup_carreers_link}
    Element Should Be Visible  ${ID_footer_ipricegroup_partners_link}
    Element Should Be Visible  ${ID_footer_ipricegroup_privacy_policy_link}
    Element Should Be Visible  ${ID_footer_ipricegroup_terms_of_use_link}
    Element Should Be Visible  ${ID_footer_ipricegroup_iema_link}

SG iPrice Group Footer Validation
    Element Should Be Visible  ${SG_footer_ipricegroup_about_us_link}
    Element Should Be Visible  ${SG_footer_ipricegroup_trends_link}
    Element Should Be Visible  ${SG_footer_ipricegroup_contact_us_link}
    Element Should Be Visible  ${SG_footer_ipricegroup_carreers_link}
    Element Should Be Visible  ${SG_footer_ipricegroup_partners_link}
    Element Should Be Visible  ${SG_footer_ipricegroup_privacy_policy_link}
    Element Should Be Visible  ${SG_footer_ipricegroup_terms_of_use_link}
    Element Should Be Visible  ${SG_footer_ipricegroup_iema_link}

PH iPrice Group Footer Validation
    Element Should Be Visible  ${PH_footer_ipricegroup_about_us_link}
    Element Should Be Visible  ${PH_footer_ipricegroup_trends_link}
    Element Should Be Visible  ${PH_footer_ipricegroup_contact_us_link}
    Element Should Be Visible  ${PH_footer_ipricegroup_carreers_link}
    Element Should Be Visible  ${PH_footer_ipricegroup_partners_link}
    Element Should Be Visible  ${PH_footer_ipricegroup_privacy_policy_link}
    Element Should Be Visible  ${PH_footer_ipricegroup_terms_of_use_link}
    Element Should Be Visible  ${PH_footer_ipricegroup_iema_link}

HK iPrice Group Footer Validation
    Element Should Be Visible  ${HK_footer_ipricegroup_about_us_link}
    Element Should Be Visible  ${HK_footer_ipricegroup_trends_link}
    Element Should Be Visible  ${HK_footer_ipricegroup_contact_us_link}
    Element Should Be Visible  ${HK_footer_ipricegroup_carreers_link}
    Element Should Be Visible  ${HK_footer_ipricegroup_partners_link}
    Element Should Be Visible  ${HK_footer_ipricegroup_privacy_policy_link}
    Element Should Be Visible  ${HK_footer_ipricegroup_terms_of_use_link}
    Element Should Be Visible  ${HK_footer_ipricegroup_iema_link}

TH iPrice Group Footer Validation
    Element Should Be Visible  ${TH_footer_ipricegroup_about_us_link}
    Element Should Be Visible  ${TH_footer_ipricegroup_trends_link}
    Element Should Be Visible  ${TH_footer_ipricegroup_contact_us_link}
    Element Should Be Visible  ${TH_footer_ipricegroup_carreers_link}
    Element Should Be Visible  ${TH_footer_ipricegroup_partners_link}
    Element Should Be Visible  ${TH_footer_ipricegroup_privacy_policy_link}
    Element Should Be Visible  ${TH_footer_ipricegroup_terms_of_use_link}
    Element Should Be Visible  ${TH_footer_ipricegroup_iema_link}

iPrice Products Page Access Coupons From Courtesy  [Arguments]  ${country}
    Run Keyword If  "${country}"=="my"  Run Keyword And Continue On Failure  Click Element  ${MY_courtesy_coupons}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Click Element  ${VN_courtesy_coupons}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Click Element  ${ID_courtesy_coupons}
    ...  ELSE IF  "${country}"=="sg"  Run Keyword And Continue On Failure  Click Element  ${SG_courtesy_coupons}
    ...  ELSE IF  "${country}"=="ph"  Run Keyword And Continue On Failure  Click Element  ${PH_courtesy_coupons}
    ...  ELSE IF  "${country}"=="hk"  Run Keyword And Continue On Failure  Click Element  ${HK_courtesy_coupons}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Click Element  ${TH_courtesy_coupons}
