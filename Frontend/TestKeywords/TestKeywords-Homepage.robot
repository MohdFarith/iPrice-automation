*** Settings ***

Documentation  This file will only store keywords for homepage.

*** Variables ***

*** Keywords ***

Access iPrice Homepage  [Arguments]  ${country}
    Run Keyword If  "${country}"=="MY"  Go To  ${MY_homeURL}
    ...  ELSE IF  "${country}"=="VN"  Go To  ${VN_homeURL}
    ...  ELSE IF  "${country}"=="ID"  Go To  ${ID_homeURL}
    ...  ELSE IF  "${country}"=="SG"  Go To  ${SG_homeURL}
    ...  ELSE IF  "${country}"=="PH"  Go To  ${PH_homeURL}
    ...  ELSE IF  "${country}"=="HK"  Go To  ${HK_homeURL}
    ...  ELSE IF  "${country}"=="TH"  Go To  ${TH_homeURL}
    Sleep  2
    Run Keyword If  "${country}"=="MY"  Title Should Be  ${MY_homeTitle}
    ...  ELSE IF  "${country}"=="VN"  Title Should Be  ${VN_homeTitle}
    ...  ELSE IF  "${country}"=="ID"  Title Should Be  ${ID_homeTitle}
    ...  ELSE IF  "${country}"=="SG"  Title Should Be  ${SG_homeTitle}
    ...  ELSE IF  "${country}"=="PH"  Title Should Be  ${PH_homeTitle}
    ...  ELSE IF  "${country}"=="HK"  Title Should Be  ${HK_homeTitle}
    ...  ELSE IF  "${country}"=="TH"  Title Should Be  ${TH_homeTitle}

iPrice Homepage Access Coupons Link  [Arguments]  ${country}
    Run Keyword If  "${country}"=="MY"  Click Element  ${MY_header_coupon_logo_link_and_text}
    ...  ELSE IF  "${country}"=="VN"  Click Element  ${VN_header_coupon_logo_link_and_text}
    ...  ELSE IF  "${country}"=="ID"  Click Element  ${ID_header_coupon_logo_link_and_text}
    ...  ELSE IF  "${country}"=="SG"  Click Element  ${SG_header_coupon_logo_link_and_text}
    ...  ELSE IF  "${country}"=="PH"  Click Element  ${PH_header_coupon_logo_link_and_text}
    ...  ELSE IF  "${country}"=="HK"  Click Element  ${HK_header_coupon_logo_link_and_text}
    ...  ELSE IF  "${country}"=="TH"  Click Element  ${TH_header_coupon_logo_link_and_text}
    Sleep  2

iPrice Header Courtesy Validation  [Arguments]  ${country}
    Run Keyword If  "${country}"=="MY"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_courtesy_products}
    ...  ELSE IF  "${country}"=="VN"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_header_courtesy_products}
    ...  ELSE IF  "${country}"=="ID"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_header_courtesy_products}
    ...  ELSE IF  "${country}"=="SG"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_header_courtesy_products}
    ...  ELSE IF  "${country}"=="PH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_header_courtesy_products}
    ...  ELSE IF  "${country}"=="HK"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_header_courtesy_products}
    ...  ELSE IF  "${country}"=="TH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_header_courtesy_products}
    Run Keyword If  "${country}"=="MY"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_courtesy_coupons}
    ...  ELSE IF  "${country}"=="VN"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_header_courtesy_coupons}
    ...  ELSE IF  "${country}"=="ID"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_header_courtesy_coupons}
    ...  ELSE IF  "${country}"=="SG"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_header_courtesy_coupons}
    ...  ELSE IF  "${country}"=="PH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_header_courtesy_coupons}
    ...  ELSE IF  "${country}"=="HK"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_header_courtesy_coupons}
    ...  ELSE IF  "${country}"=="TH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_header_courtesy_coupons}
    Run Keyword If  "${country}"=="MY"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_courtesy_trends}
    ...  ELSE IF  "${country}"=="VN"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_header_courtesy_trends}
    ...  ELSE IF  "${country}"=="ID"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_header_courtesy_trends}
    ...  ELSE IF  "${country}"=="SG"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_header_courtesy_trends}
    ...  ELSE IF  "${country}"=="PH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_header_courtesy_trends}
    ...  ELSE IF  "${country}"=="HK"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_header_courtesy_trends}
    ...  ELSE IF  "${country}"=="TH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_header_courtesy_trends}

iPrice Header Validation  [Arguments]  ${country}
    Run Keyword If  "${country}"=="MY"  Element Should Be Visible  ${MY_header_logo_link}
    ...  ELSE IF  "${country}"=="VN"  Element Should Be Visible  ${VN_header_logo_link}
    ...  ELSE IF  "${country}"=="ID"  Element Should Be Visible  ${ID_header_logo_link}
    ...  ELSE IF  "${country}"=="SG"  Element Should Be Visible  ${SG_header_logo_link}
    ...  ELSE IF  "${country}"=="PH"  Element Should Be Visible  ${PH_header_logo_link}
    ...  ELSE IF  "${country}"=="HK"  Element Should Be Visible  ${HK_header_logo_link}
    ...  ELSE IF  "${country}"=="TH"  Element Should Be Visible  ${TH_header_logo_link}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Element Should Be Visible  ${EN_header_search_compare_save}
    ...  ELSE IF  "${country}"=="VN"  Element Should Be Visible  ${VN_header_search_compare_save}
    ...  ELSE IF  "${country}"=="ID"  Element Should Be Visible  ${ID_header_search_compare_save}
    ...  ELSE IF  "${country}"=="TH"  Element Should Be Visible  ${TH_header_search_compare_save}
    Run Keyword If  "${country}"=="MY"  Element Should Be Visible  ${MY_header_search_input}
    ...  ELSE IF  "${country}"=="VN"  Element Should Be Visible  ${VN_header_search_input}
    ...  ELSE IF  "${country}"=="ID"  Element Should Be Visible  ${ID_header_search_input}
    ...  ELSE IF  "${country}"=="SG"  Element Should Be Visible  ${SG_header_search_input}
    ...  ELSE IF  "${country}"=="PH"  Element Should Be Visible  ${PH_header_search_input}
    ...  ELSE IF  "${country}"=="HK"  Element Should Be Visible  ${HK_header_search_input}
    ...  ELSE IF  "${country}"=="TH"  Element Should Be Visible  ${TH_header_search_input}
    Element Should Be Visible  ${header_search_icon}

# iPrice Header Logo Validation  [Arguments]  ${country}
#     Run Keyword If  "${country}"=="MY"  Element Should Be Visible  ${MY_header_logo_link}
#     ...  ELSE IF  "${country}"=="VN"  Element Should Be Visible  ${VN_header_logo_link}
#     ...  ELSE IF  "${country}"=="ID"  Element Should Be Visible  ${ID_header_logo_link}
#     ...  ELSE IF  "${country}"=="SG"  Element Should Be Visible  ${SG_header_logo_link}
#     ...  ELSE IF  "${country}"=="PH"  Element Should Be Visible  ${PH_header_logo_link}
#     ...  ELSE IF  "${country}"=="HK"  Element Should Be Visible  ${HK_header_logo_link}
#     ...  ELSE IF  "${country}"=="TH"  Element Should Be Visible  ${TH_header_logo_link}

# iPrice Header Search Bar Validation  [Arguments]  ${country}
#     Run Keyword If  "${country}"=="MY"  Element Should Be Visible  ${MY_header_search_input}
#     ...  ELSE IF  "${country}"=="VN"  Element Should Be Visible  ${VN_header_search_input}
#     ...  ELSE IF  "${country}"=="ID"  Element Should Be Visible  ${ID_header_search_input}
#     ...  ELSE IF  "${country}"=="SG"  Element Should Be Visible  ${SG_header_search_input}
#     ...  ELSE IF  "${country}"=="PH"  Element Should Be Visible  ${PH_header_search_input}
#     ...  ELSE IF  "${country}"=="HK"  Element Should Be Visible  ${HK_header_search_input}
#     ...  ELSE IF  "${country}"=="TH"  Element Should Be Visible  ${TH_header_search_input}
#     Element Should Be Visible  ${header_search_icon}
    # Run Keyword If  "${country}"=="MY"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_popular_searches_text}
    # ...  ELSE IF  "${country}"=="VN"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_header_popular_searches_text}
    # ...  ELSE IF  "${country}"=="ID"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_header_popular_searches_text}
    # ...  ELSE IF  "${country}"=="SG"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_header_popular_searches_text}
    # ...  ELSE IF  "${country}"=="PH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_header_popular_searches_text}
    # ...  ELSE IF  "${country}"=="HK"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_header_popular_searches_text}
    # ...  ELSE IF  "${country}"=="TH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_header_popular_searches_text}

# iPrice Header Coupons And Offer Validation  [Arguments]  ${country}
#     Run Keyword If  "${country}"=="MY"  Element Should Be Visible  ${MY_header_coupon_logo_link_and_text}
#     ...  ELSE IF  "${country}"=="VN"  Element Should Be Visible  ${VN_header_coupon_logo_link_and_text}
#     ...  ELSE IF  "${country}"=="ID"  Element Should Be Visible  ${ID_header_coupon_logo_link_and_text}
#     ...  ELSE IF  "${country}"=="SG"  Element Should Be Visible  ${SG_header_coupon_logo_link_and_text}
#     ...  ELSE IF  "${country}"=="PH"  Element Should Be Visible  ${PH_header_coupon_logo_link_and_text}
#     ...  ELSE IF  "${country}"=="HK"  Element Should Be Visible  ${HK_header_coupon_logo_link_and_text}
#     ...  ELSE IF  "${country}"=="TH"  Element Should Be Visible  ${TH_header_coupon_logo_link_and_text}

iPrice Products Header Main Categories Validation  [Arguments]  ${country}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Element Should Be Visible  ${EN_products_header_categories_electronics}
    ...  ELSE IF  "${country}"=="VN"  Element Should Be Visible  ${EN_products_header_categories_electronics}
    ...  ELSE IF  "${country}"=="ID"  Element Should Be Visible  ${EN_products_header_categories_electronics}
    ...  ELSE IF  "${country}"=="TH"  Element Should Be Visible  ${EN_products_header_categories_electronics}

# iPrice Header Main Categories Validation  [Arguments]  ${country}
#     # ${match}  Get Matching Xpath Count  //div[@id='menu']//li[@class='cursor-pointer list-item']//span
#     # Run Keyword If  ${match}!=60  Run Keyword And Continue On Failure  Fail  Main categories count incorrect.
#     Run Keyword If  "${country}"=="MY"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_categories_clothing_link_text}
#     ...  ELSE IF  "${country}"=="VN"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_header_categories_clothing_link_text}
#     ...  ELSE IF  "${country}"=="ID"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_header_categories_clothing_link_text}
#     ...  ELSE IF  "${country}"=="SG"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_header_categories_clothing_link_text}
#     ...  ELSE IF  "${country}"=="PH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_header_categories_clothing_link_text}
#     ...  ELSE IF  "${country}"=="HK"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_header_categories_clothing_link_text}
#     ...  ELSE IF  "${country}"=="TH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_header_categories_clothing_link_text}
#     Run Keyword If  "${country}"=="MY"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_categories_shoes_link_text}
#     ...  ELSE IF  "${country}"=="VN"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_header_categories_shoes_link_text}
#     ...  ELSE IF  "${country}"=="ID"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_header_categories_shoes_link_text}
#     ...  ELSE IF  "${country}"=="SG"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_header_categories_shoes_link_text}
#     ...  ELSE IF  "${country}"=="PH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_header_categories_shoes_link_text}
#     ...  ELSE IF  "${country}"=="HK"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_header_categories_shoes_link_text}
#     ...  ELSE IF  "${country}"=="TH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_header_categories_shoes_link_text}

iPrice Access Header Logo Link  [Arguments]  ${country}
    Run Keyword If  "${country}"=="MY"  Click Element  ${MY_header_logo_link}
    ...  ELSE IF  "${country}"=="VN"  Click Element  ${VN_header_logo_link}
    ...  ELSE IF  "${country}"=="ID"  Click Element  ${ID_header_logo_link}
    ...  ELSE IF  "${country}"=="SG"  Click Element  ${SG_header_logo_link}
    ...  ELSE IF  "${country}"=="PH"  Click Element  ${PH_header_logo_link}
    ...  ELSE IF  "${country}"=="HK"  Click Element  ${HK_header_logo_link}
    ...  ELSE IF  "${country}"=="TH"  Click Element  ${TH_header_logo_link}
    Sleep  1
    iPrice Header Courtesy Validation  ${country}

iPrice Search, Compare & Save Section Validation  [Arguments]  ${country}
    Mouse Over  ${search_compare_save_electronic_gaming_box}
    ${box1_text1}  Get Text  //div[@id='hp-electronics']/h2[@class='title']/strong/span[1]
    ${box1_text2}  Get Text  //div[@id='hp-electronics']/h2[@class='title']/strong/span[2]
    ${box1}  Catenate  ${box1_text1}  ${box1_text2}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Should Be Equal  ${box1}  Electronics & Gaming
    ...  ELSE IF  "${country}"=="VN"  Should Be Equal  ${box1}  Điện máy & Chơi game
    ...  ELSE IF  "${country}"=="ID"  Should Be Equal  ${box1}  Elektronik & Gaming
    ...  ELSE IF  "${country}"=="TH"  Should Be Equal  ${box1}  อิเล็กทรอนิกส์ & เกมส์
    ${box2_text1}  Get Text  //div[@id='hp-fashion']/h2[@class='title']/strong/span[1]
    ${box2_text2}  Get Text  //div[@id='hp-fashion']/h2[@class='title']/strong/span[2]
    ${box2}  Catenate  ${box2_text1}  ${box2_text2}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Should Be Equal  ${box2}  Fashion & Beauty
    ...  ELSE IF  "${country}"=="VN"  Should Be Equal  ${box2}  Thời trang & Làm đẹp
    ...  ELSE IF  "${country}"=="ID"  Should Be Equal  ${box2}  Fashion & Kecantikan
    ...  ELSE IF  "${country}"=="TH"  Should Be Equal  ${box2}  แฟชั่น & ความงาม
    ${box3_text1}  Get Text  //div[@id='hp-coupon']/h2[@class='title']/strong/span[1]
    ${box3_text2}  Get Text  //div[@id='hp-coupon']/h2[@class='title']/strong/span[2]
    ${box3}  Catenate  ${box3_text1}  ${box3_text2}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Should Be Equal  ${box3}  Coupons & Offers
    ...  ELSE IF  "${country}"=="VN"  Should Be Equal  ${box3}  Coupon & Ưu đãi
    ...  ELSE IF  "${country}"=="ID"  Should Be Equal  ${box3}  Kupon & Penawaran
    ...  ELSE IF  "${country}"=="TH"  Should Be Equal  ${box3}  คูปอง & ข้อเสนอ

iPrice Search, Compare & Save Section Electronic Gaming Validation  [Arguments]  ${country}
    Click Element  ${search_compare_save_electronic_gaming_box}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_search_compare_save_electronic_gaming_box_computing}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_search_compare_save_electronic_gaming_box_computing}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_search_compare_save_electronic_gaming_box_computing}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_search_compare_save_electronic_gaming_box_computing}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_search_compare_save_electronic_gaming_box_phone_tablet}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_search_compare_save_electronic_gaming_box_phone_tablet}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_search_compare_save_electronic_gaming_box_phone_tablet}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_search_compare_save_electronic_gaming_box_phone_tablet}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_search_compare_save_electronic_gaming_box_gaming}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_search_compare_save_electronic_gaming_box_gaming}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_search_compare_save_electronic_gaming_box_gaming}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_search_compare_save_electronic_gaming_box_gaming}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_search_compare_save_electronic_gaming_box_camera_photo}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_search_compare_save_electronic_gaming_box_camera_photo}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_search_compare_save_electronic_gaming_box_camera_photo}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_search_compare_save_electronic_gaming_box_camera_photo}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_search_compare_save_electronic_gaming_box_tv_video_dvd}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_search_compare_save_electronic_gaming_box_tv_video_dvd}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_search_compare_save_electronic_gaming_box_tv_video_dvd}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_search_compare_save_electronic_gaming_box_tv_video_dvd}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_search_compare_save_electronic_gaming_box_appliances}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_search_compare_save_electronic_gaming_box_appliances}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_search_compare_save_electronic_gaming_box_appliances}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_search_compare_save_electronic_gaming_box_appliances}

iPrice Search, Compare & Save Section Fashion Beauty Validation  [Arguments]  ${country}
    Click Element  ${search_compare_save_fashion_beauty_box}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_search_compare_save_fashion_beauty_box_clothing}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_search_compare_save_fashion_beauty_box_clothing}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_search_compare_save_fashion_beauty_box_clothing}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_search_compare_save_fashion_beauty_box_clothing}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_search_compare_save_fashion_beauty_box_shoes}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_search_compare_save_fashion_beauty_box_shoes}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_search_compare_save_fashion_beauty_box_shoes}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_search_compare_save_fashion_beauty_box_shoes}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_search_compare_save_fashion_beauty_box_bags}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_search_compare_save_fashion_beauty_box_bags}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_search_compare_save_fashion_beauty_box_bags}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_search_compare_save_fashion_beauty_box_bags}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_search_compare_save_fashion_beauty_box_health_beauty}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_search_compare_save_fashion_beauty_box_health_beauty}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_search_compare_save_fashion_beauty_box_health_beauty}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_search_compare_save_fashion_beauty_box_health_beauty}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_search_compare_save_fashion_beauty_box_jewellery}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_search_compare_save_fashion_beauty_box_jewellery}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_search_compare_save_fashion_beauty_box_jewellery}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_search_compare_save_fashion_beauty_box_jewellery}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_search_compare_save_fashion_beauty_box_watches}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_search_compare_save_fashion_beauty_box_watches}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_search_compare_save_fashion_beauty_box_watches}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_search_compare_save_fashion_beauty_box_watches}

iPrice Search, Compare & Save Section Coupons Offers Validation  [Arguments]  ${country}
    Click Element  ${search_compare_save_coupons_offers_box}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_search_compare_save_coupons_offers_box_electronics}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_search_compare_save_coupons_offers_box_electronics}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_search_compare_save_coupons_offers_box_electronics}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_search_compare_save_coupons_offers_box_electronics}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_search_compare_save_coupons_offers_box_fashion}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_search_compare_save_coupons_offers_box_fashion}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_search_compare_save_coupons_offers_box_fashion}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_search_compare_save_coupons_offers_box_fashion}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_search_compare_save_coupons_offers_box_beauty_health}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_search_compare_save_coupons_offers_box_beauty_health}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_search_compare_save_coupons_offers_box_beauty_health}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_search_compare_save_coupons_offers_box_beauty_health}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_search_compare_save_coupons_offers_box_home_living}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_search_compare_save_coupons_offers_box_home_living}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_search_compare_save_coupons_offers_box_olahraga_outdoor}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_search_compare_save_coupons_offers_box_home_living}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_search_compare_save_coupons_offers_box_kids_toys}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_search_compare_save_coupons_offers_box_kids_toys}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_search_compare_save_coupons_offers_box_kids_toys}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_search_compare_save_coupons_offers_box_kids_toys}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="HK"  Mouse Over  ${EN_search_compare_save_coupons_offers_box_travel_hotels}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_search_compare_save_coupons_offers_box_travel_hotels}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_search_compare_save_coupons_offers_box_travel_hotels}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_search_compare_save_coupons_offers_box_travel_hotels}
    ...  ELSE IF  "${country}"=="PH"  Mouse Over  ${PH_search_compare_save_coupons_offers_box_sports_outdoors}

iPrice Dismiss Sign Up Modal
    :FOR  ${INDES}  IN RANGE  0  10
    \  ${match}  Get Matching Xpath Count  ${modal_signup_close_button}
    \  Run Keyword If  ${match}>0  Wait Until Element Is Visible  ${modal_signup_close_button}
    \  Run Keyword If  ${match}>0  Click Element  ${modal_signup_close_button}
    \  Run Keyword If  ${match}>0  Wait Until Element Is Not Visible  ${modal_signup_close_button}
    \  Run Keyword If  ${match}>0  Exit For Loop
    \  Sleep  1

iPrice Homepage Recommended Products Validation  [Arguments]  ${country}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_recommended_products_header}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_recommended_products_header}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_recommended_products_header}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_recommended_products_header}
    ${count}  Get Matching Xpath Count  ${recommended_product_list}
    Run Keyword If  "${count}"!="6"  Run Keyword And Continue On Failure  Fail  Recommended products count not 6.
    ${loop_count}  Evaluate  ${count}+1
    :FOR  ${INDEX}  IN RANGE  1  ${loop_count}
    \  Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Element Should Be Visible  //div[@id='top-comparable-products']//div[@class='product-unit hover-popup offer'][${INDEX}]//div[text()=' Compare Prices ']
    \  ...  ELSE IF  "${country}"=="VN"  Element Should Be Visible  //div[@id='top-comparable-products']//div[@class='product-unit hover-popup offer'][${INDEX}]//div[text()=' So sánh giá ']
    \  ...  ELSE IF  "${country}"=="ID"  Element Should Be Visible  //div[@id='top-comparable-products']//div[@class='product-unit hover-popup offer'][${INDEX}]//div[text()=' Bandingkan Harga ']
    \  ...  ELSE IF  "${country}"=="TH"  Element Should Be Visible  //div[@id='top-comparable-products']//div[@class='product-unit hover-popup offer'][${INDEX}]//div[text()=' เปรียบเทียบราคา ']

iPrice Homepage Footer Validation  [Arguments]  ${country}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_homepage_footer_international_header}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_homepage_footer_international_header}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_homepage_footer_international_header}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_homepage_footer_international_header}
    Run Keyword If  "${country}"=="MY"  MY International URL Validation
    ...  ELSE IF  "${country}"=="VN"  VN International URL Validation
    ...  ELSE IF  "${country}"=="ID"  ID International URL Validation
    ...  ELSE IF  "${country}"=="SG"  SG International URL Validation
    ...  ELSE IF  "${country}"=="PH"  PH International URL Validation
    ...  ELSE IF  "${country}"=="HK"  HK International URL Validation
    ...  ELSE IF  "${country}"=="TH"  TH International URL Validation
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_homepage_footer_ipricegroup_header}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_homepage_footer_ipricegroup_header}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_homepage_footer_ipricegroup_header}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_homepage_footer_ipricegroup_header}
    Run Keyword If  "${country}"=="MY"  MY iPrice Group Footer Validation
    ...  ELSE IF  "${country}"=="VN"  VN iPrice Group Footer Validation
    ...  ELSE IF  "${country}"=="ID"  ID iPrice Group Footer Validation
    ...  ELSE IF  "${country}"=="SG"  SG iPrice Group Footer Validation
    ...  ELSE IF  "${country}"=="PH"  PH iPrice Group Footer Validation
    ...  ELSE IF  "${country}"=="HK"  HK iPrice Group Footer Validation
    ...  ELSE IF  "${country}"=="TH"  TH iPrice Group Footer Validation
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Mouse Over  ${EN_footer_social_header}
    ...  ELSE IF  "${country}"=="VN"  Mouse Over  ${VN_footer_social_header}
    ...  ELSE IF  "${country}"=="ID"  Mouse Over  ${ID_footer_social_header}
    ...  ELSE IF  "${country}"=="TH"  Mouse Over  ${TH_footer_social_header}
    Run Keyword If  "${country}"=="MY"  Element Should Be Visible  ${MY_footer_social_facebook_link}
    ...  ELSE IF  "${country}"=="VN"  Element Should Be Visible  ${VN_footer_social_facebook_link}
    ...  ELSE IF  "${country}"=="ID"  Element Should Be Visible  ${ID_footer_social_facebook_link}
    ...  ELSE IF  "${country}"=="SG"  Element Should Be Visible  ${SG_footer_social_facebook_link}
    ...  ELSE IF  "${country}"=="PH"  Element Should Be Visible  ${PH_footer_social_facebook_link}
    ...  ELSE IF  "${country}"=="HK"  Element Should Be Visible  ${HK_footer_social_facebook_link}
    ...  ELSE IF  "${country}"=="TH"  Element Should Be Visible  ${TH_footer_social_facebook_link}
    Run Keyword If  "${country}"=="MY"  Element Should Be Visible  ${MY_footer_social_pinterest_link}
    ...  ELSE IF  "${country}"=="VN"  Element Should Be Visible  ${VN_footer_social_pinterest_link}
    ...  ELSE IF  "${country}"=="ID"  Element Should Be Visible  ${ID_footer_social_pinterest_link}
    ...  ELSE IF  "${country}"=="SG"  Element Should Be Visible  ${SG_footer_social_pinterest_link}
    ...  ELSE IF  "${country}"=="PH"  Element Should Be Visible  ${PH_footer_social_pinterest_link}
    ...  ELSE IF  "${country}"=="HK"  Element Should Be Visible  ${HK_footer_social_pinterest_link}
    ...  ELSE IF  "${country}"=="TH"  Element Should Be Visible  ${TH_footer_social_pinterest_link}
    Run Keyword If  "${country}"=="MY"  Element Should Be Visible  ${MY_footer_social_twitter_link}
    ...  ELSE IF  "${country}"=="VN"  Element Should Be Visible  ${VN_footer_social_twitter_link}
    ...  ELSE IF  "${country}"=="ID"  Element Should Be Visible  ${ID_footer_social_twitter_link}
    ...  ELSE IF  "${country}"=="SG"  Element Should Be Visible  ${SG_footer_social_twitter_link}
    ...  ELSE IF  "${country}"=="PH"  Element Should Be Visible  ${PH_footer_social_twitter_link}
    ...  ELSE IF  "${country}"=="HK"  Element Should Be Visible  ${HK_footer_social_twitter_link}
    ...  ELSE IF  "${country}"=="TH"  Element Should Be Visible  ${TH_footer_social_twitter_link}
    Element Should Be Visible  ${all_footer_social_google+_text}

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

iPrice Search For Something  [Arguments]  ${country}  ${searchValue}
    Run Keyword If  "${country}"=="MY"  Input Text  ${MY_header_search_input}  ${searchValue}
    ...  ELSE IF  "${country}"=="VN"  Input Text  ${VN_header_search_input}  ${searchValue}
    ...  ELSE IF  "${country}"=="ID"  Input Text  ${ID_header_search_input}  ${searchValue}
    ...  ELSE IF  "${country}"=="SG"  Input Text  ${SG_header_search_input}  ${searchValue}
    ...  ELSE IF  "${country}"=="PH"  Input Text  ${PH_header_search_input}  ${searchValue}
    ...  ELSE IF  "${country}"=="HK"  Input Text  ${HK_header_search_input}  ${searchValue}
    ...  ELSE IF  "${country}"=="TH"  Input Text  ${TH_header_search_input}  ${searchValue}
    Click Element  ${header_search_icon}
    Sleep  1

iPrice Search And Select From Suggestion  [Arguments]  ${country}  ${searchValue}
    Run Keyword If  "${country}"=="MY"  Input Text  ${MY_header_search_input}  ${searchValue}
    ...  ELSE IF  "${country}"=="VN"  Input Text  ${VN_header_search_input}  ${searchValue}
    ...  ELSE IF  "${country}"=="ID"  Input Text  ${ID_header_search_input}  ${searchValue}
    ...  ELSE IF  "${country}"=="SG"  Input Text  ${SG_header_search_input}  ${searchValue}
    ...  ELSE IF  "${country}"=="PH"  Input Text  ${PH_header_search_input}  ${searchValue}
    ...  ELSE IF  "${country}"=="HK"  Input Text  ${HK_header_search_input}  ${searchValue}
    ...  ELSE IF  "${country}"=="TH"  Input Text  ${TH_header_search_input}  ${searchValue}
    Sleep  2
    Wait Until Element Is Visible  //div[@id='search-suggestions']//span[text()='${searchValue}']  timeout=30
    Click Element  //div[@id='search-suggestions']//span[text()='${searchValue}']
