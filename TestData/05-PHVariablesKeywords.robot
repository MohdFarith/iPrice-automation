*** Settings ***
Documentation    This file will only store variables and keywords for PH.

*** Variables ***

${PH_homeURL}    https://iprice.ph/
${PH_homeTitle}    Online Shopping, Coupons & Discount Codes at iprice Philippines
${PH_header_logo_link}    //div[@id='logo']//a[@href='https://iprice.ph/']
${PH_header_search_input}    //div[@id='search']//input[@placeholder='Search for products, coupons or brands...']
${PH_header_search_icon}    //div[@id='search']//i[@class='icon icon-search-blue']
${PH_header_popular_searches_text}    //div[@id='popular-searches']//li[normalize-space(text())='Popular Searches:']
${PH_header_coupon_logo_link}    //div[@id='news-button']//a[@href='https://iprice.ph/coupons/']
${PH_header_coupon_text}    //div[@id='news-button']//button[normalize-space(text())='Coupons & Offers']
${PH_header_categories_clothing_link}    //div[@id='menu']//a[@href='https://iprice.ph/clothing/']//span[text()='Clothing']
${PH_header_categories_clothing_men}    //div[@id='menu']//a[contains(@href,'https://iprice.ph/clothing/men/') and text()='Men']
${PH_header_categories_clothing_women}    //div[@id='menu']//a[contains(@href,'https://iprice.ph/clothing/women/') and text()='Women']
${PH_header_categories_shoes_link}    //div[@id='menu']//a[@href='https://iprice.ph/shoes/']//span[text()='Shoes']
${PH_header_categories_shoes_men}    //div[@id='menu']//a[contains(@href,'https://iprice.ph/shoes/men/') and text()='Men']
${PH_header_categories_shoes_women}    //div[@id='menu']//a[contains(@href,'https://iprice.ph/shoes/women/') and text()='Women']
${PH_header_categories_bags_link}  //div[@id='menu']//a[@href='https://iprice.ph/bags/']//span[text()='Bags']
${PH_header_categories_watches_link}  //div[@id='menu']//a[@href='https://iprice.ph/watches/']//span[text()='Watches']
${PH_header_categories_jewellery_link}  //div[@id='menu']//a[@href='https://iprice.ph/jewellery/']//span[text()='Jewellery']
${PH_header_categories_computing_link}  //div[@id='menu']//a[@href='https://iprice.ph/computing/']//span[text()='Computing']
${PH_header_categories_phones_tablets_link}  //div[@id='menu']//a[@href='https://iprice.ph/phones-tablets/']//span[text()='Phones & Tablets']
${PH_header_categories_gaming_link}  //div[@id='menu']//a[@href='https://iprice.ph/gaming/']//span[text()='Gaming']
${PH_header_categories_camera_photo_link}  //div[@id='menu']//a[@href='https://iprice.ph/camera-photo/']//span[text()='Camera & Photo']
${PH_header_categories_tv_video_dvd_link}  //div[@id='menu']//a[@href='https://iprice.ph/tv-video-dvd/']//span[text()='TV, Video & DVD']
${PH_header_categories_appliances_link}  //div[@id='menu']//a[@href='https://iprice.ph/appliances/']//span[text()='Appliances']
${PH_header_categories_automotive_link}  //div[@id='menu']//a[@href='https://iprice.ph/automotive/']//span[text()='Automotive']
${PH_header_categories_hobbies_link}  //div[@id='menu']//a[@href='https://iprice.ph/hobbies/']//span[text()='Hobbies']
${PH_header_categories_audio_hifi_link}  //div[@id='menu']//a[@href='https://iprice.ph/audio-hi-fi/']//span[text()='Audio & Hi Fi']
${PH_header_categories_action_sport_link}  //div[@id='menu']//a[@href='https://iprice.ph/action-sports/']//span[text()='Action Sports']
${PH_header_categories_adventure_link}  //div[@id='menu']//a[@href='https://iprice.ph/adventure/']//span[text()='Adventure']
${PH_header_categories_baby_clothing_link}  //div[@id='menu']//a[@href='https://iprice.ph/baby-clothing/']//span[text()='Baby Clothing']
${PH_header_categories_baby_gear_link}  //div[@id='menu']//a[@href='https://iprice.ph/baby-gear/']//span[text()='Baby Gear']
${PH_header_categories_bath_body_link}  //div[@id='menu']//a[@href='https://iprice.ph/bath-body/']//span[text()='Bath & Body']
${PH_header_categories_dental_care_link}  //div[@id='menu']//a[@href='https://iprice.ph/dental-care/']//span[text()='Dental Care']
${PH_header_categories_diapering_link}  //div[@id='menu']//a[@href='https://iprice.ph/diapering/']//span[text()='Diapering']
${PH_header_categories_eyecare_link}  //div[@id='menu']//a[@href='https://iprice.ph/eyecare/']//span[text()='Eyecare']
${PH_header_categories_feeding_link}  //div[@id='menu']//a[@href='https://iprice.ph/feeding/']//span[text()='Feeding']
${PH_header_categories_food_supplements_link}  //div[@id='menu']//a[@href='https://iprice.ph/food-supplements/']//span[text()='Food Supplements']
${PH_header_categories_gifts_link}  //div[@id='menu']//a[@href='https://iprice.ph/gifts/']//span[text()='Gifts']
${PH_header_categories_gym_link}  //div[@id='menu']//a[@href='https://iprice.ph/gym/']//span[text()='Gym']
${PH_header_categories_hair_care_link}  //div[@id='menu']//a[@href='https://iprice.ph/hair-care/']//span[text()='Hair Care']
${PH_header_categories_health_link}  //div[@id='menu']//a[@href='https://iprice.ph/health/']//span[text()='Health']
${PH_header_categories_kids_clothing_link}  //div[@id='menu']//a[@href='https://iprice.ph/kids-clothing/']//span[text()='Kids Clothing']
${PH_header_categories_makeup_link}  //div[@id='menu']//a[@href='https://iprice.ph/makeup/']//span[text()='Makeup']
${PH_header_categories_maternity_care_link}  //div[@id='menu']//a[@href='https://iprice.ph/maternity-care/']//span[text()='Maternity Care']
${PH_header_categories_medical_supplies_link}  //div[@id='menu']//a[@href='https://iprice.ph/medical-supplies/']//span[text()='Medical Supplies']
${PH_header_categories_nursery_link}  //div[@id='menu']//a[@href='https://iprice.ph/nursery/']//span[text()='Nursery']
${PH_header_categories_perfeum_link}  //div[@id='menu']//a[@href='https://iprice.ph/perfume/']//span[text()='Perfume']
${PH_header_categories_racquet_sports_link}  //div[@id='menu']//a[@href='https://iprice.ph/racquet-sports/']//span[text()='Racquet Sports']
${PH_header_categories_shaving_supplies_link}  //div[@id='menu']//a[@href='https://iprice.ph/shaving-supplies/']//span[text()='Shaving Supplies']
${PH_header_categories_skin_care_link}  //div[@id='menu']//a[@href='https://iprice.ph/skin-care/']//span[text()='Skin Care']
${PH_header_categories_supplements_link}  //div[@id='menu']//a[@href='https://iprice.ph/supplements/']//span[text()='Supplements']
${PH_header_categories_team_sports_link}  //div[@id='menu']//a[@href='https://iprice.ph/team-sports/']//span[text()='Team Sports']
${PH_header_categories_toys_link}  //div[@id='menu']//a[@href='https://iprice.ph/toys/']//span[text()='Toys']
${PH_header_categories_water_sports_link}  //div[@id='menu']//a[@href='https://iprice.ph/water-sports/']//span[text()='Water Sports']
${PH_header_categories_ear_care_link}  //div[@id='menu']//a[@href='https://iprice.ph/ear-care/']//span[text()='Ear Care']
${PH_header_categories_bathroom_link}  //div[@id='menu']//a[@href='https://iprice.ph/bathroom/']//span[text()='Bathroom']
${PH_header_categories_bedroom_link}  //div[@id='menu']//a[@href='https://iprice.ph/bedroom/']//span[text()='Bedroom']
${PH_header_categories_hallway_entry_link}  //div[@id='menu']//a[@href='https://iprice.ph/hallway-entry/']//span[text()='Hallway & Entry']
${PH_header_categories_home_decor_link}  //div[@id='menu']//a[@href='https://iprice.ph/home-decor/']//span[text()='Home Decor']
${PH_header_categories_home_improvement_link}  //div[@id='menu']//a[@href='https://iprice.ph/home-improvement/']//span[text()='Home Improvement']
${PH_header_categories_home_office_link}  //div[@id='menu']//a[@href='https://iprice.ph/home-office/']//span[text()='Home Office']
${PH_header_categories_housekeepng_link}  //div[@id='menu']//a[@href='https://iprice.ph/housekeeping/']//span[text()='Housekeeping']
${PH_header_categories_kitchen_dining_link}  //div[@id='menu']//a[@href='https://iprice.ph/kitchen-dining/']//span[text()='Kitchen & Dining']
${PH_header_categories_lighting_link}  //div[@id='menu']//a[@href='https://iprice.ph/lighting/']//span[text()='Lighting']
${PH_header_categories_living_room_link}  //div[@id='menu']//a[@href='https://iprice.ph/living-room/']//span[text()='Living Room']
${PH_header_categories_outdoor_garden_link}  //div[@id='menu']//a[@href='https://iprice.ph/outdoor-garden/']//span[text()='Outdoor & Garden']
${PH_header_categories_pets_suplies_link}  //div[@id='menu']//a[@href='https://iprice.ph/pets-supplies/']//span[text()='Pets Supplies']
${PH_header_categories_security_link}  //div[@id='menu']//a[@href='https://iprice.ph/security/']//span[text()='Security']
${PH_header_categories_stationery_link}  //div[@id='menu']//a[@href='https://iprice.ph/stationery/']//span[text()='Stationery']
${PH_header_categories_gadgets_link}  //div[@id='menu']//a[@href='https://iprice.ph/gadgets/']//span[text()='Gadgets']
${PH_header_categories_other_sports_link}  //div[@id='menu']//a[@href='https://iprice.ph/other-sports/']//span[text()='Other Sports']
${PH_header_categories_upcoming_products_link}  //div[@id='menu']//a[@href='https://iprice.ph/upcoming-products/']//span[text()='Upcoming Products']

${PH_product_images}  //img[contains(@class,'lazy product-img')]

${PH_coupon_page_title}     Get Exclusive Sales, Vouchers & Promotions in 2017 | iPrice Philippines

*** Keywords ***

Get All Available Links In PH
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

Check All Links Response In PH
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
    \  Create Session  iprice  https://iprice.ph/  disable_warnings=0
    \  Sleep  1
    \  ${link}  Get From List  ${filter_link2}  ${INDEX}
    \  ${link2}  Replace String  ${link}  https://iprice.ph/  ${empty}
    \  ${link3}  Replace String  ${link2}  ${space}  ${empty}
    \  ${resp}  RequestsLibrary.Get Request  iprice  ${link3}
    \  ${status}  Run Keyword And Return Status  Should Be Equal As Strings  ${resp.status_code}  200
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to ${link} failed and not return 200.
    # \  Should Be Equal As Strings  ${resp.status_code}  200
    \  Delete All Sessions

SEO Check Internal Link In PH
    ${internal_links}   Create List
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link1_count}
    \  ${link}  Get From List  ${filter_link1}  ${INDEX}
    \  ${match}  Get Regexp Matches  ${link}  iprice.ph
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
    ${match}  Get Matching Xpath Count  ${PH_product_images}
    Run Keyword If  "${match}"!="${imageCount}"  Run Keyword And Continue On Failure  Fail  Images count wrong.
    :FOR  ${INDEX}  IN RANGE  1  ${imageCount}
    \  ${altImages}  Get Element Attribute  xpath=(${PH_product_images})[${INDEX}]@alt
    \  Run Keyword If  "${altImages}"=="None"  Run Keyword And Continue On Failure  Fail  Image does not contains alt.

Access iPrice PH Homepage
    Go To    ${PH_homeURL}
    Sleep    1
    iPrice PH Homepage Landing

iPrice PH Homepage Landing
    Title Should Be    ${PH_homeTitle}
    Wait Until Element Is Visible    ${PH_header_logo_link}
    Wait Until Element Is Visible    ${PH_header_search_input}
    Wait Until Element Is Visible    ${PH_header_popular_searches_text}
    Wait Until Element Is Visible    ${PH_header_coupon_logo_link}
    Wait Until Element Is Visible    ${PH_header_coupon_text}

iPrice PH Homepage Categories Landing
    ${match}  Get Matching Xpath Count  //div[@id='menu']//li[@class='cursor-pointer list-item']//span
    Run Keyword If  ${match}!=59  Run Keyword And Continue On Failure  Fail  Main categories count incorrect.
    Wait Until Element Is Visible    ${PH_header_categories_clothing_link}
    Wait Until Element Is Visible    ${PH_header_categories_shoes_link}
    Wait Until Element Is Visible    ${PH_header_categories_bags_link}
    Wait Until Element Is Visible    ${PH_header_categories_watches_link}
    Wait Until Element Is Visible    ${PH_header_categories_jewellery_link}
    Wait Until Element Is Visible    ${PH_header_categories_computing_link}
    Wait Until Element Is Visible    ${PH_header_categories_phones_tablets_link}
    Wait Until Element Is Visible    ${PH_header_categories_gaming_link}
    Wait Until Element Is Visible    ${PH_header_categories_camera_photo_link}
    Wait Until Element Is Visible    ${PH_header_categories_tv_video_dvd_link}
    Wait Until Element Is Visible    ${PH_header_categories_appliances_link}
    Wait Until Element Is Visible    ${PH_header_categories_automotive_link}
    Wait Until Page Contains Element  ${PH_header_categories_hobbies_link}
    Element Should Not Be Visible  ${PH_header_categories_hobbies_link}
    Wait Until Page Contains Element  ${PH_header_categories_audio_hifi_link}
    Element Should Not Be Visible  ${PH_header_categories_audio_hifi_link}
    Wait Until Page Contains Element  ${PH_header_categories_action_sport_link}
    Element Should Not Be Visible  ${PH_header_categories_action_sport_link}
    Wait Until Page Contains Element  ${PH_header_categories_adventure_link}
    Element Should Not Be Visible  ${PH_header_categories_adventure_link}
    Wait Until Page Contains Element  ${PH_header_categories_baby_clothing_link}
    Element Should Not Be Visible  ${PH_header_categories_baby_clothing_link}
    Wait Until Page Contains Element  ${PH_header_categories_baby_gear_link}
    Element Should Not Be Visible  ${PH_header_categories_baby_gear_link}
    Wait Until Page Contains Element  ${PH_header_categories_bath_body_link}
    Element Should Not Be Visible  ${PH_header_categories_bath_body_link}
    Wait Until Page Contains Element  ${PH_header_categories_dental_care_link}
    Element Should Not Be Visible  ${PH_header_categories_dental_care_link}
    Wait Until Page Contains Element  ${PH_header_categories_diapering_link}
    Element Should Not Be Visible  ${PH_header_categories_diapering_link}
    Wait Until Page Contains Element  ${PH_header_categories_eyecare_link}
    Element Should Not Be Visible  ${PH_header_categories_eyecare_link}
    Wait Until Page Contains Element  ${PH_header_categories_feeding_link}
    Element Should Not Be Visible  ${PH_header_categories_feeding_link}
    Wait Until Page Contains Element  ${PH_header_categories_food_supplements_link}
    Element Should Not Be Visible  ${PH_header_categories_food_supplements_link}
    Wait Until Page Contains Element  ${PH_header_categories_gifts_link}
    Element Should Not Be Visible  ${PH_header_categories_gifts_link}
    Wait Until Page Contains Element  ${PH_header_categories_gym_link}
    Element Should Not Be Visible  ${PH_header_categories_gym_link}
    Wait Until Page Contains Element  ${PH_header_categories_hair_care_link}
    Element Should Not Be Visible  ${PH_header_categories_hair_care_link}
    Wait Until Page Contains Element  ${PH_header_categories_health_link}
    Element Should Not Be Visible  ${PH_header_categories_health_link}
    Wait Until Page Contains Element  ${PH_header_categories_kids_clothing_link}
    Element Should Not Be Visible  ${PH_header_categories_kids_clothing_link}
    Wait Until Page Contains Element  ${PH_header_categories_makeup_link}
    Element Should Not Be Visible  ${PH_header_categories_makeup_link}
    Wait Until Page Contains Element  ${PH_header_categories_maternity_care_link}
    Element Should Not Be Visible  ${PH_header_categories_maternity_care_link}
    Wait Until Page Contains Element  ${PH_header_categories_medical_supplies_link}
    Element Should Not Be Visible  ${PH_header_categories_medical_supplies_link}
    Wait Until Page Contains Element  ${PH_header_categories_nursery_link}
    Element Should Not Be Visible  ${PH_header_categories_nursery_link}
    Wait Until Page Contains Element  ${PH_header_categories_perfeum_link}
    Element Should Not Be Visible  ${PH_header_categories_perfeum_link}
    Wait Until Page Contains Element  ${PH_header_categories_racquet_sports_link}
    Element Should Not Be Visible  ${PH_header_categories_racquet_sports_link}
    Wait Until Page Contains Element  ${PH_header_categories_shaving_supplies_link}
    Element Should Not Be Visible  ${PH_header_categories_shaving_supplies_link}
    Wait Until Page Contains Element  ${PH_header_categories_skin_care_link}
    Element Should Not Be Visible  ${PH_header_categories_skin_care_link}
    Wait Until Page Contains Element  ${PH_header_categories_supplements_link}
    Element Should Not Be Visible  ${PH_header_categories_supplements_link}
    Wait Until Page Contains Element  ${PH_header_categories_team_sports_link}
    Element Should Not Be Visible  ${PH_header_categories_team_sports_link}
    Wait Until Page Contains Element  ${PH_header_categories_toys_link}
    Element Should Not Be Visible  ${PH_header_categories_toys_link}
    Wait Until Page Contains Element  ${PH_header_categories_water_sports_link}
    Element Should Not Be Visible  ${PH_header_categories_water_sports_link}
    Wait Until Page Contains Element  ${PH_header_categories_ear_care_link}
    Element Should Not Be Visible  ${PH_header_categories_ear_care_link}
    Wait Until Page Contains Element  ${PH_header_categories_bathroom_link}
    Element Should Not Be Visible  ${PH_header_categories_bathroom_link}
    Wait Until Page Contains Element  ${PH_header_categories_bedroom_link}
    Element Should Not Be Visible  ${PH_header_categories_bedroom_link}
    Wait Until Page Contains Element  ${PH_header_categories_hallway_entry_link}
    Element Should Not Be Visible  ${PH_header_categories_hallway_entry_link}
    Wait Until Page Contains Element  ${PH_header_categories_home_decor_link}
    Element Should Not Be Visible  ${PH_header_categories_home_decor_link}
    Wait Until Page Contains Element  ${PH_header_categories_home_improvement_link}
    Element Should Not Be Visible  ${PH_header_categories_home_improvement_link}
    Wait Until Page Contains Element  ${PH_header_categories_home_office_link}
    Element Should Not Be Visible  ${PH_header_categories_home_office_link}
    Wait Until Page Contains Element  ${PH_header_categories_housekeepng_link}
    Element Should Not Be Visible  ${PH_header_categories_housekeepng_link}
    Wait Until Page Contains Element  ${PH_header_categories_kitchen_dining_link}
    Element Should Not Be Visible  ${PH_header_categories_kitchen_dining_link}
    Wait Until Page Contains Element  ${PH_header_categories_lighting_link}
    Element Should Not Be Visible  ${PH_header_categories_lighting_link}
    Wait Until Page Contains Element  ${PH_header_categories_living_room_link}
    Element Should Not Be Visible  ${PH_header_categories_living_room_link}
    Wait Until Page Contains Element  ${PH_header_categories_outdoor_garden_link}
    Element Should Not Be Visible  ${PH_header_categories_outdoor_garden_link}
    Wait Until Page Contains Element  ${PH_header_categories_pets_suplies_link}
    Element Should Not Be Visible  ${PH_header_categories_pets_suplies_link}
    Wait Until Page Contains Element  ${PH_header_categories_security_link}
    Element Should Not Be Visible  ${PH_header_categories_security_link}
    Wait Until Page Contains Element  ${PH_header_categories_stationery_link}
    Element Should Not Be Visible  ${PH_header_categories_stationery_link}
    Wait Until Page Contains Element  ${PH_header_categories_gadgets_link}
    Element Should Not Be Visible  ${PH_header_categories_gadgets_link}
    Wait Until Page Contains Element  ${PH_header_categories_other_sports_link}
    Element Should Not Be Visible  ${PH_header_categories_other_sports_link}
    Wait Until Page Contains Element  ${PH_header_categories_upcoming_products_link}
    Element Should Not Be Visible  ${PH_header_categories_upcoming_products_link}
    Mouse Over    ${PH_header_categories_clothing_link}
    Wait Until Element Is Visible    ${PH_header_categories_clothing_men}
    Wait Until Element Is Visible    ${PH_header_categories_clothing_women}
    Mouse Over    ${PH_header_categories_shoes_link}
    Wait Until Element Is Visible    ${PH_header_categories_shoes_men}
    Wait Until Element Is Visible    ${PH_header_categories_shoes_women}

iPrice PH Access Header Link
    Click Element    ${PH_header_logo_link}
    Sleep    1
    iPrice PH Homepage Landing

iPrice PH Search In Header    [Arguments]    ${itemNames}
    Input Text    ${PH_header_search_input}    ${itemNames}
    Click Element    ${PH_header_search_icon}
    Sleep    1

iPrice PH Search Page Landing    [Arguments]    ${itemNames}
    Title Should Be    ${itemNames} - Buy ${itemNames} online in Philippines | iPrice
    Wait Until Element Is Visible    //div[@id='products-header']//h1[text()='${itemNames}']

iPrice PH Access Coupons Link
    Click Element    ${PH_header_coupon_logo_link}
    Sleep    1
    iPrice PH Coupons Page Landing

iPrice PH Coupons Page Landing
    Title Should Be    ${PH_coupon_page_title}