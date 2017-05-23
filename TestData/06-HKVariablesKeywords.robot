*** Settings ***
Documentation    This file will only store variables and keywords for HK..

*** Variables ***

${HK_homeURL}  https://iprice.hk/?nocache=1
${HK_homeTitle}  Online Shopping, Coupons & Discount Codes at iprice Hong Kong
${HK_header_logo_link}  //div[@id='logo']//a[@href='https://iprice.hk/']
${HK_header_search_input}  //div[@id='search']//input[@placeholder='Search for products, coupons or brands...']
${HK_header_search_icon}  //div[@id='search']//i[@class='icon icon-search-blue']
${HK_header_popular_searches_text}  //div[@id='popular-searches']//li[normalize-space(text())='Popular Searches:']
${HK_header_coupon_logo_link}  //div[@id='news-button']//a[@href='https://iprice.hk/coupons/']
${HK_header_coupon_text}  //div[@id='news-button']//button[normalize-space(text())='Coupons & Offers']
${HK_header_categories_clothing_link}  //div[@id='menu']//a[@href='https://iprice.hk/clothing/']//span[text()='Clothing']
${HK_header_categories_clothing_men}  //div[@id='menu']//a[contains(@href,'https://iprice.hk/clothing/men/') and text()='Men']
${HK_header_categories_clothing_women}  //div[@id='menu']//a[contains(@href,'https://iprice.hk/clothing/women/') and text()='Women']
${HK_header_categories_shoes_link}  //div[@id='menu']//a[@href='https://iprice.hk/shoes/']//span[text()='Shoes']
${HK_header_categories_shoes_men}  //div[@id='menu']//a[contains(@href,'https://iprice.hk/shoes/men/') and text()='Men']
${HK_header_categories_shoes_women}  //div[@id='menu']//a[contains(@href,'https://iprice.hk/shoes/women/') and text()='Women']
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
${HK_header_categories_hobbies_link}  //div[@id='menu']//a[@href='https://iprice.hk/hobbies/']//span[text()='Hobbies']
${HK_header_categories_audio_hifi_link}  //div[@id='menu']//a[@href='https://iprice.hk/audio-hi-fi/']//span[text()='Audio & Hi Fi']
${HK_header_categories_action_sport_link}  //div[@id='menu']//a[@href='https://iprice.hk/action-sports/']//span[text()='Action Sports']
${HK_header_categories_adventure_link}  //div[@id='menu']//a[@href='https://iprice.hk/adventure/']//span[text()='Adventure']
${HK_header_categories_baby_clothing_link}  //div[@id='menu']//a[@href='https://iprice.hk/baby-clothing/']//span[text()='Baby Clothing']
${HK_header_categories_baby_gear_link}  //div[@id='menu']//a[@href='https://iprice.hk/baby-gear/']//span[text()='Baby Gear']
${HK_header_categories_bath_body_link}  //div[@id='menu']//a[@href='https://iprice.hk/bath-body/']//span[text()='Bath & Body']
${HK_header_categories_dental_care_link}  //div[@id='menu']//a[@href='https://iprice.hk/dental-care/']//span[text()='Dental Care']
${HK_header_categories_diapering_link}  //div[@id='menu']//a[@href='https://iprice.hk/diapering/']//span[text()='Diapering']
${HK_header_categories_eyecare_link}  //div[@id='menu']//a[@href='https://iprice.hk/eyecare/']//span[text()='Eyecare']
${HK_header_categories_feeding_link}  //div[@id='menu']//a[@href='https://iprice.hk/feeding/']//span[text()='Feeding']
${HK_header_categories_food_supplements_link}  //div[@id='menu']//a[@href='https://iprice.hk/food-supplements/']//span[text()='Food Supplements']
${HK_header_categories_gifts_link}  //div[@id='menu']//a[@href='https://iprice.hk/gifts/']//span[text()='Gifts']
${HK_header_categories_gym_link}  //div[@id='menu']//a[@href='https://iprice.hk/gym/']//span[text()='Gym']
${HK_header_categories_hair_care_link}  //div[@id='menu']//a[@href='https://iprice.hk/hair-care/']//span[text()='Hair Care']
${HK_header_categories_health_link}  //div[@id='menu']//a[@href='https://iprice.hk/health/']//span[text()='Health']
${HK_header_categories_kids_clothing_link}  //div[@id='menu']//a[@href='https://iprice.hk/kids-clothing/']//span[text()='Kids Clothing']
${HK_header_categories_makeup_link}  //div[@id='menu']//a[@href='https://iprice.hk/makeup/']//span[text()='Makeup']
${HK_header_categories_maternity_care_link}  //div[@id='menu']//a[@href='https://iprice.hk/maternity-care/']//span[text()='Maternity Care']
${HK_header_categories_medical_supplies_link}  //div[@id='menu']//a[@href='https://iprice.hk/medical-supplies/']//span[text()='Medical Supplies']
${HK_header_categories_nursery_link}  //div[@id='menu']//a[@href='https://iprice.hk/nursery/']//span[text()='Nursery']
${HK_header_categories_perfeum_link}  //div[@id='menu']//a[@href='https://iprice.hk/perfume/']//span[text()='Perfume']
${HK_header_categories_racquet_sports_link}  //div[@id='menu']//a[@href='https://iprice.hk/racquet-sports/']//span[text()='Racquet Sports']
${HK_header_categories_shaving_supplies_link}  //div[@id='menu']//a[@href='https://iprice.hk/shaving-supplies/']//span[text()='Shaving Supplies']
${HK_header_categories_skin_care_link}  //div[@id='menu']//a[@href='https://iprice.hk/skin-care/']//span[text()='Skin Care']
${HK_header_categories_supplements_link}  //div[@id='menu']//a[@href='https://iprice.hk/supplements/']//span[text()='Supplements']
${HK_header_categories_team_sports_link}  //div[@id='menu']//a[@href='https://iprice.hk/team-sports/']//span[text()='Team Sports']
${HK_header_categories_toys_link}  //div[@id='menu']//a[@href='https://iprice.hk/toys/']//span[text()='Toys']
${HK_header_categories_water_sports_link}  //div[@id='menu']//a[@href='https://iprice.hk/water-sports/']//span[text()='Water Sports']
${HK_header_categories_groceries_link}  //div[@id='menu']//a[@href='https://iprice.hk/groceries/']//span[text()='Groceries']
${HK_header_categories_ear_care_link}  //div[@id='menu']//a[@href='https://iprice.hk/ear-care/']//span[text()='Ear Care']
${HK_header_categories_bathroom_link}  //div[@id='menu']//a[@href='https://iprice.hk/bathroom/']//span[text()='Bathroom']
${HK_header_categories_bedroom_link}  //div[@id='menu']//a[@href='https://iprice.hk/bedroom/']//span[text()='Bedroom']
${HK_header_categories_hallway_entry_link}  //div[@id='menu']//a[@href='https://iprice.hk/hallway-entry/']//span[text()='Hallway & Entry']
${HK_header_categories_home_decor_link}  //div[@id='menu']//a[@href='https://iprice.hk/home-decor/']//span[text()='Home Decor']
${HK_header_categories_home_improvement_link}  //div[@id='menu']//a[@href='https://iprice.hk/home-improvement/']//span[text()='Home Improvement']
${HK_header_categories_home_office_link}  //div[@id='menu']//a[@href='https://iprice.hk/home-office/']//span[text()='Home Office']
${HK_header_categories_housekeepng_link}  //div[@id='menu']//a[@href='https://iprice.hk/housekeeping/']//span[text()='Housekeeping']
${HK_header_categories_kitchen_dining_link}  //div[@id='menu']//a[@href='https://iprice.hk/kitchen-dining/']//span[text()='Kitchen & Dining']
${HK_header_categories_lighting_link}  //div[@id='menu']//a[@href='https://iprice.hk/lighting/']//span[text()='Lighting']
${HK_header_categories_living_room_link}  //div[@id='menu']//a[@href='https://iprice.hk/living-room/']//span[text()='Living Room']
${HK_header_categories_outdoor_garden_link}  //div[@id='menu']//a[@href='https://iprice.hk/outdoor-garden/']//span[text()='Outdoor & Garden']
${HK_header_categories_pets_suplies_link}  //div[@id='menu']//a[@href='https://iprice.hk/pets-supplies/']//span[text()='Pets Supplies']
${HK_header_categories_security_link}  //div[@id='menu']//a[@href='https://iprice.hk/security/']//span[text()='Security']
${HK_header_categories_stationery_link}  //div[@id='menu']//a[@href='https://iprice.hk/stationery/']//span[text()='Stationery']
${HK_header_categories_gadgets_link}  //div[@id='menu']//a[@href='https://iprice.hk/gadgets/']//span[text()='Gadgets']
${HK_header_categories_other_sports_link}  //div[@id='menu']//a[@href='https://iprice.hk/other-sports/']//span[text()='Other Sports']
${HK_header_categories_upcoming_products_link}  //div[@id='menu']//a[@href='https://iprice.hk/upcoming-products/']//span[text()='Upcoming Products']

${HK_product_images}  //img[contains(@class,'lazy product-img')]

${HK_coupon_page_title}  Get Exclusive Sales, Coupons & Promotions in 2017 | iPrice Hong Kong

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
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link2_count}
    \  Create Session  iprice  https://iprice.hk/  disable_warnings=0
    \  Sleep  1
    \  ${link}  Get From List  ${filter_link2}  ${INDEX}
    \  ${link2}  Replace String  ${link}  https://iprice.hk/  ${empty}
    \  ${link3}  Replace String  ${link2}  ${space}  ${empty}
    \  ${link4}  Replace String  ${link3}  %3Fnocache%3D1  ${empty}
    \  ${link5}  Replace String  ${link4}  ${space}  ${empty}
    \  ${resp}  RequestsLibrary.Get Request  iprice  ${link5}
    \  ${status}  Run Keyword And Return Status  Should Be Equal As Strings  ${resp.status_code}  200
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.my/${link5} failed and not return 200.
    \  Delete All Sessions

SEO Check Internal Link In HK
    ${internal_links}  Create List
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link1_count}
    \  ${link}  Get From List  ${filter_link1}  ${INDEX}
    \  ${match}  Get Regexp Matches  ${link}  iprice.hk
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
    Go To  ${HK_homeURL}
    Sleep  1
    iPrice HK Homepage Landing

iPrice HK Homepage Landing
    Title Should Be  ${HK_homeTitle}
    Wait Until Element Is Visible  ${HK_header_logo_link}
    Wait Until Element Is Visible  ${HK_header_search_input}
    Wait Until Element Is Visible  ${HK_header_popular_searches_text}
    Wait Until Element Is Visible  ${HK_header_coupon_logo_link}
    Wait Until Element Is Visible  ${HK_header_coupon_text}

iPrice HK Homepage Categories Landing
    ${match}  Get Matching Xpath Count  //div[@id='menu']//li[@class='cursor-pointer list-item']//span
    Run Keyword If  ${match}!=60  Run Keyword And Continue On Failure  Fail  Main categories count incorrect.
    Wait Until Element Is Visible  ${HK_header_categories_clothing_link}
    Wait Until Element Is Visible  ${HK_header_categories_shoes_link}
    Wait Until Element Is Visible  ${HK_header_categories_bags_link}
    Wait Until Element Is Visible  ${HK_header_categories_watches_link}
    Wait Until Element Is Visible  ${HK_header_categories_jewellery_link}
    Wait Until Element Is Visible  ${HK_header_categories_computing_link}
    Wait Until Element Is Visible  ${HK_header_categories_phones_tablets_link}
    Wait Until Element Is Visible  ${HK_header_categories_gaming_link}
    Wait Until Element Is Visible  ${HK_header_categories_camera_photo_link}
    Wait Until Element Is Visible  ${HK_header_categories_tv_video_dvd_link}
    Wait Until Page Contains Element  ${HK_header_categories_appliances_link}
    Element Should Not Be Visible  ${HK_header_categories_appliances_link}
    Wait Until Page Contains Element  ${HK_header_categories_automotive_link}
    Element Should Not Be Visible  ${HK_header_categories_automotive_link}
    Wait Until Page Contains Element  ${HK_header_categories_hobbies_link}
    Element Should Not Be Visible  ${HK_header_categories_hobbies_link}
    Wait Until Page Contains Element  ${HK_header_categories_audio_hifi_link}
    Element Should Not Be Visible  ${HK_header_categories_audio_hifi_link}
    Wait Until Page Contains Element  ${HK_header_categories_action_sport_link}
    Element Should Not Be Visible  ${HK_header_categories_action_sport_link}
    Wait Until Page Contains Element  ${HK_header_categories_adventure_link}
    Element Should Not Be Visible  ${HK_header_categories_adventure_link}
    Wait Until Page Contains Element  ${HK_header_categories_baby_clothing_link}
    Element Should Not Be Visible  ${HK_header_categories_baby_clothing_link}
    Wait Until Page Contains Element  ${HK_header_categories_baby_gear_link}
    Element Should Not Be Visible  ${HK_header_categories_baby_gear_link}
    Wait Until Page Contains Element  ${HK_header_categories_bath_body_link}
    Element Should Not Be Visible  ${HK_header_categories_bath_body_link}
    Wait Until Page Contains Element  ${HK_header_categories_dental_care_link}
    Element Should Not Be Visible  ${HK_header_categories_dental_care_link}
    Wait Until Page Contains Element  ${HK_header_categories_diapering_link}
    Element Should Not Be Visible  ${HK_header_categories_diapering_link}
    Wait Until Page Contains Element  ${HK_header_categories_eyecare_link}
    Element Should Not Be Visible  ${HK_header_categories_eyecare_link}
    Wait Until Page Contains Element  ${HK_header_categories_feeding_link}
    Element Should Not Be Visible  ${HK_header_categories_feeding_link}
    Wait Until Page Contains Element  ${HK_header_categories_food_supplements_link}
    Element Should Not Be Visible  ${HK_header_categories_food_supplements_link}
    Wait Until Page Contains Element  ${HK_header_categories_gifts_link}
    Element Should Not Be Visible  ${HK_header_categories_gifts_link}
    Wait Until Page Contains Element  ${HK_header_categories_gym_link}
    Element Should Not Be Visible  ${HK_header_categories_gym_link}
    Wait Until Page Contains Element  ${HK_header_categories_hair_care_link}
    Element Should Not Be Visible  ${HK_header_categories_hair_care_link}
    Wait Until Page Contains Element  ${HK_header_categories_health_link}
    Element Should Not Be Visible  ${HK_header_categories_health_link}
    Wait Until Page Contains Element  ${HK_header_categories_kids_clothing_link}
    Element Should Not Be Visible  ${HK_header_categories_kids_clothing_link}
    Wait Until Page Contains Element  ${HK_header_categories_makeup_link}
    Element Should Not Be Visible  ${HK_header_categories_makeup_link}
    Wait Until Page Contains Element  ${HK_header_categories_maternity_care_link}
    Element Should Not Be Visible  ${HK_header_categories_maternity_care_link}
    Wait Until Page Contains Element  ${HK_header_categories_medical_supplies_link}
    Element Should Not Be Visible  ${HK_header_categories_medical_supplies_link}
    Wait Until Page Contains Element  ${HK_header_categories_nursery_link}
    Element Should Not Be Visible  ${HK_header_categories_nursery_link}
    Wait Until Page Contains Element  ${HK_header_categories_perfeum_link}
    Element Should Not Be Visible  ${HK_header_categories_perfeum_link}
    Wait Until Page Contains Element  ${HK_header_categories_racquet_sports_link}
    Element Should Not Be Visible  ${HK_header_categories_racquet_sports_link}
    Wait Until Page Contains Element  ${HK_header_categories_shaving_supplies_link}
    Element Should Not Be Visible  ${HK_header_categories_shaving_supplies_link}
    Wait Until Page Contains Element  ${HK_header_categories_skin_care_link}
    Element Should Not Be Visible  ${HK_header_categories_skin_care_link}
    Wait Until Page Contains Element  ${HK_header_categories_supplements_link}
    Element Should Not Be Visible  ${HK_header_categories_supplements_link}
    Wait Until Page Contains Element  ${HK_header_categories_team_sports_link}
    Element Should Not Be Visible  ${HK_header_categories_team_sports_link}
    Wait Until Page Contains Element  ${HK_header_categories_toys_link}
    Element Should Not Be Visible  ${HK_header_categories_toys_link}
    Wait Until Page Contains Element  ${HK_header_categories_water_sports_link}
    Element Should Not Be Visible  ${HK_header_categories_water_sports_link}
    Wait Until Page Contains Element  ${HK_header_categories_groceries_link}
    Element Should Not Be Visible  ${HK_header_categories_groceries_link}
    Wait Until Page Contains Element  ${HK_header_categories_ear_care_link}
    Element Should Not Be Visible  ${HK_header_categories_ear_care_link}
    Wait Until Page Contains Element  ${HK_header_categories_bathroom_link}
    Element Should Not Be Visible  ${HK_header_categories_bathroom_link}
    Wait Until Page Contains Element  ${HK_header_categories_bedroom_link}
    Element Should Not Be Visible  ${HK_header_categories_bedroom_link}
    Wait Until Page Contains Element  ${HK_header_categories_hallway_entry_link}
    Element Should Not Be Visible  ${HK_header_categories_hallway_entry_link}
    Wait Until Page Contains Element  ${HK_header_categories_home_decor_link}
    Element Should Not Be Visible  ${HK_header_categories_home_decor_link}
    Wait Until Page Contains Element  ${HK_header_categories_home_improvement_link}
    Element Should Not Be Visible  ${HK_header_categories_home_improvement_link}
    Wait Until Page Contains Element  ${HK_header_categories_home_office_link}
    Element Should Not Be Visible  ${HK_header_categories_home_office_link}
    Wait Until Page Contains Element  ${HK_header_categories_housekeepng_link}
    Element Should Not Be Visible  ${HK_header_categories_housekeepng_link}
    Wait Until Page Contains Element  ${HK_header_categories_kitchen_dining_link}
    Element Should Not Be Visible  ${HK_header_categories_kitchen_dining_link}
    Wait Until Page Contains Element  ${HK_header_categories_lighting_link}
    Element Should Not Be Visible  ${HK_header_categories_lighting_link}
    Wait Until Page Contains Element  ${HK_header_categories_living_room_link}
    Element Should Not Be Visible  ${HK_header_categories_living_room_link}
    Wait Until Page Contains Element  ${HK_header_categories_outdoor_garden_link}
    Element Should Not Be Visible  ${HK_header_categories_outdoor_garden_link}
    Wait Until Page Contains Element  ${HK_header_categories_pets_suplies_link}
    Element Should Not Be Visible  ${HK_header_categories_pets_suplies_link}
    Wait Until Page Contains Element  ${HK_header_categories_security_link}
    Element Should Not Be Visible  ${HK_header_categories_security_link}
    Wait Until Page Contains Element  ${HK_header_categories_stationery_link}
    Element Should Not Be Visible  ${HK_header_categories_stationery_link}
    Wait Until Page Contains Element  ${HK_header_categories_gadgets_link}
    Element Should Not Be Visible  ${HK_header_categories_gadgets_link}
    Wait Until Page Contains Element  ${HK_header_categories_other_sports_link}
    Element Should Not Be Visible  ${HK_header_categories_other_sports_link}
    Wait Until Page Contains Element  ${HK_header_categories_upcoming_products_link}
    Element Should Not Be Visible  ${HK_header_categories_upcoming_products_link}
    Mouse Over  ${HK_header_categories_clothing_link}
    Wait Until Element Is Visible  ${HK_header_categories_clothing_men}
    Wait Until Element Is Visible  ${HK_header_categories_clothing_women}
    Mouse Over  ${HK_header_categories_shoes_link}
    Wait Until Element Is Visible  ${HK_header_categories_shoes_men}
    Wait Until Element Is Visible  ${HK_header_categories_shoes_women}

iPrice HK Access Header Link
    Click Element  ${HK_header_logo_link}
    Sleep  1
    iPrice HK Homepage Landing

iPrice HK Search In Header  [Arguments]  ${itemNames}
    Input Text  ${HK_header_search_input}  ${itemNames}
    Click Element  ${HK_header_search_icon}
    Sleep  1

iPrice HK Search Page Landing  [Arguments]  ${itemNames}
    Title Should Be  Search | iprice Hong Kong
    Wait Until Element Is Visible  //div[@id='products-header']//h1[text()='${itemNames}']

iPrice HK Access Coupons Link
    Click Element  ${HK_header_coupon_logo_link}
    Sleep  1
    iPrice HK Coupons Page Landing

iPrice HK Coupons Page Landing
    Title Should Be  ${HK_coupon_page_title}