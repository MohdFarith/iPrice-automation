*** Settings ***
Documentation  This file will only store keywords for MY.
*** Variables ***

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
    Run Keyword If  ${filter_link2_count}>0  Check Redirection URL

Check Redirection URL
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link2_count}
    \  Create Session  iprice  https://iprice.my/  disable_warnings=0
    \  Sleep  1
    \  ${link}  Get From List  ${filter_link2}  ${INDEX}
    \  ${link2}  Replace String  ${link}  https://iprice.my/  ${empty}
    \  ${link3}  Replace String  ${link2}  ${space}  ${empty}
    \  ${link4}  Replace String  ${link3}  %3Fnocache%3D1  ${empty}
    \  ${link5}  Replace String  ${link4}  ${space}  ${empty}
    \  ${resp}  RequestsLibrary.Get Request  iprice  ${link5}  allow_redirects=True
    \  ${status}  Run Keyword And Return Status  Should Be Equal As Strings  ${resp.status_code}  200
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.my/${link5} failed and not return 200.
    \  Delete All Sessions

SEO Check Internal Link In MY
    ${internal_links}  Create List
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link1_count}
    \  ${link}  Get From List  ${filter_link1}  ${INDEX}
    \  ${match}  Get Regexp Matches  ${link}  iprice.my
    \  ${matchCount}  Get Length  ${match}
    \  Run Keyword If  ${matchCount}>0  Append To List  ${internal_links}  ${link}
    ${internal_links_count}  Get Length  ${internal_links}

    ${internal_links2}  Create List
    :FOR  ${INDEX}  IN RANGE  0  ${internal_links_count}
    \  ${link}  Get From List  ${internal_links}  ${INDEX}
    \  ${match}  Get Regexp Matches  ${link}  /?nocache=1#
    \  ${matchCount}  Get Length  ${match}
    \  Run Keyword If  ${matchCount}==0  Append To List  ${internal_links2}  ${link}
    ${internal_links2_count}  Get Length  ${internal_links2}

    :FOR  ${INDEX}  IN RANGE  0  ${internal_links2_count}
    \  ${link}  Get From List  ${internal_links2}  ${INDEX}
    \  ${link2}  Replace String  ${link}  ?nocache=1  ${empty}
    \  ${status}  Run Keyword And Return Status  Should Start With  ${link2}  https
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  ${link2} does not start with https.
    \  ${status2}  Run Keyword And Return Status  Should End With  ${link2}  /
    \  Run Keyword If  "${status2}"=="False"  Run Keyword And Continue On Failure  Fail  ${link2} does not end with trailing "/".

SEO Check Images ALT In MY  [Arguments]  ${imageCount}
    ${match}  Get Matching Xpath Count  ${MY_product_images}
    Run Keyword If  "${match}"!="${imageCount}"  Run Keyword And Continue On Failure  Fail  Images count wrong.
    :FOR  ${INDEX}  IN RANGE  1  ${imageCount}
    \  ${altImages}  Get Element Attribute  xpath=(${MY_product_images})[${INDEX}]@alt
    \  Run Keyword If  "${altImages}"=="None"  Run Keyword And Continue On Failure  Fail  Image does not contains alt.

Access COOD Says
    Go To  ${COOD_says_url}
    Sleep  3

Validate COOD Says Main Page
    Title Should Be  ${COOD_says_title}
    Wait Until Element Is Visible  ${COOD_says_navbar_header_logo}
    Element Should Be Visible  ${COOD_says_navbar_header_news}
    Element Should Be Visible  ${COOD_says_navbar_header_fun}
    Element Should Be Visible  ${COOD_says_navbar_header_lifestyle}
    Element Should Be Visible  ${COOD_says_navbar_header_entertainment}
    Element Should Be Visible  ${COOD_says_navbar_header_sport}
    Element Should Be Visible  ${COOD_says_navbar_header_tech}
    Element Should Be Visible  ${COOD_says_navbar_header_imho}
    Element Should Be Visible  ${COOD_says_navbar_header_seismik}
    Element Should Be Visible  ${COOD_says_navbar_header_coupons}
    Mouse Over  ${COOD_says_banner}
    Mouse Over  ${COOD_says_categories_header}
    Mouse Over  ${COOD_says_top_coupons_header}
    Mouse Over  ${COOD_says_recent_coupons_header}
    Mouse Over  ${COOD_says_featured_stores_header}
    Mouse Over  ${COOD_says_content_header}
    Mouse Over  ${COOD_says_footer_logo}

Access COOD Rappler EN
    Go To  ${COOD_rappler_en_url}
    Sleep  3

Validate COOD Rappler EN Main Page
    Title Should Be  ${COOD_rappler_en_title}
    Wait Until Element Is Visible  ${COOD_rappler_en_navbar_header_logo}
    Element Should Be Visible  ${COOD_rappler_en_navbar_header_ph}
    Element Should Be Visible  ${COOD_rappler_en_navbar_header_id}
    Mouse Over  ${COOD_rappler_en_header}
    Mouse Over  ${COOD_rappler_en_featured_coupons_header}
    Mouse Over  ${COOD_rappler_en_categories_header}
    Mouse Over  ${COOD_rappler_en_popular_coupons_header}
    Mouse Over  ${COOD_rappler_en_latest_coupons_header}
    Mouse Over  ${COOD_rappler_en_content_area}
    Mouse Over  ${COOD_rappler_en_footer_area}

Access COOD Rappler ID
    Go To  ${COOD_rappler_id_url}
    Sleep  3

Validate COOD Rappler ID Main Page
    Title Should Be  ${COOD_rappler_id_title}
    Wait Until Element Is Visible  ${COOD_rappler_id_navbar_header_logo}
    Element Should Be Visible  ${COOD_rappler_id_navbar_header_ph}
    Element Should Be Visible  ${COOD_rappler_en_navbar_header_id}
    Mouse Over  ${COOD_rappler_id_header}
    Mouse Over  ${COOD_rappler_id_featured_coupons_header}
    Mouse Over  ${COOD_rappler_id_categories_header}
    Mouse Over  ${COOD_rappler_id_popular_coupons_header}
    Mouse Over  ${COOD_rappler_id_latest_coupons_header}
    Mouse Over  ${COOD_rappler_id_content_area}
    Mouse Over  ${COOD_rappler_id_footer_area}

Access iPrice MY Homepage
    Go To  ${MY_homeURL}
    Sleep  1
    Run Keyword And Continue On Failure  Title Should Be  ${MY_homeTitle}

iPrice MY Header Section Validation
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_logo}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_logo_link}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_search_input}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_search_icon}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_popular_searches_text}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_coupon_logo_link}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_coupon_text}
    ${match}  Get Matching Xpath Count  //div[@id='menu']//li[@class='cursor-pointer list-item']//span
    Run Keyword If  ${match}!=60  Run Keyword And Continue On Failure  Fail  Main categories count incorrect.
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_categories_clothing_link}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_categories_shoes_link}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_categories_bags_link}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_categories_watches_link}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_categories_jewellery_link}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_categories_computing_link}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_categories_phones_tablets_link}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_categories_gaming_link}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_categories_camera_photo_link}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_categories_tv_video_dvd_link}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_categories_appliances_link}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_categories_cars_link}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_categories_automotive_link}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_header_categories_+_categories_link}

iPrice MY Homepage Categories Landing
    ${match}  Get Matching Xpath Count  //div[@id='menu']//li[@class='cursor-pointer list-item']//span
    Run Keyword If  ${match}!=60  Run Keyword And Continue On Failure  Fail  Main categories count incorrect.
    Run Keyword And Continue On Failure  Wait Until Element Is Visible  ${MY_header_categories_clothing_link}
    Run Keyword And Continue On Failure  Wait Until Element Is Visible  ${MY_header_categories_shoes_link}
    Run Keyword And Continue On Failure  Wait Until Element Is Visible  ${MY_header_categories_bags_link}
    Run Keyword And Continue On Failure  Wait Until Element Is Visible  ${MY_header_categories_watches_link}
    Run Keyword And Continue On Failure  Wait Until Element Is Visible  ${MY_header_categories_jewellery_link}
    Run Keyword And Continue On Failure  Wait Until Element Is Visible  ${MY_header_categories_computing_link}
    Run Keyword And Continue On Failure  Wait Until Element Is Visible  ${MY_header_categories_phones_tablets_link}
    Run Keyword And Continue On Failure  Wait Until Element Is Visible  ${MY_header_categories_gaming_link}
    Run Keyword And Continue On Failure  Wait Until Element Is Visible  ${MY_header_categories_camera_photo_link}
    Run Keyword And Continue On Failure  Wait Until Element Is Visible  ${MY_header_categories_tv_video_dvd_link}
    Run Keyword And Continue On Failure  Wait Until Element Is Visible  ${MY_header_categories_appliances_link}
    Run Keyword And Continue On Failure  Wait Until Element Is Visible  ${MY_header_categories_automotive_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_hobbies_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_hobbies_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_audio_hifi_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_audio_hifi_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_action_sport_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_action_sport_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_adventure_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_adventure_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_baby_clothing_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_baby_clothing_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_baby_gear_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_baby_gear_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_bath_body_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_bath_body_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_dental_care_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_dental_care_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_diapering_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_diapering_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_eyecare_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_eyecare_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_feeding_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_feeding_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_food_supplements_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_food_supplements_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_gifts_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_gifts_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_gym_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_gym_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_hair_care_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_hair_care_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_health_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_health_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_kids_clothing_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_kids_clothing_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_makeup_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_makeup_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_maternity_care_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_maternity_care_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_medical_supplies_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_medical_supplies_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_nursery_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_nursery_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_perfeum_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_perfeum_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_racquet_sports_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_racquet_sports_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_shaving_supplies_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_shaving_supplies_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_skin_care_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_skin_care_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_supplements_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_supplements_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_team_sports_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_team_sports_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_toys_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_toys_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_water_sports_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_water_sports_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_groceries_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_groceries_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_ear_care_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_ear_care_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_bathroom_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_bathroom_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_bedroom_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_bedroom_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_hallway_entry_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_hallway_entry_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_home_decor_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_home_decor_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_home_improvement_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_home_improvement_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_home_office_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_home_office_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_housekeepng_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_housekeepng_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_kitchen_dining_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_kitchen_dining_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_lighting_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_lighting_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_living_room_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_living_room_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_outdoor_garden_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_outdoor_garden_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_pets_suplies_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_pets_suplies_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_security_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_security_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_stationery_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_stationery_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_gadgets_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_gadgets_link}
    # Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_other_sports_link}
    # Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_other_sports_link}
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_upcoming_products_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_upcoming_products_link}
    Run Keyword And Continue On Failure  Mouse Over    ${MY_header_categories_clothing_link}
    Run Keyword And Continue On Failure  Wait Until Element Is Visible    ${MY_header_categories_clothing_men}
    Run Keyword And Continue On Failure  Wait Until Element Is Visible    ${MY_header_categories_clothing_women}
    Run Keyword And Continue On Failure  Mouse Over    ${MY_header_categories_shoes_link}
    Run Keyword And Continue On Failure  Wait Until Element Is Visible    ${MY_header_categories_shoes_men}
    Run Keyword And Continue On Failure  Wait Until Element Is Visible    ${MY_header_categories_shoes_women}

iPrice MY Access Header Logo Link
    Click Element  ${MY_header_logo_link}
    Sleep  1
    iPrice MY Header Section Validation

iPrice MY Search For A Product  [Arguments]  ${productNames}
    Input Text  ${MY_header_search_input}  ${productNames}
    Click Element  ${MY_header_search_icon}
    Sleep  1
    Title Should Be  ${productNames} - Buy ${productNames} online in Malaysia | iPrice
    Wait Until Element Is Visible  //div[@id='products-header']//h1[text()='${productNames}']

iPrice MY Search For A Brand  [Arguments]  ${brandNames}
    Input Text  ${MY_header_search_input}  ${brandNames}
    Sleep  3
    ${match}  Get Matching Xpath Count  //div[@id='search-suggestions']//li[text()='Brands']|//div[@id='search-suggestions']//em[text()='${brandNames}']
    Run Keyword If  ${match}==2  Click Element  //div[@id='search-suggestions']//ul//li[2]/em[text()='${brandNames}']
    ...  ELSE  Run Keyword And Continue On Failure  Fail  No brands return in result.
    Sleep  1
    Run Keyword If  ${match}==2  Title Should Be  ${brandNames} Online Store | The best prices online in Malaysia | iPrice
    Run Keyword If  ${match}==2  Wait Until Element Is Visible  //div[@id='products-header']//h1[text()='${brandNames} Online Store']

iPrice MY Search For A Coupon  [Arguments]  ${couponNames}
    Input Text  ${MY_header_search_input}  ${couponNames}
    Sleep  3
    ${match}  Get Matching Xpath Count  //div[@id='search-suggestions']//li[text()='Coupons']|//div[@id='search-suggestions']//em[text()='${couponNames}']
    Run Keyword If  ${match}==2  Click Element  //div[@id='search-suggestions']//ul//li[2]/em[text()='${couponNames}']
    ...  ELSE  Run Keyword And Continue On Failure  Fail  No coupon return in result.
    Sleep  1
    # ${month}  Get Current Date  result_format=%B
    # ${year}  Get Current Date  result_format=%Y
    # Run Keyword If  ${match}==2  Run Keyword And Continue On Failure  Title Should Be  ${couponNames} Coupon & Coupon Code in ${month} ${year} | iPrice Malaysia
    # Run Keyword If  ${match}==2  Run Keyword And Continue On Failure  Wait Until Element Is Visible  //div[@id='coupon-header']//h1[text()='${couponNames} Coupon & Coupon Code in Malaysia 2017 ']
    ${title}  Get Title
    Should Contain  ${title}  ${couponNames}

iPrice MY Check Main Categories Display Popup  [Arguments]  ${category_name}
    Run Keyword If  "${category_name}"=="Clothing"  Check Clothing Main Categories and Sub Categories
    ...  ELSE IF  "${category_name}"=="Shoes"  Check Shoes Main Categories and Sub Categories
    ...  ELSE IF  "${category_name}"=="Bags"  Check Bags Main Categories and Sub Categories
    ...  ELSE IF  "${category_name}"=="Watches"  Check Watches Main Categories and Sub Categories
    ...  ELSE IF  "${category_name}"=="Jewellery"  Check Jewellery Main Categories and Sub Categories
    ...  ELSE IF  "${category_name}"=="Computing"  Check Computing Main Categories and Sub Categories
    ...  ELSE IF  "${category_name}"=="Phones & Tablets"  Check Phones & Tablets Main Categories and Sub Categories
    ...  ELSE IF  "${category_name}"=="Gaming"  Check Gaming Main Categories and Sub Categories
    ...  ELSE IF  "${category_name}"=="Camera & Photo"  Check Camera & Photo Main Categories and Sub Categories
    ...  ELSE IF  "${category_name}"=="TV, Video & DVD"  Check TV, Video & DVD Main Categories and Sub Categories
    ...  ELSE IF  "${category_name}"=="Appliances"  Check Appliances Main Categories and Sub Categories
    ...  ELSE IF  "${category_name}"=="Cars"  Check Cars Main Categories and Sub Categories
    ...  ELSE IF  "${category_name}"=="Automotive"  Check Automotive Main Categories and Sub Categories

Check Clothing Main Categories and Sub Categories
    Mouse Over  ${MY_header_categories_clothing_link}
    Wait Until Element Is Visible  ${MY_header_categories_clothing_men}  timeout=10
    Element Should Be Visible  ${MY_header_categories_clothing_men_belts}
    Element Should Be Visible  ${MY_header_categories_clothing_women}
    Element Should Be Visible  ${MY_header_categories_clothing_women_beanies}

Check Shoes Main Categories and Sub Categories
    Mouse Over  ${MY_header_categories_shoes_link}
    Wait Until Element Is Visible  ${MY_header_categories_shoes_men}  timeout=10
    Element Should Be Visible  ${MY_header_categories_shoes_men_accessories}
    Element Should Be Visible  ${MY_header_categories_shoes_women}
    Element Should Be Visible  ${MY_header_categories_shoes_women_accessories}

Check Bags Main Categories and Sub Categories
    Mouse Over  ${MY_header_categories_bags_link}
    Wait Until Element Is Visible  ${MY_header_categories_bags_bag_accessories}  timeout=10
    Element Should Be Visible  ${MY_header_categories_bags_backpacks}
    Element Should Be Visible  ${MY_header_categories_bags_briefcases}
    Element Should Be Visible  ${MY_header_categories_bags_cooler_bags}

Check Watches Main Categories and Sub Categories
    Mouse Over  ${MY_header_categories_watches_link}
    Wait Until Element Is Visible  ${MY_header_categories_watches_analogue_watches}  timeout=10
    Element Should Be Visible  ${MY_header_categories_watches_chronograph_watches}
    Element Should Be Visible  ${MY_header_categories_watches_couple_watches}
    Element Should Be Visible  ${MY_header_categories_watches_digital_watches}

Check Jewellery Main Categories and Sub Categories
    Mouse Over  ${MY_header_categories_jewellery_link}
    Wait Until Element Is Visible  ${MY_header_categories_jewellery_jewellery_accessories}  timeout=10
    Element Should Be Visible  ${MY_header_categories_jewellery_anklet}
    Element Should Be Visible  ${MY_header_categories_jewellery_beads}
    Element Should Be Visible  ${MY_header_categories_jewellery_bracelets}

Check Computing Main Categories and Sub Categories
    Mouse Over  ${MY_header_categories_computing_link}
    Wait Until Element Is Visible  ${MY_header_categories_computing_computing_accessories}  timeout=10
    Element Should Be Visible  ${MY_header_categories_computing_desktop_pcs}
    Element Should Be Visible  ${MY_header_categories_computing_external_storage}
    Element Should Be Visible  ${MY_header_categories_computing_hardware}

Check Phones & Tablets Main Categories and Sub Categories
    Mouse Over  ${MY_header_categories_phones_tablets_link}
    Wait Until Element Is Visible  ${MY_header_categories_phones_tablets_accessories}  timeout=10
    Element Should Be Visible  ${MY_header_categories_phones_tablets_basic_phones}
    Element Should Be Visible  ${MY_header_categories_phones_tablets_bluetooth_headsets}
    Element Should Be Visible  ${MY_header_categories_phones_tablets_landline_phones}

Check Gaming Main Categories and Sub Categories
    Mouse Over  ${MY_header_categories_gaming_link}
    Wait Until Element Is Visible  ${MY_header_categories_gaming_gaming_accessories}  timeout=10
    Element Should Be Visible  ${MY_header_categories_gaming_gaming_controllers}
    Element Should Be Visible  ${MY_header_categories_gaming_games}
    Element Should Be Visible  ${MY_header_categories_gaming_mobile}

Check Camera & Photo Main Categories and Sub Categories
    Mouse Over  ${MY_header_categories_camera_photo_link}
    Wait Until Element Is Visible  ${MY_header_categories_camera_photo_accessories}  timeout=10
    Element Should Be Visible  ${MY_header_categories_camera_photo_action_cameras}
    Element Should Be Visible  ${MY_header_categories_camera_photo_CCTV_cameras}
    Element Should Be Visible  ${MY_header_categories_camera_photo_camcorders}

Check TV, Video & DVD Main Categories and Sub Categories
    Mouse Over  ${MY_header_categories_tv_video_dvd_link}
    Wait Until Element Is Visible  ${MY_header_categories_tv_video_dvd_accessories}  timeout=10
    Element Should Be Visible  ${MY_header_categories_tv_video_dvd_Blu-Ray}
    Element Should Be Visible  ${MY_header_categories_tv_video_dvd_DVD_Players}
    Element Should Be Visible  ${MY_header_categories_tv_video_dvd_HDMI_media_players}

Check Appliances Main Categories and Sub Categories
    Mouse Over  ${MY_header_categories_appliances_link}
    Wait Until Element Is Visible  ${MY_header_categories_appliances_accessories}  timeout=10
    Element Should Be Visible  ${MY_header_categories_appliances_air_conditioners}
    Element Should Be Visible  ${MY_header_categories_appliances_air_purifiers}
    Element Should Be Visible  ${MY_header_categories_appliances_blenders}

Check Cars Main Categories and Sub Categories
    Mouse Over  ${MY_header_categories_cars_link}
    Wait Until Element Is Visible  ${MY_header_categories_cars_classic}  timeout=10
    Element Should Be Visible  ${MY_header_categories_cars_commercials}
    Element Should Be Visible  ${MY_header_categories_cars_general}
    Element Should Be Visible  ${MY_header_categories_cars_MPVs}

Check Automotive Main Categories and Sub Categories
    Mouse Over  ${MY_header_categories_automotive_link}
    Wait Until Element Is Visible  ${MY_header_categories_automotive_car_accessories}  timeout=10
    Element Should Be Visible  ${MY_header_categories_automotive_car_care}
    Element Should Be Visible  ${MY_header_categories_automotive_cars}
    Element Should Be Visible  ${MY_header_categories_automotive_cars_GPS}

iPrice MY Access Main Categories From Homepage  [Arguments]  ${category_name}
    Run Keyword If  "${category_name}"=="Clothing"  Access Clothing Main Category From Homepage
    ...  ELSE IF  "${category_name}"=="Shoes"  Access Shoes Main Category From Homepage
    ...  ELSE IF  "${category_name}"=="Bags"  Access Bags Main Category From Homepage
    ...  ELSE IF  "${category_name}"=="Watches"  Access Watches Main Category From Homepage
    ...  ELSE IF  "${category_name}"=="Jewellery"  Access Jewellery Main Category From Homepage
    ...  ELSE IF  "${category_name}"=="Computing"  Access Computing Main Category From Homepage
    ...  ELSE IF  "${category_name}"=="Phones & Tablets"  Access Phones & Tablets Main Category From Homepage
    ...  ELSE IF  "${category_name}"=="Gaming"  Access Gaming Main Category From Homepage
    ...  ELSE IF  "${category_name}"=="Camera & Photo"  Access Camera & Photo Main Category From Homepage
    ...  ELSE IF  "${category_name}"=="TV, Video & DVD"  Access TV, Video & DVD Main Category From Homepage
    ...  ELSE IF  "${category_name}"=="Appliances"  Access Appliances Main Category From Homepage
    ...  ELSE IF  "${category_name}"=="Cars"  Access Cars Main Category From Homepage
    ...  ELSE IF  "${category_name}"=="Automotive"  Access Automotive Main Category From Homepage

Access Clothing Main Category From Homepage
    Click Element  ${MY_header_categories_clothing_link}
    Sleep  3
    Title Should Be  ${MY_category_clothing_title}
    iPrice MY Header Section Validation
    Wait Until Element Is Visible  ${MY_category_clothing_header}
    Element Should Be Visible  ${MY_category_clothing_filter_gender_header}
    Element Should Be Visible  ${MY_category_clothing_filter_gender_men}
    Element Should Be Visible  ${MY_category_clothing_filter_gender_women}

Access Shoes Main Category From Homepage
    Click Element  ${MY_header_categories_shoes_link}
    Sleep  3
    Title Should Be  ${MY_category_shoes_title}
    iPrice MY Header Section Validation
    Wait Until Element Is Visible  ${MY_category_shoes_header}
    Element Should Be Visible  ${MY_category_shoes_filter_gender_header}
    Element Should Be Visible  ${MY_category_shoes_filter_gender_men}
    Element Should Be Visible  ${MY_category_shoes_filter_gender_women}

Shoes Main Category Validation
    ${link}  Get Location
    Should Be Equal  ${link}  https://iprice.my/shoes/
    Element Should Be Visible  ${MY_category_shoes_breadcrumb}
    iPrice MY Validate Sort By Filter
    Mouse Over  ${MY_category_shoes_sub_sandal_top_filter_text}
    Element Should Be Visible  ${MY_category_shoes_sub_sandal_top_filter_image}
    Mouse Over  ${MY_category_shoes_sub_sneakers_top_filter_text}
    Element Should Be Visible  ${MY_category_shoes_sub_sneakers_top_filter_image}
    Mouse Over  ${MY_category_shoes_sub_sport_shoes_top_filter_text}
    Element Should Be Visible  ${MY_category_shoes_sub_sport_shoes_top_filter_image}
    Mouse Over  ${MY_category_shoes_sub_loafers_top_filter_text}
    Element Should Be Visible  ${MY_category_shoes_sub_loafers_top_filter_image}
    Mouse Over  ${MY_category_shoes_sub_boat_shoes_top_filter_text}
    Element Should Be Visible  ${MY_category_shoes_sub_boat_shoes_top_filter_image}
    Mouse Over  ${MY_category_shoes_sub_boots_top_filter_text}
    Element Should Be Visible  ${MY_category_shoes_sub_boots_top_filter_image}
    Mouse Over  ${MY_category_shoes_sub_flip_flops_top_filter_text}
    Element Should Be Visible  ${MY_category_shoes_sub_flip_flops_top_filter_image}
    Mouse Over  ${MY_category_shoes_sub_flats_top_filter_text}
    Element Should Be Visible  ${MY_category_shoes_sub_flats_top_filter_image}
    Mouse Over  ${MY_category_shoes_sub_high_heels_top_filter_text}
    Element Should Be Visible  ${MY_category_shoes_sub_high_heels_top_filter_image}
    Mouse Over  ${MY_category_shoes_sub_kids_baby_shoes_filter_text}
    Element Should Be Visible  ${MY_category_shoes_sub_kids_baby_shoes_top_filter_image}
    Mouse Over  ${MY_category_shoes_sub_pumps_top_filter_text}
    Element Should Be Visible  ${MY_category_shoes_sub_pumps_top_filter_image}
    Mouse Over  ${MY_category_shoes_sub_wedges_top_filter_text}
    Element Should Be Visible  ${MY_category_shoes_sub_wedges_top_filter_image}
    Mouse Over  ${MY_category_shoes_sub_platform_shoes_top_filter_text}
    Element Should Be Visible  ${MY_category_shoes_sub_platform_shoes_top_filter_image}
    Mouse Over  ${MY_category_shoes_sub_brogue_shoes_top_filter_text}
    Element Should Be Visible  ${MY_category_shoes_sub_brogue_shoes_top_filter_image}
    Mouse Over  ${MY_category_shoes_sub_safety_shoes_top_filter_text}
    Element Should Be Visible  ${MY_category_shoes_sub_safety_shoes_top_filter_image}
    Mouse Over  ${MY_category_shoes_sub_accessories_top_filter_text}
    Element Should Be Visible  ${MY_category_shoes_sub_accessories_top_filter_image}
    Mouse Over  ${MY_category_shoes_sub_led_shoes_top_filter_text}
    Element Should Be Visible  ${MY_category_shoes_sub_led_shoes_top_filter_image}
    Element Should Be Visible  ${MY_category_shoes_left_filter_categories_header}
    Mouse Over  ${MY_category_shoes_sub_sandal_left_filter_text}
    Mouse Over  ${MY_category_shoes_sub_sneakers_left_filter_text}
    Mouse Over  ${MY_category_shoes_sub_sport_shoes_left_filter_text}
    Mouse Over  ${MY_category_shoes_sub_loafers_left_filter_text}
    Mouse Over  ${MY_category_shoes_sub_boat_shoes_left_filter_text}
    Mouse Over  ${MY_category_shoes_sub_boots_left_filter_text}
    Mouse Over  ${MY_category_shoes_sub_flip_flops_left_filter_text}
    Mouse Over  ${MY_category_shoes_sub_flats_left_filter_text}
    Mouse Over  ${MY_category_shoes_sub_high_heels_left_filter_text}
    Mouse Over  ${MY_category_shoes_sub_kids_baby_shoes_left_filter_text}
    Mouse Over  ${MY_category_shoes_sub_pumps_left_filter_text}
    Mouse Over  ${MY_category_shoes_sub_wedges_left_filter_text}
    Mouse Over  ${MY_category_shoes_sub_platform_shoes_left_filter_text}
    Mouse Over  ${MY_category_shoes_sub_brogue_shoes_left_filter_text}
    Mouse Over  ${MY_category_shoes_sub_safety_shoes_left_filter_text}
    Mouse Over  ${MY_category_shoes_sub_accessories_left_filter_text}
    Mouse Over  ${MY_category_shoes_sub_led_shoes_left_filter_text}
    iPrice MY Validate Price Filter
    iPrice MY Validate Discovery Product


Access Bags Main Category From Homepage
    Click Element  ${MY_header_categories_bags_link}
    Sleep  3
    Title Should Be  ${MY_category_bags_title}
    iPrice MY Header Section Validation
    Wait Until Element Is Visible  ${MY_category_bags_header}
    Element Should Be Visible  ${MY_category_bags_filter_gender_header}
    Element Should Be Visible  ${MY_category_bags_filter_gender_men}
    Element Should Be Visible  ${MY_category_bags_filter_gender_women}

Access Watches Main Category From Homepage
    Click Element  ${MY_header_categories_watches_link}
    Sleep  3
    Title Should Be  ${MY_category_watches_title}
    iPrice MY Header Section Validation
    Wait Until Element Is Visible  ${MY_category_watches_header}
    Element Should Be Visible  ${MY_category_watches_filter_gender_header}
    Element Should Be Visible  ${MY_category_watches_filter_gender_men}
    Element Should Be Visible  ${MY_category_watches_filter_gender_women}

Access Jewellery Main Category From Homepage
    Click Element  ${MY_header_categories_jewellery_link}
    Sleep  3
    Title Should Be  ${MY_category_jewellery_title}
    iPrice MY Header Section Validation
    Wait Until Element Is Visible  ${MY_category_jewellery_header}
    Element Should Be Visible  ${MY_category_jewellery_filter_gender_header}
    Element Should Be Visible  ${MY_category_jewellery_filter_gender_men}
    Element Should Be Visible  ${MY_category_jewellery_filter_gender_women}

Access Computing Main Category From Homepage
    Click Element  ${MY_header_categories_computing_link}
    Sleep  3
    Title Should Be  ${MY_category_computing_title}
    iPrice MY Header Section Validation
    Wait Until Element Is Visible  ${MY_category_computing_header}
    Element Should Be Visible  ${MY_category_computing_filter_gender_header}
    Element Should Be Visible  ${MY_category_computing_filter_gender_men}
    Element Should Be Visible  ${MY_category_computing_filter_gender_women}

Access Phones & Tablets Main Category From Homepage
    Click Element  ${MY_header_categories_phones_tablets_link}
    Sleep  3
    Title Should Be  ${MY_category_phones_tablets_title}
    iPrice MY Header Section Validation
    Wait Until Element Is Visible  ${MY_category_phones_tablets_header}
    Element Should Be Visible  ${MY_category_phones_tablets_filter_gender_header}
    Element Should Be Visible  ${MY_category_phones_tablets_filter_gender_men}
    Element Should Be Visible  ${MY_category_phones_tablets_filter_gender_women}

Access Gaming Main Category From Homepage
    Click Element  ${MY_header_categories_gaming_link}
    Sleep  3
    Title Should Be  ${MY_category_gaming_title}
    iPrice MY Header Section Validation
    Wait Until Element Is Visible  ${MY_category_gaming_header}
    Element Should Be Visible  ${MY_category_gaming_filter_gender_header}
    Element Should Be Visible  ${MY_category_gaming_filter_gender_men}
    Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_category_gaming_filter_gender_women}

Access Camera & Photo Main Category From Homepage
    Click Element  ${MY_header_categories_camera_photo_link}
    Sleep  3
    Title Should Be  ${MY_category_camera_photo_title}
    iPrice MY Header Section Validation
    Wait Until Element Is Visible  ${MY_category_camera_photo_header}
    Element Should Be Visible  ${MY_category_camera_photo_filter_gender_header}
    Element Should Be Visible  ${MY_category_camera_photo_filter_gender_men}
    Element Should Be Visible  ${MY_category_camera_photo_filter_gender_women}

Access TV, Video & DVD Main Category From Homepage
    Click Element  ${MY_header_categories_tv_video_dvd_link}
    Sleep  3
    Title Should Be  ${MY_category_tv_video_dvd_title}
    iPrice MY Header Section Validation
    Wait Until Element Is Visible  ${MY_category_tv_video_dvd_header}
    Element Should Be Visible  ${MY_category_tv_video_dvd_filter_gender_header}
    Element Should Be Visible  ${MY_category_tv_video_dvd_filter_gender_men}
    Element Should Be Visible  ${MY_category_tv_video_dvd_filter_gender_women}

Access Appliances Main Category From Homepage
    Click Element  ${MY_header_categories_appliances_link}
    Sleep  3
    Title Should Be  ${MY_category_appliances_title}
    iPrice MY Header Section Validation
    Wait Until Element Is Visible  ${MY_category_appliances_header}
    Element Should Be Visible  ${MY_category_appliances_filter_gender_header}
    Element Should Be Visible  ${MY_category_appliances_filter_gender_men}
    Element Should Be Visible  ${MY_category_appliances_filter_gender_women}

Access Cars Main Category From Homepage
    Click Element  ${MY_header_categories_cars_link}
    Sleep  3
    Title Should Be  ${MY_category_cars_title}
    iPrice MY Header Section Validation
    Wait Until Element Is Visible  ${MY_category_cars_header}

Access Automotive Main Category From Homepage
    Click Element  ${MY_header_categories_automotive_link}
    Sleep  3
    Title Should Be  ${MY_category_automotive_title}
    iPrice MY Header Section Validation
    Wait Until Element Is Visible  ${MY_category_automotive_header}
    Element Should Be Visible  ${MY_category_automotive_filter_gender_header}
    Element Should Be Visible  ${MY_category_automotive_filter_gender_men}
    Element Should Be Visible  ${MY_category_automotive_filter_gender_women}

iPrice MY Access +Categories From Navigation Bar
    Mouse Over  ${MY_header_categories_+_categories_link}
    Click Element  ${MY_header_categories_+_categories_link}
    Sleep  3
    Title Should Be  ${MY_+categories_title}
    iPrice MY Header Section Validation
    Wait Until Element Is Visible  ${MY_+categories_header}
    Wait Until Page Contains Element  ${MY_+categories_clothing_main}
    Mouse Over  ${MY_+categories_clothing_main}
    Wait Until Page Contains Element  ${MY_+categories_shoes_main}
    Mouse Over  ${MY_+categories_shoes_main}
    Wait Until Page Contains Element  ${MY_+categories_bags_main}
    Mouse Over  ${MY_+categories_bags_main}
    Wait Until Page Contains Element  ${MY_+categories_watches_main}
    Mouse Over  ${MY_+categories_watches_main}
    Wait Until Page Contains Element  ${MY_+categories_jewellery_main}
    Mouse Over  ${MY_+categories_jewellery_main}
    Wait Until Page Contains Element  ${MY_+categories_computing_main}
    Mouse Over  ${MY_+categories_computing_main}
    Wait Until Page Contains Element  ${MY_+categories_phones_tablets_main}
    Mouse Over  ${MY_+categories_phones_tablets_main}
    Wait Until Page Contains Element  ${MY_+categories_gaming_main}
    Mouse Over  ${MY_+categories_gaming_main}
    Wait Until Page Contains Element  ${MY_+categories_camera_photo_main}
    Mouse Over  ${MY_+categories_camera_photo_main}
    Wait Until Page Contains Element  ${MY_+categories_tv_video_dvd_main}
    Mouse Over  ${MY_+categories_tv_video_dvd_main}
    Wait Until Page Contains Element  ${MY_+categories_appliances_main}
    Mouse Over  ${MY_+categories_appliances_main}
    Wait Until Page Contains Element  ${MY_+categories_cars_main}
    Mouse Over  ${MY_+categories_cars_main}
    Wait Until Page Contains Element  ${MY_+categories_automotive_main}
    Mouse Over  ${MY_+categories_automotive_main}
    Wait Until Page Contains Element  ${MY_+categories_hobbies_main}
    Mouse Over  ${MY_+categories_hobbies_main}
    Wait Until Page Contains Element  ${MY_+categories_audio_hifi_main}
    Mouse Over  ${MY_+categories_audio_hifi_main}
    Wait Until Page Contains Element  ${MY_+categories_action_sports_main}
    Mouse Over  ${MY_+categories_action_sports_main}
    Wait Until Page Contains Element  ${MY_+categories_adventure_main}
    Mouse Over  ${MY_+categories_adventure_main}
    Wait Until Page Contains Element  ${MY_+categories_baby_clothing_main}
    Mouse Over  ${MY_+categories_baby_clothing_main}
    Wait Until Page Contains Element  ${MY_+categories_baby_gear_main}
    Mouse Over  ${MY_+categories_baby_gear_main}
    Wait Until Page Contains Element  ${MY_+categories_bath_body_main}
    Mouse Over  ${MY_+categories_bath_body_main}
    Wait Until Page Contains Element  ${MY_+categories_dental_care_main}
    Mouse Over  ${MY_+categories_dental_care_main}
    Wait Until Page Contains Element  ${MY_+categories_diapering_main}
    Mouse Over  ${MY_+categories_diapering_main}
    Wait Until Page Contains Element  ${MY_+categories_eyecare_main}
    Mouse Over  ${MY_+categories_eyecare_main}
    Wait Until Page Contains Element  ${MY_+categories_feeding_main}
    Mouse Over  ${MY_+categories_feeding_main}
    Wait Until Page Contains Element  ${MY_+categories_food_supplements_main}
    Mouse Over  ${MY_+categories_food_supplements_main}
    Wait Until Page Contains Element  ${MY_+categories_gifts_main}
    Mouse Over  ${MY_+categories_gifts_main}
    Wait Until Page Contains Element  ${MY_+categories_gym_main}
    Mouse Over  ${MY_+categories_gym_main}
    Wait Until Page Contains Element  ${MY_+categories_hair_care_main}
    Mouse Over  ${MY_+categories_hair_care_main}
    Wait Until Page Contains Element  ${MY_+categories_health_main}
    Mouse Over  ${MY_+categories_health_main}
    Wait Until Page Contains Element  ${MY_+categories_kids_clothing_main}
    Mouse Over  ${MY_+categories_kids_clothing_main}
    Wait Until Page Contains Element  ${MY_+categories_makeup_main}
    Mouse Over  ${MY_+categories_makeup_main}
    Wait Until Page Contains Element  ${MY_+categories_maternity_care_main}
    Mouse Over  ${MY_+categories_maternity_care_main}
    Wait Until Page Contains Element  ${MY_+categories_medical_supplies_main}
    Mouse Over  ${MY_+categories_medical_supplies_main}
    Wait Until Page Contains Element  ${MY_+categories_nursery_link}
    Mouse Over  ${MY_+categories_nursery_link}
    Wait Until Page Contains Element  ${MY_+categories_perfeum_link}
    Mouse Over  ${MY_+categories_perfeum_link}
    Wait Until Page Contains Element  ${MY_+categories_racquet_sports_link}
    Mouse Over  ${MY_+categories_racquet_sports_link}
    Wait Until Page Contains Element  ${MY_+categories_shaving_supplies_link}
    Mouse Over  ${MY_+categories_shaving_supplies_link}
    Wait Until Page Contains Element  ${MY_+categories_skin_care_link}
    Mouse Over  ${MY_+categories_skin_care_link}
    Wait Until Page Contains Element  ${MY_+categories_supplements_link}
    Mouse Over  ${MY_+categories_supplements_link}
    Wait Until Page Contains Element  ${MY_+categories_team_sports_link}
    Mouse Over  ${MY_+categories_team_sports_link}
    Wait Until Page Contains Element  ${MY_+categories_toys_link}
    Mouse Over  ${MY_+categories_toys_link}
    Wait Until Page Contains Element  ${MY_+categories_water_sports_link}
    Mouse Over  ${MY_+categories_water_sports_link}
    Wait Until Page Contains Element  ${MY_+categories_groceries_link}
    Mouse Over  ${MY_+categories_groceries_link}
    Wait Until Page Contains Element  ${MY_+categories_ear_care_link}
    Mouse Over  ${MY_+categories_ear_care_link}
    Wait Until Page Contains Element  ${MY_+categories_bathroom_link}
    Mouse Over  ${MY_+categories_bathroom_link}
    Wait Until Page Contains Element  ${MY_+categories_bedroom_link}
    Mouse Over  ${MY_+categories_bedroom_link}
    Wait Until Page Contains Element  ${MY_+categories_hallway_entry_link}
    Mouse Over  ${MY_+categories_hallway_entry_link}
    Wait Until Page Contains Element  ${MY_+categories_home_decor_link}
    Mouse Over  ${MY_+categories_home_decor_link}
    Wait Until Page Contains Element  ${MY_+categories_home_improvement_link}
    Mouse Over  ${MY_+categories_home_improvement_link}
    Wait Until Page Contains Element  ${MY_+categories_home_office_link}
    Mouse Over  ${MY_+categories_home_office_link}
    Wait Until Page Contains Element  ${MY_+categories_housekeepng_link}
    Mouse Over  ${MY_+categories_housekeepng_link}
    Wait Until Page Contains Element  ${MY_+categories_kitchen_dining_link}
    Mouse Over  ${MY_+categories_kitchen_dining_link}
    Wait Until Page Contains Element  ${MY_+categories_lighting_link}
    Mouse Over  ${MY_+categories_lighting_link}
    Wait Until Page Contains Element  ${MY_+categories_living_room_link}
    Mouse Over  ${MY_+categories_living_room_link}
    Wait Until Page Contains Element  ${MY_+categories_outdoor_garden_link}
    Mouse Over  ${MY_+categories_outdoor_garden_link}
    Wait Until Page Contains Element  ${MY_+categories_pets_suplies_link}
    Mouse Over  ${MY_+categories_pets_suplies_link}
    Wait Until Page Contains Element  ${MY_+categories_security_link}
    Mouse Over  ${MY_+categories_security_link}
    Wait Until Page Contains Element  ${MY_+categories_stationery_link}
    Mouse Over  ${MY_+categories_stationery_link}
    Wait Until Page Contains Element  ${MY_+categories_gadgets_link}
    Mouse Over  ${MY_+categories_gadgets_link}
    # Wait Until Page Contains Element  ${MY_+categories_other_sports_link}
    # Mouse Over  ${MY_+categories_other_sports_link}
    Wait Until Page Contains Element  ${MY_+categories_upcoming_products_link}
    Mouse Over  ${MY_+categories_upcoming_products_link}

iPrice MY Access Coupons Link
    Click Element  ${MY_header_coupon_logo_link}
    Sleep  1
    Title Should Be  ${MY_coupon_page_title}

iPrice MY Check Search, Compare & Save Section
    # Mouse Over  ${MY_search_compare_save_header}
    Mouse Over  ${MY_search_compare_save_electronic_gaming_box}
    ${text1}  Get Text  //div[@id='hp-electronics']//span[text()='Electronics & ']
    ${text2}  Get Text  //div[@id='hp-electronics']//span[text()='Gaming']
    ${result}  Catenate  ${text1}  ${text2}
    Should Be Equal  ${result}  Electronics & Gaming
    Click Element  ${MY_search_compare_save_electronic_gaming_box}
    Wait Until Element Is Visible  ${MY_search_compare_save_electronic_gaming_box_computing}
    Mouse Over  ${MY_search_compare_save_electronic_gaming_box_computing}
    Mouse Over  ${MY_search_compare_save_fashion_beauty_box}
    ${text1}  Get Text  //div[@id='hp-fashion']//span[text()='Fashion & ']
    ${text2}  Get Text  //div[@id='hp-fashion']//span[text()='Beauty']
    ${result}  Catenate  ${text1}  ${text2}
    Should Be Equal  ${result}  Fashion & Beauty
    Click Element  ${MY_search_compare_save_fashion_beauty_box}
    Wait Until Element Is Visible  ${MY_search_compare_save_fashion_beauty_box_clothing}
    Mouse Over  ${MY_search_compare_save_fashion_beauty_box_clothing}
    Mouse Over  ${MY_search_compare_save_coupons_offers_box}
    ${text1}  Get Text  //div[@id='hp-coupon']//span[text()='Coupons & ']
    ${text2}  Get Text  //div[@id='hp-coupon']//span[text()='Offers']
    ${result}  Catenate  ${text1}  ${text2}
    Should Be Equal  ${result}  Coupons & Offers
    Click Element  ${MY_search_compare_save_coupons_offers_box}
    Wait Until Element Is Visible  ${MY_search_compare_save_coupons_offers_box_electronics}
    Mouse Over  ${MY_search_compare_save_coupons_offers_box_electronics}

iPrice MY Coupons Page Landing
    ${date}  Get Current Date
    ${dateList}  Split String  ${date}  separator=-
    ${year}  Get From List  ${dateList}  0
    Wait Until Element Is Visible  //div[@id='content']//h1[text()="Exclusive Sales, Promotions & Coupons in Malaysia ${year}"]

iPrice MY Coupons Access All Store
    Mouse Over  ${MY_coupon_see_all_store_link}
    Click Element  ${MY_coupon_see_all_store_link}
    Sleep  1
    Title Should Be  ${MY_coupon_stores_title}

iPrice MY Coupons Store Access A Store  [Arguments]  ${store_name}
    Mouse Over  //div[@class='coupons-stores']//div[@class='coupon-store-item']//a[text()=' ${store_name} ']
    Click Element  //div[@class='coupons-stores']//div[@class='coupon-store-item']//a[text()=' ${store_name} ']
    Wait Until Element Is Visible  //div[@id='coupon-header']//h1[contains(text(),'Lazada Voucher')]

iPrice MY Validate Sort By Filter
    Element Should Be Visible  ${MY_sort_by_text}
    Element Should Be Visible  ${MY_sort_by_button}
    Page Should Contain Element  ${MY_sort_by_popularity_text}
    Page Should Contain Element  ${MY_sort_by_relevance_text}
    Page Should Contain Element  ${MY_sort_by_ascending_text}
    Page Should Contain Element  ${MY_sort_by_descending_text}
    Page Should Contain Element  ${MY_sort_by_name_text}

iPrice MY Validate Price Filter
    Mouse Over  ${MY_filter_price_header}
    Mouse Over  ${MY_filter_price_min_price_box}
    Mouse Over  ${MY_filter_price_max_price_box}
    Mouse Over  ${MY_filter_price_slider}

iPrice MY Validate Footer
    Mouse Over  ${MY_footer_international_header}
    Element Should Be Visible  ${MY_footer_international_singapore_link}
    Element Should Be Visible  ${MY_footer_international_indonesia_link}
    Element Should Be Visible  ${MY_footer_international_philippines_link}
    Element Should Be Visible  ${MY_footer_international_hong_kong_link}
    Element Should Be Visible  ${MY_footer_international_thailand_link}
    Element Should Be Visible  ${MY_footer_international_vietnam_link}
    Element Should Be Visible  ${MY_footer_ipricegroup_header}
    Element Should Be Visible  ${MY_footer_ipricegroup_about_us_link}
    Element Should Be Visible  ${MY_footer_ipricegroup_trends_link}
    Element Should Be Visible  ${MY_footer_ipricegroup_contact_us_link}
    Element Should Be Visible  ${MY_footer_ipricegroup_carreers_link}
    Element Should Be Visible  ${MY_footer_ipricegroup_partners_link}
    Element Should Be Visible  ${MY_footer_ipricegroup_privacy_policy_link}
    Element Should Be Visible  ${MY_footer_ipricegroup_terms_of_use_link}
    Element Should Be Visible  ${MY_footer_ipricegroup_iema_link}
    Element Should Be Visible  ${MY_footer_social_header}
    Element Should Be Visible  ${MY_footer_social_facebook_link}
    Element Should Be Visible  ${MY_footer_social_pinterest_link}
    Element Should Be Visible  ${MY_footer_social_twitter_link}
    Element Should Be Visible  ${MY_footer_social_google+_link}

iPrice MY Validate Discovery Product
    ${product}  Get Matching Xpath Count  ${MY_product_list}
    :FOR  ${INDEX}  IN RANGE  1  ${product}
    \  ${popup}  Get Matching Xpath Count  //div[@id='survicate-box']//span[@title='Close']
    \  Run Keyword If  "${popup}" == "1"  Sleep  15
    # \  Run Keyword If  ${popup}>1  Wait Until Element Is Visible  //div[@id='survicate-box']//div[text()='Is this the first time you are visiting our website?']  timeout=20
    # \  Run Keyword If  ${popup}>1  Wait Until Element Is Visible  //div[@id='survicate-box']//span[text()='Yes']  timeout=20
    # \  Run Keyword If  ${popup}>1  Wait Until Element Is Visible  //div[@id='survicate-box']//span[text()='No']  timeout=20
    \  Run Keyword If  "${popup}" == "1"  Click Element  //div[@id='survicate-box']//span[@title='Close']
    \  Run Keyword If  "${popup}" == "1"  Sleep  10
    \  Run Keyword If  "${popup}" == "1"  Wait Until Page Does Not Contain Element  //div[@id='survicate-box']//span[@title='Close']  timeout=20
    \  Mouse Over  ${MY_product_list}[${INDEX}]
    \  Wait Until Element Is Visible  //section[@class='product-list']//a[@class='product-unit hover-popup product cursor-pointer'][${INDEX}]//div[@class='store initial']
    \  Element Should Be Visible  //section[@class='product-list']//a[@class='product-unit hover-popup product cursor-pointer'][${INDEX}]//div[contains(@class,'large') and normalize-space(text()='Go to Shop')]
    \  Wait Until Element Is Visible  //section[@class='product-list']//a[@class='product-unit hover-popup product cursor-pointer'][${INDEX}]//img[contains(@class,'lazy product-img') and contains(@class,'loaded')]  timeout=30

iPrice MY Select Sort By  [Arguments]  ${value}
    Mouse Over  ${MY_sort_by_down_arrow}
    Click Element  ${MY_sort_by_down_arrow}
    Wait Until Element Is Visible  ${MY_sort_by_popularity_text}
    Element Should Be Visible  ${MY_sort_by_relevance_text}
    Element Should Be Visible  ${MY_sort_by_ascending_text}
    Element Should Be Visible  ${MY_sort_by_descending_text}
    Element Should Be Visible  ${MY_sort_by_name_text}
    Click Element  //div[@id='sort']//a[text()='${value}']

iPrice MY Check Product Discovery Price Ascending  [Arguments]  ${category}
    ${link}  Get Location
    Should Be Equal  ${link}  https://iprice.my/${category}/?sort=price.sale_asc
    Element Should Be Visible  ${MY_category_shoes_breadcrumb}
    iPrice MY Validate Discovery Product
    ${product}  Get Matching Xpath Count  ${MY_product_list}
    :FOR  ${INDEX}  IN RANGE  1  ${product}
    \  ${price1}  Get Text  //section[@class='product-list']//a[@class='product-unit hover-popup product cursor-pointer'][${INDEX}]//span[@class='accent']
    \  ${price1}  Remove String  ${price1}  RM
    \  ${price1}  Strip String  ${SPACE}${price1}${SPACE}
    \  ${price1}  Convert To Number  ${price1}
    \  ${price2}  Get Text  //section[@class='product-list']//a[@class='product-unit hover-popup product cursor-pointer'][${INDEX}+1]//span[@class='accent']
    \  ${price2}  Remove String  ${price2}  RM
    \  ${price2}  Strip String  ${SPACE}${price2}${SPACE}
    \  ${price2}  Convert To Number  ${price2}
    \  Run Keyword If  ${price1}>${price2}  Fail  Price not sort accending correctly.
    \  Mouse Over  ${MY_product_list}[${INDEX}]
    \  Wait Until Element Is Visible  //section[@class='product-list']//a[@class='product-unit hover-popup product cursor-pointer'][${INDEX}]//div[@class='store initial']
    \  Element Should Be Visible  //section[@class='product-list']//a[@class='product-unit hover-popup product cursor-pointer'][${INDEX}]//div[contains(@class,'large') and normalize-space(text()='Go to Shop')]
    \  Wait Until Element Is Visible  //section[@class='product-list']//a[@class='product-unit hover-popup product cursor-pointer'][${INDEX}]//img[contains(@class,'lazy product-img') and contains(@class,'loaded')]  timeout=10
