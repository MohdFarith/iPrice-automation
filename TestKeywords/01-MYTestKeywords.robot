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
    Run Keyword And Continue On Failure  Wait Until Page Contains Element  ${MY_header_categories_other_sports_link}
    Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_header_categories_other_sports_link}
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

iPrice MY Do A Search In Header  [Arguments]  ${itemNames}
    Input Text  ${MY_header_search_input}  ${itemNames}
    Click Element  ${MY_header_search_icon}
    Sleep  1
    Title Should Be  ${itemNames} - Buy ${itemNames} online in Malaysia | iPrice
    Wait Until Element Is Visible  //div[@id='products-header']//h1[text()='${itemNames}']

iPrice MY Access Coupons Link
    Click Element  ${MY_header_coupon_logo_link}
    Sleep  1
    Title Should Be  ${MY_coupon_page_title}

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
    Wait Until Element Is Visible  //div[@id='coupon-header']//h1[text()='Lazada Vouchers & Coupon Malaysia 2017']
