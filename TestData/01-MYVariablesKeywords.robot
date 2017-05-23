*** Settings ***
Documentation  This file will only store variables and keywords for MY.

*** Variables ***

${MY_homeURL}  https://iprice.my/?nocache=1
${MY_homeTitle}  Online Shopping, Coupons & Discount Codes at iprice Malaysia
# ${MY_header_meta_decription}  //meta[@name='description']
# ${MY_header_meta_validate}  //meta[@name='description']
# ${MY_header_meta_validate}  //meta[@name='msvalidate.01']
# ${MY_header_meta_decription}
# ${MY_header_meta_decription}
${MY_header_H1_text}  //h1[text()='Search, Compare & Save']
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
${MY_header_categories_bath_body_link}  //div[@id='menu']//a[@href='https://iprice.my/bath-body/']//span[text()='Bath & Body']
${MY_header_categories_dental_care_link}  //div[@id='menu']//a[@href='https://iprice.my/dental-care/']//span[text()='Dental Care']
${MY_header_categories_diapering_link}  //div[@id='menu']//a[@href='https://iprice.my/diapering/']//span[text()='Diapering']
${MY_header_categories_eyecare_link}  //div[@id='menu']//a[@href='https://iprice.my/eyecare/']//span[text()='Eyecare']
${MY_header_categories_feeding_link}  //div[@id='menu']//a[@href='https://iprice.my/feeding/']//span[text()='Feeding']
${MY_header_categories_food_supplements_link}  //div[@id='menu']//a[@href='https://iprice.my/food-supplements/']//span[text()='Food Supplements']
${MY_header_categories_gifts_link}  //div[@id='menu']//a[@href='https://iprice.my/gifts/']//span[text()='Gifts']
${MY_header_categories_gym_link}  //div[@id='menu']//a[@href='https://iprice.my/gym/']//span[text()='Gym']
${MY_header_categories_hair_care_link}  //div[@id='menu']//a[@href='https://iprice.my/hair-care/']//span[text()='Hair Care']
${MY_header_categories_health_link}  //div[@id='menu']//a[@href='https://iprice.my/health/']//span[text()='Health']
${MY_header_categories_kids_clothing_link}  //div[@id='menu']//a[@href='https://iprice.my/kids-clothing/']//span[text()='Kids Clothing']
${MY_header_categories_makeup_link}  //div[@id='menu']//a[@href='https://iprice.my/makeup/']//span[text()='Makeup']
${MY_header_categories_maternity_care_link}  //div[@id='menu']//a[@href='https://iprice.my/maternity-care/']//span[text()='Maternity Care']
${MY_header_categories_medical_supplies_link}  //div[@id='menu']//a[@href='https://iprice.my/medical-supplies/']//span[text()='Medical Supplies']
${MY_header_categories_nursery_link}  //div[@id='menu']//a[@href='https://iprice.my/nursery/']//span[text()='Nursery']
${MY_header_categories_perfeum_link}  //div[@id='menu']//a[@href='https://iprice.my/perfume/']//span[text()='Perfume']
${MY_header_categories_racquet_sports_link}  //div[@id='menu']//a[@href='https://iprice.my/racquet-sports/']//span[text()='Racquet Sports']
${MY_header_categories_shaving_supplies_link}  //div[@id='menu']//a[@href='https://iprice.my/shaving-supplies/']//span[text()='Shaving Supplies']
${MY_header_categories_skin_care_link}  //div[@id='menu']//a[@href='https://iprice.my/skin-care/']//span[text()='Skin Care']
${MY_header_categories_supplements_link}  //div[@id='menu']//a[@href='https://iprice.my/supplements/']//span[text()='Supplements']
${MY_header_categories_team_sports_link}  //div[@id='menu']//a[@href='https://iprice.my/team-sports/']//span[text()='Team Sports']
${MY_header_categories_toys_link}  //div[@id='menu']//a[@href='https://iprice.my/toys/']//span[text()='Toys']
${MY_header_categories_water_sports_link}  //div[@id='menu']//a[@href='https://iprice.my/water-sports/']//span[text()='Water Sports']
${MY_header_categories_groceries_link}  //div[@id='menu']//a[@href='https://iprice.my/groceries/']//span[text()='Groceries']
${MY_header_categories_ear_care_link}  //div[@id='menu']//a[@href='https://iprice.my/ear-care/']//span[text()='Ear Care']
${MY_header_categories_bathroom_link}  //div[@id='menu']//a[@href='https://iprice.my/bathroom/']//span[text()='Bathroom']
${MY_header_categories_bedroom_link}  //div[@id='menu']//a[@href='https://iprice.my/bedroom/']//span[text()='Bedroom']
${MY_header_categories_hallway_entry_link}  //div[@id='menu']//a[@href='https://iprice.my/hallway-entry/']//span[text()='Hallway & Entry']
${MY_header_categories_home_decor_link}  //div[@id='menu']//a[@href='https://iprice.my/home-decor/']//span[text()='Home Decor']
${MY_header_categories_home_improvement_link}  //div[@id='menu']//a[@href='https://iprice.my/home-improvement/']//span[text()='Home Improvement']
${MY_header_categories_home_office_link}  //div[@id='menu']//a[@href='https://iprice.my/home-office/']//span[text()='Home Office']
${MY_header_categories_housekeepng_link}  //div[@id='menu']//a[@href='https://iprice.my/housekeeping/']//span[text()='Housekeeping']
${MY_header_categories_kitchen_dining_link}  //div[@id='menu']//a[@href='https://iprice.my/kitchen-dining/']//span[text()='Kitchen & Dining']
${MY_header_categories_lighting_link}  //div[@id='menu']//a[@href='https://iprice.my/lighting/']//span[text()='Lighting']
${MY_header_categories_living_room_link}  //div[@id='menu']//a[@href='https://iprice.my/living-room/']//span[text()='Living Room']
${MY_header_categories_outdoor_garden_link}  //div[@id='menu']//a[@href='https://iprice.my/outdoor-garden/']//span[text()='Outdoor & Garden']
${MY_header_categories_pets_suplies_link}  //div[@id='menu']//a[@href='https://iprice.my/pets-supplies/']//span[text()='Pets Supplies']
${MY_header_categories_security_link}  //div[@id='menu']//a[@href='https://iprice.my/security/']//span[text()='Security']
${MY_header_categories_stationery_link}  //div[@id='menu']//a[@href='https://iprice.my/stationery/']//span[text()='Stationery']
${MY_header_categories_gadgets_link}  //div[@id='menu']//a[@href='https://iprice.my/gadgets/']//span[text()='Gadgets']
${MY_header_categories_other_sports_link}  //div[@id='menu']//a[@href='https://iprice.my/other-sports/']//span[text()='Other Sports']
${MY_header_categories_upcoming_products_link}  //div[@id='menu']//a[@href='https://iprice.my/upcoming-products/']//span[text()='Upcoming Products']

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
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link2_count}
    \  Create Session  iprice  https://iprice.my/  disable_warnings=0
    \  Sleep  1
    \  ${link}  Get From List  ${filter_link2}  ${INDEX}
    \  ${link2}  Replace String  ${link}  https://iprice.my/  ${empty}
    \  ${link3}  Replace String  ${link2}  ${space}  ${empty}
    \  ${link4}  Replace String  ${link3}  %3Fnocache%3D1  ${empty}
    \  ${resp}  RequestsLibrary.Get Request  iprice  ${link4}
    \  ${status}  Run Keyword And Return Status  Should Be Equal As Strings  ${resp.status_code}  200
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to ${link} failed and not return 200.
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
    \  ${status}  Run Keyword And Return Status  Should Start With  ${link}  https
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  ${link} does not start with https.
    \  ${status2}  Run Keyword And Return Status  Should End With  ${link}  /
    \  Run Keyword If  "${status2}"=="False"  Run Keyword And Continue On Failure  Fail  ${link} does not end with trailing "/".

SEO Check Images ALT In MY  [Arguments]  ${imageCount}
    ${match}  Get Matching Xpath Count  ${MY_product_images}
    Run Keyword If  "${match}"!="${imageCount}"  Run Keyword And Continue On Failure  Fail  Images count wrong.
    :FOR  ${INDEX}  IN RANGE  1  ${imageCount}
    \  ${altImages}  Get Element Attribute  xpath=(${MY_product_images})[${INDEX}]@alt
    \  Run Keyword If  "${altImages}"=="None"  Run Keyword And Continue On Failure  Fail  Image does not contains alt.

# SEO Check Title, H1, Meta Desc, OG
#     Title Should Be    ${MY_homeTitle}
#     Wait Until Element Is Visible  ${MY_H1_text}
#     Page Should Contains Element

Access iPrice MY Homepage
    Go To  ${MY_homeURL}
    Sleep  1

iPrice MY Homepage Landing
    Title Should Be  ${MY_homeTitle}
    Wait Until Element Is Visible  ${MY_header_logo_link}
    Wait Until Element Is Visible  ${MY_header_search_input}
    Wait Until Element Is Visible  ${MY_header_popular_searches_text}
    Wait Until Element Is Visible  ${MY_header_coupon_logo_link}
    Wait Until Element Is Visible  ${MY_header_coupon_text}

iPrice MY Homepage Categories Landing
    ${match}  Get Matching Xpath Count  //div[@id='menu']//li[@class='cursor-pointer list-item']//span
    Run Keyword If  ${match}!=60  Run Keyword And Continue On Failure  Fail  Main categories count incorrect.
    Wait Until Element Is Visible  ${MY_header_categories_clothing_link}
    Wait Until Element Is Visible  ${MY_header_categories_shoes_link}
    Wait Until Element Is Visible  ${MY_header_categories_bags_link}
    Wait Until Element Is Visible  ${MY_header_categories_watches_link}
    Wait Until Element Is Visible  ${MY_header_categories_jewellery_link}
    Wait Until Element Is Visible  ${MY_header_categories_computing_link}
    Wait Until Element Is Visible  ${MY_header_categories_phones_tablets_link}
    Wait Until Element Is Visible  ${MY_header_categories_gaming_link}
    Wait Until Element Is Visible  ${MY_header_categories_camera_photo_link}
    Wait Until Element Is Visible  ${MY_header_categories_tv_video_dvd_link}
    Wait Until Page Contains Element  ${MY_header_categories_appliances_link}
    Element Should Not Be Visible  ${MY_header_categories_appliances_link}
    Wait Until Page Contains Element  ${MY_header_categories_automotive_link}
    Element Should Not Be Visible  ${MY_header_categories_automotive_link}
    Wait Until Page Contains Element  ${MY_header_categories_hobbies_link}
    Element Should Not Be Visible  ${MY_header_categories_hobbies_link}
    Wait Until Page Contains Element  ${MY_header_categories_audio_hifi_link}
    Element Should Not Be Visible  ${MY_header_categories_audio_hifi_link}
    Wait Until Page Contains Element  ${MY_header_categories_action_sport_link}
    Element Should Not Be Visible  ${MY_header_categories_action_sport_link}
    Wait Until Page Contains Element  ${MY_header_categories_adventure_link}
    Element Should Not Be Visible  ${MY_header_categories_adventure_link}
    Wait Until Page Contains Element  ${MY_header_categories_baby_clothing_link}
    Element Should Not Be Visible  ${MY_header_categories_baby_clothing_link}
    Wait Until Page Contains Element  ${MY_header_categories_baby_gear_link}
    Element Should Not Be Visible  ${MY_header_categories_baby_gear_link}
    Wait Until Page Contains Element  ${MY_header_categories_bath_body_link}
    Element Should Not Be Visible  ${MY_header_categories_bath_body_link}
    Wait Until Page Contains Element  ${MY_header_categories_dental_care_link}
    Element Should Not Be Visible  ${MY_header_categories_dental_care_link}
    Wait Until Page Contains Element  ${MY_header_categories_diapering_link}
    Element Should Not Be Visible  ${MY_header_categories_diapering_link}
    Wait Until Page Contains Element  ${MY_header_categories_eyecare_link}
    Element Should Not Be Visible  ${MY_header_categories_eyecare_link}
    Wait Until Page Contains Element  ${MY_header_categories_feeding_link}
    Element Should Not Be Visible  ${MY_header_categories_feeding_link}
    Wait Until Page Contains Element  ${MY_header_categories_food_supplements_link}
    Element Should Not Be Visible  ${MY_header_categories_food_supplements_link}
    Wait Until Page Contains Element  ${MY_header_categories_gifts_link}
    Element Should Not Be Visible  ${MY_header_categories_gifts_link}
    Wait Until Page Contains Element  ${MY_header_categories_gym_link}
    Element Should Not Be Visible  ${MY_header_categories_gym_link}
    Wait Until Page Contains Element  ${MY_header_categories_hair_care_link}
    Element Should Not Be Visible  ${MY_header_categories_hair_care_link}
    Wait Until Page Contains Element  ${MY_header_categories_health_link}
    Element Should Not Be Visible  ${MY_header_categories_health_link}
    Wait Until Page Contains Element  ${MY_header_categories_kids_clothing_link}
    Element Should Not Be Visible  ${MY_header_categories_kids_clothing_link}
    Wait Until Page Contains Element  ${MY_header_categories_makeup_link}
    Element Should Not Be Visible  ${MY_header_categories_makeup_link}
    Wait Until Page Contains Element  ${MY_header_categories_maternity_care_link}
    Element Should Not Be Visible  ${MY_header_categories_maternity_care_link}
    Wait Until Page Contains Element  ${MY_header_categories_medical_supplies_link}
    Element Should Not Be Visible  ${MY_header_categories_medical_supplies_link}
    Wait Until Page Contains Element  ${MY_header_categories_nursery_link}
    Element Should Not Be Visible  ${MY_header_categories_nursery_link}
    Wait Until Page Contains Element  ${MY_header_categories_perfeum_link}
    Element Should Not Be Visible  ${MY_header_categories_perfeum_link}
    Wait Until Page Contains Element  ${MY_header_categories_racquet_sports_link}
    Element Should Not Be Visible  ${MY_header_categories_racquet_sports_link}
    Wait Until Page Contains Element  ${MY_header_categories_shaving_supplies_link}
    Element Should Not Be Visible  ${MY_header_categories_shaving_supplies_link}
    Wait Until Page Contains Element  ${MY_header_categories_skin_care_link}
    Element Should Not Be Visible  ${MY_header_categories_skin_care_link}
    Wait Until Page Contains Element  ${MY_header_categories_supplements_link}
    Element Should Not Be Visible  ${MY_header_categories_supplements_link}
    Wait Until Page Contains Element  ${MY_header_categories_team_sports_link}
    Element Should Not Be Visible  ${MY_header_categories_team_sports_link}
    Wait Until Page Contains Element  ${MY_header_categories_toys_link}
    Element Should Not Be Visible  ${MY_header_categories_toys_link}
    Wait Until Page Contains Element  ${MY_header_categories_water_sports_link}
    Element Should Not Be Visible  ${MY_header_categories_water_sports_link}
    Wait Until Page Contains Element  ${MY_header_categories_groceries_link}
    Element Should Not Be Visible  ${MY_header_categories_groceries_link}
    Wait Until Page Contains Element  ${MY_header_categories_ear_care_link}
    Element Should Not Be Visible  ${MY_header_categories_ear_care_link}
    Wait Until Page Contains Element  ${MY_header_categories_bathroom_link}
    Element Should Not Be Visible  ${MY_header_categories_bathroom_link}
    Wait Until Page Contains Element  ${MY_header_categories_bedroom_link}
    Element Should Not Be Visible  ${MY_header_categories_bedroom_link}
    Wait Until Page Contains Element  ${MY_header_categories_hallway_entry_link}
    Element Should Not Be Visible  ${MY_header_categories_hallway_entry_link}
    Wait Until Page Contains Element  ${MY_header_categories_home_decor_link}
    Element Should Not Be Visible  ${MY_header_categories_home_decor_link}
    Wait Until Page Contains Element  ${MY_header_categories_home_improvement_link}
    Element Should Not Be Visible  ${MY_header_categories_home_improvement_link}
    Wait Until Page Contains Element  ${MY_header_categories_home_office_link}
    Element Should Not Be Visible  ${MY_header_categories_home_office_link}
    Wait Until Page Contains Element  ${MY_header_categories_housekeepng_link}
    Element Should Not Be Visible  ${MY_header_categories_housekeepng_link}
    Wait Until Page Contains Element  ${MY_header_categories_kitchen_dining_link}
    Element Should Not Be Visible  ${MY_header_categories_kitchen_dining_link}
    Wait Until Page Contains Element  ${MY_header_categories_lighting_link}
    Element Should Not Be Visible  ${MY_header_categories_lighting_link}
    Wait Until Page Contains Element  ${MY_header_categories_living_room_link}
    Element Should Not Be Visible  ${MY_header_categories_living_room_link}
    Wait Until Page Contains Element  ${MY_header_categories_outdoor_garden_link}
    Element Should Not Be Visible  ${MY_header_categories_outdoor_garden_link}
    Wait Until Page Contains Element  ${MY_header_categories_pets_suplies_link}
    Element Should Not Be Visible  ${MY_header_categories_pets_suplies_link}
    Wait Until Page Contains Element  ${MY_header_categories_security_link}
    Element Should Not Be Visible  ${MY_header_categories_security_link}
    Wait Until Page Contains Element  ${MY_header_categories_stationery_link}
    Element Should Not Be Visible  ${MY_header_categories_stationery_link}
    Wait Until Page Contains Element  ${MY_header_categories_gadgets_link}
    Element Should Not Be Visible  ${MY_header_categories_gadgets_link}
    Wait Until Page Contains Element  ${MY_header_categories_other_sports_link}
    Element Should Not Be Visible  ${MY_header_categories_other_sports_link}
    Wait Until Page Contains Element  ${MY_header_categories_upcoming_products_link}
    Element Should Not Be Visible  ${MY_header_categories_upcoming_products_link}
    Mouse Over    ${MY_header_categories_clothing_link}
    Wait Until Element Is Visible    ${MY_header_categories_clothing_men}
    Wait Until Element Is Visible    ${MY_header_categories_clothing_women}
    Mouse Over    ${MY_header_categories_shoes_link}
    Wait Until Element Is Visible    ${MY_header_categories_shoes_men}
    Wait Until Element Is Visible    ${MY_header_categories_shoes_women}

iPrice MY Access Header Link
    Click Element  ${MY_header_logo_link}
    Sleep  1
    iPrice MY Homepage Landing

iPrice MY Search In Header  [Arguments]  ${itemNames}
    Input Text  ${MY_header_search_input}  ${itemNames}
    Click Element  ${MY_header_search_icon}
    Sleep  1

iPrice MY Search Page Landing  [Arguments]  ${itemNames}
    Title Should Be  ${itemNames} - Buy ${itemNames} online in Malaysia | iPrice
    Wait Until Element Is Visible  //div[@id='products-header']//h1[text()='${itemNames}']

iPrice MY Access Coupons Link
    Click Element  ${MY_header_coupon_logo_link}
    Sleep  1
    iPrice MY Coupons Page Landing

iPrice MY Coupons Page Landing
    Title Should Be  ${MY_coupon_page_title}