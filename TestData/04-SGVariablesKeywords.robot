*** Settings ***
Documentation    This file will only store variables and keywords for SG.

*** Variables ***

${SG_homeURL}    https://iprice.sg/
${SG_homeTitle}    Online Shopping, Coupons & Discount Codes at iprice Singapore
${SG_header_logo_link}    //div[@id='logo']//a[@href='https://iprice.sg/']
${SG_header_search_input}    //div[@id='search']//input[@placeholder='Search for products, coupons or brands...']
${SG_header_search_icon}    //div[@id='search']//i[@class='icon icon-search-blue']
${SG_header_popular_searches_text}    //div[@id='popular-searches']//li[normalize-space(text())='Popular Searches:']
${SG_header_coupon_logo_link}    //div[@id='news-button']//a[@href='https://iprice.sg/coupons/']
${SG_header_coupon_text}    //div[@id='news-button']//button[normalize-space(text())='Coupons & Offers']
${SG_header_categories_clothing_link}    //div[@id='menu']//a[@href='https://iprice.sg/clothing/']//span[text()='Clothing']
${SG_header_categories_clothing_men}    //div[@id='menu']//a[contains(@href,'https://iprice.sg/clothing/men/') and text()='Men']
${SG_header_categories_clothing_women}    //div[@id='menu']//a[contains(@href,'https://iprice.sg/clothing/women/') and text()='Women']
${SG_header_categories_shoes_link}    //div[@id='menu']//a[@href='https://iprice.sg/shoes/']//span[text()='Shoes']
${SG_header_categories_shoes_men}    //div[@id='menu']//a[contains(@href,'https://iprice.sg/shoes/men/') and text()='Men']
${SG_header_categories_shoes_women}    //div[@id='menu']//a[contains(@href,'https://iprice.sg/shoes/women/') and text()='Women']
${SG_header_categories_bags_link}  //div[@id='menu']//a[@href='https://iprice.sg/bags/']//span[text()='Bags']
${SG_header_categories_watches_link}  //div[@id='menu']//a[@href='https://iprice.sg/watches/']//span[text()='Watches']
${SG_header_categories_jewellery_link}  //div[@id='menu']//a[@href='https://iprice.sg/jewellery/']//span[text()='Jewellery']
${SG_header_categories_computing_link}  //div[@id='menu']//a[@href='https://iprice.sg/computing/']//span[text()='Computing']
${SG_header_categories_phones_tablets_link}  //div[@id='menu']//a[@href='https://iprice.sg/phones-tablets/']//span[text()='Phones & Tablets']
${SG_header_categories_gaming_link}  //div[@id='menu']//a[@href='https://iprice.sg/gaming/']//span[text()='Gaming']
${SG_header_categories_camera_photo_link}  //div[@id='menu']//a[@href='https://iprice.sg/camera-photo/']//span[text()='Camera & Photo']
${SG_header_categories_tv_video_dvd_link}  //div[@id='menu']//a[@href='https://iprice.sg/tv-video-dvd/']//span[text()='TV, Video & DVD']
${SG_header_categories_appliances_link}  //div[@id='menu']//a[@href='https://iprice.sg/appliances/']//span[text()='Appliances']
${SG_header_categories_automotive_link}  //div[@id='menu']//a[@href='https://iprice.sg/automotive/']//span[text()='Automotive']
${SG_header_categories_hobbies_link}  //div[@id='menu']//a[@href='https://iprice.sg/hobbies/']//span[text()='Hobbies']
${SG_header_categories_audio_hifi_link}  //div[@id='menu']//a[@href='https://iprice.sg/audio-hi-fi/']//span[text()='Audio & Hi Fi']
${SG_header_categories_action_sport_link}  //div[@id='menu']//a[@href='https://iprice.sg/action-sports/']//span[text()='Action Sports']
${SG_header_categories_adventure_link}  //div[@id='menu']//a[@href='https://iprice.sg/adventure/']//span[text()='Adventure']
${SG_header_categories_baby_clothing_link}  //div[@id='menu']//a[@href='https://iprice.sg/baby-clothing/']//span[text()='Baby Clothing']
${SG_header_categories_baby_gear_link}  //div[@id='menu']//a[@href='https://iprice.sg/baby-gear/']//span[text()='Baby Gear']
${SG_header_categories_bath_body_link}  //div[@id='menu']//a[@href='https://iprice.sg/bath-body/']//span[text()='Bath & Body']
${SG_header_categories_dental_care_link}  //div[@id='menu']//a[@href='https://iprice.sg/dental-care/']//span[text()='Dental Care']
${SG_header_categories_diapering_link}  //div[@id='menu']//a[@href='https://iprice.sg/diapering/']//span[text()='Diapering']
${SG_header_categories_eyecare_link}  //div[@id='menu']//a[@href='https://iprice.sg/eyecare/']//span[text()='Eyecare']
${SG_header_categories_feeding_link}  //div[@id='menu']//a[@href='https://iprice.sg/feeding/']//span[text()='Feeding']
${SG_header_categories_food_supplements_link}  //div[@id='menu']//a[@href='https://iprice.sg/food-supplements/']//span[text()='Food Supplements']
${SG_header_categories_gifts_link}  //div[@id='menu']//a[@href='https://iprice.sg/gifts/']//span[text()='Gifts']
${SG_header_categories_gym_link}  //div[@id='menu']//a[@href='https://iprice.sg/gym/']//span[text()='Gym']
${SG_header_categories_hair_care_link}  //div[@id='menu']//a[@href='https://iprice.sg/hair-care/']//span[text()='Hair Care']
${SG_header_categories_health_link}  //div[@id='menu']//a[@href='https://iprice.sg/health/']//span[text()='Health']
${SG_header_categories_kids_clothing_link}  //div[@id='menu']//a[@href='https://iprice.sg/kids-clothing/']//span[text()='Kids Clothing']
${SG_header_categories_makeup_link}  //div[@id='menu']//a[@href='https://iprice.sg/makeup/']//span[text()='Makeup']
${SG_header_categories_maternity_care_link}  //div[@id='menu']//a[@href='https://iprice.sg/maternity-care/']//span[text()='Maternity Care']
${SG_header_categories_medical_supplies_link}  //div[@id='menu']//a[@href='https://iprice.sg/medical-supplies/']//span[text()='Medical Supplies']
${SG_header_categories_nursery_link}  //div[@id='menu']//a[@href='https://iprice.sg/nursery/']//span[text()='Nursery']
${SG_header_categories_perfeum_link}  //div[@id='menu']//a[@href='https://iprice.sg/perfume/']//span[text()='Perfume']
${SG_header_categories_racquet_sports_link}  //div[@id='menu']//a[@href='https://iprice.sg/racquet-sports/']//span[text()='Racquet Sports']
${SG_header_categories_shaving_supplies_link}  //div[@id='menu']//a[@href='https://iprice.sg/shaving-supplies/']//span[text()='Shaving Supplies']
${SG_header_categories_skin_care_link}  //div[@id='menu']//a[@href='https://iprice.sg/skin-care/']//span[text()='Skin Care']
${SG_header_categories_supplements_link}  //div[@id='menu']//a[@href='https://iprice.sg/supplements/']//span[text()='Supplements']
${SG_header_categories_team_sports_link}  //div[@id='menu']//a[@href='https://iprice.sg/team-sports/']//span[text()='Team Sports']
${SG_header_categories_toys_link}  //div[@id='menu']//a[@href='https://iprice.sg/toys/']//span[text()='Toys']
${SG_header_categories_water_sports_link}  //div[@id='menu']//a[@href='https://iprice.sg/water-sports/']//span[text()='Water Sports']
${SG_header_categories_ear_care_link}  //div[@id='menu']//a[@href='https://iprice.sg/ear-care/']//span[text()='Ear Care']
${SG_header_categories_bathroom_link}  //div[@id='menu']//a[@href='https://iprice.sg/bathroom/']//span[text()='Bathroom']
${SG_header_categories_bedroom_link}  //div[@id='menu']//a[@href='https://iprice.sg/bedroom/']//span[text()='Bedroom']
${SG_header_categories_hallway_entry_link}  //div[@id='menu']//a[@href='https://iprice.sg/hallway-entry/']//span[text()='Hallway & Entry']
${SG_header_categories_home_decor_link}  //div[@id='menu']//a[@href='https://iprice.sg/home-decor/']//span[text()='Home Decor']
${SG_header_categories_home_improvement_link}  //div[@id='menu']//a[@href='https://iprice.sg/home-improvement/']//span[text()='Home Improvement']
${SG_header_categories_home_office_link}  //div[@id='menu']//a[@href='https://iprice.sg/home-office/']//span[text()='Home Office']
${SG_header_categories_housekeepng_link}  //div[@id='menu']//a[@href='https://iprice.sg/housekeeping/']//span[text()='Housekeeping']
${SG_header_categories_kitchen_dining_link}  //div[@id='menu']//a[@href='https://iprice.sg/kitchen-dining/']//span[text()='Kitchen & Dining']
${SG_header_categories_lighting_link}  //div[@id='menu']//a[@href='https://iprice.sg/lighting/']//span[text()='Lighting']
${SG_header_categories_living_room_link}  //div[@id='menu']//a[@href='https://iprice.sg/living-room/']//span[text()='Living Room']
${SG_header_categories_outdoor_garden_link}  //div[@id='menu']//a[@href='https://iprice.sg/outdoor-garden/']//span[text()='Outdoor & Garden']
${SG_header_categories_pets_suplies_link}  //div[@id='menu']//a[@href='https://iprice.sg/pets-supplies/']//span[text()='Pets Supplies']
${SG_header_categories_security_link}  //div[@id='menu']//a[@href='https://iprice.sg/security/']//span[text()='Security']
${SG_header_categories_stationery_link}  //div[@id='menu']//a[@href='https://iprice.sg/stationery/']//span[text()='Stationery']
${SG_header_categories_gadgets_link}  //div[@id='menu']//a[@href='https://iprice.sg/gadgets/']//span[text()='Gadgets']
${SG_header_categories_other_sports_link}  //div[@id='menu']//a[@href='https://iprice.sg/other-sports/']//span[text()='Other Sports']
${SG_header_categories_upcoming_products_link}  //div[@id='menu']//a[@href='https://iprice.sg/upcoming-products/']//span[text()='Upcoming Products']

${SG_product_images}  //img[contains(@class,'lazy product-img')]

${SG_coupon_page_title}     Get Exclusive Sales, Promotions & Vouchers in 2017 | iPrice Singapore

*** Keywords ***

Get All Available Links In SG
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

Check All Links Response In SG
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
    \  Create Session  iprice  https://iprice.sg/  disable_warnings=0
    \  Sleep  1
    \  ${link}  Get From List  ${filter_link2}  ${INDEX}
    \  ${link2}  Replace String  ${link}  https://iprice.sg/  ${empty}
    \  ${link3}  Replace String  ${link2}  ${space}  ${empty}
    \  ${resp}  RequestsLibrary.Get Request  iprice  ${link3}
    \  ${status}  Run Keyword And Return Status  Should Be Equal As Strings  ${resp.status_code}  200
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to ${link} failed and not return 200.
    # \  Should Be Equal As Strings  ${resp.status_code}  200
    \  Delete All Sessions

SEO Check Internal Link In SG
    ${internal_links}   Create List
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link1_count}
    \  ${link}  Get From List  ${filter_link1}  ${INDEX}
    \  ${match}  Get Regexp Matches  ${link}  iprice.sg
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
    ${match}  Get Matching Xpath Count  ${SG_product_images}
    Run Keyword If  "${match}"!="${imageCount}"  Run Keyword And Continue On Failure  Fail  Images count wrong.
    :FOR  ${INDEX}  IN RANGE  1  ${imageCount}
    \  ${altImages}  Get Element Attribute  xpath=(${SG_product_images})[${INDEX}]@alt
    \  Run Keyword If  "${altImages}"=="None"  Run Keyword And Continue On Failure  Fail  Image does not contains alt.

Access iPrice SG Homepage
    Go To    ${SG_homeURL}
    Sleep    1
    iPrice SG Homepage Landing

iPrice SG Homepage Landing
    Title Should Be    ${SG_homeTitle}
    Wait Until Element Is Visible    ${SG_header_logo_link}
    Wait Until Element Is Visible    ${SG_header_search_input}
    Wait Until Element Is Visible    ${SG_header_popular_searches_text}
    Wait Until Element Is Visible    ${SG_header_coupon_logo_link}
    Wait Until Element Is Visible    ${SG_header_coupon_text}

iPrice SG Homepage Categories Landing
    ${match}  Get Matching Xpath Count  //div[@id='menu']//li[@class='cursor-pointer list-item']//span
    Run Keyword If  ${match}!=59  Run Keyword And Continue On Failure  Fail  Main categories count incorrect.
    Wait Until Element Is Visible    ${SG_header_categories_clothing_link}
    Wait Until Element Is Visible    ${SG_header_categories_shoes_link}
    Wait Until Element Is Visible    ${SG_header_categories_bags_link}
    Wait Until Element Is Visible    ${SG_header_categories_watches_link}
    Wait Until Element Is Visible    ${SG_header_categories_jewellery_link}
    Wait Until Element Is Visible    ${SG_header_categories_computing_link}
    Wait Until Element Is Visible    ${SG_header_categories_phones_tablets_link}
    Wait Until Element Is Visible    ${SG_header_categories_gaming_link}
    Wait Until Element Is Visible    ${SG_header_categories_camera_photo_link}
    Wait Until Element Is Visible    ${SG_header_categories_tv_video_dvd_link}
    Wait Until Element Is Visible    ${SG_header_categories_appliances_link}
    Wait Until Element Is Visible    ${SG_header_categories_automotive_link}
    Wait Until Page Contains Element  ${SG_header_categories_hobbies_link}
    Element Should Not Be Visible  ${SG_header_categories_hobbies_link}
    Wait Until Page Contains Element  ${SG_header_categories_audio_hifi_link}
    Element Should Not Be Visible  ${SG_header_categories_audio_hifi_link}
    Wait Until Page Contains Element  ${SG_header_categories_action_sport_link}
    Element Should Not Be Visible  ${SG_header_categories_action_sport_link}
    Wait Until Page Contains Element  ${SG_header_categories_adventure_link}
    Element Should Not Be Visible  ${SG_header_categories_adventure_link}
    Wait Until Page Contains Element  ${SG_header_categories_baby_clothing_link}
    Element Should Not Be Visible  ${SG_header_categories_baby_clothing_link}
    Wait Until Page Contains Element  ${SG_header_categories_baby_gear_link}
    Element Should Not Be Visible  ${SG_header_categories_baby_gear_link}
    Wait Until Page Contains Element  ${SG_header_categories_bath_body_link}
    Element Should Not Be Visible  ${SG_header_categories_bath_body_link}
    Wait Until Page Contains Element  ${SG_header_categories_dental_care_link}
    Element Should Not Be Visible  ${SG_header_categories_dental_care_link}
    Wait Until Page Contains Element  ${SG_header_categories_diapering_link}
    Element Should Not Be Visible  ${SG_header_categories_diapering_link}
    Wait Until Page Contains Element  ${SG_header_categories_eyecare_link}
    Element Should Not Be Visible  ${SG_header_categories_eyecare_link}
    Wait Until Page Contains Element  ${SG_header_categories_feeding_link}
    Element Should Not Be Visible  ${SG_header_categories_feeding_link}
    Wait Until Page Contains Element  ${SG_header_categories_food_supplements_link}
    Element Should Not Be Visible  ${SG_header_categories_food_supplements_link}
    Wait Until Page Contains Element  ${SG_header_categories_gifts_link}
    Element Should Not Be Visible  ${SG_header_categories_gifts_link}
    Wait Until Page Contains Element  ${SG_header_categories_gym_link}
    Element Should Not Be Visible  ${SG_header_categories_gym_link}
    Wait Until Page Contains Element  ${SG_header_categories_hair_care_link}
    Element Should Not Be Visible  ${SG_header_categories_hair_care_link}
    Wait Until Page Contains Element  ${SG_header_categories_health_link}
    Element Should Not Be Visible  ${SG_header_categories_health_link}
    Wait Until Page Contains Element  ${SG_header_categories_kids_clothing_link}
    Element Should Not Be Visible  ${SG_header_categories_kids_clothing_link}
    Wait Until Page Contains Element  ${SG_header_categories_makeup_link}
    Element Should Not Be Visible  ${SG_header_categories_makeup_link}
    Wait Until Page Contains Element  ${SG_header_categories_maternity_care_link}
    Element Should Not Be Visible  ${SG_header_categories_maternity_care_link}
    Wait Until Page Contains Element  ${SG_header_categories_medical_supplies_link}
    Element Should Not Be Visible  ${SG_header_categories_medical_supplies_link}
    Wait Until Page Contains Element  ${SG_header_categories_nursery_link}
    Element Should Not Be Visible  ${SG_header_categories_nursery_link}
    Wait Until Page Contains Element  ${SG_header_categories_perfeum_link}
    Element Should Not Be Visible  ${SG_header_categories_perfeum_link}
    Wait Until Page Contains Element  ${SG_header_categories_racquet_sports_link}
    Element Should Not Be Visible  ${SG_header_categories_racquet_sports_link}
    Wait Until Page Contains Element  ${SG_header_categories_shaving_supplies_link}
    Element Should Not Be Visible  ${SG_header_categories_shaving_supplies_link}
    Wait Until Page Contains Element  ${SG_header_categories_skin_care_link}
    Element Should Not Be Visible  ${SG_header_categories_skin_care_link}
    Wait Until Page Contains Element  ${SG_header_categories_supplements_link}
    Element Should Not Be Visible  ${SG_header_categories_supplements_link}
    Wait Until Page Contains Element  ${SG_header_categories_team_sports_link}
    Element Should Not Be Visible  ${SG_header_categories_team_sports_link}
    Wait Until Page Contains Element  ${SG_header_categories_toys_link}
    Element Should Not Be Visible  ${SG_header_categories_toys_link}
    Wait Until Page Contains Element  ${SG_header_categories_water_sports_link}
    Element Should Not Be Visible  ${SG_header_categories_water_sports_link}
    Wait Until Page Contains Element  ${SG_header_categories_ear_care_link}
    Element Should Not Be Visible  ${SG_header_categories_ear_care_link}
    Wait Until Page Contains Element  ${SG_header_categories_bathroom_link}
    Element Should Not Be Visible  ${SG_header_categories_bathroom_link}
    Wait Until Page Contains Element  ${SG_header_categories_bedroom_link}
    Element Should Not Be Visible  ${SG_header_categories_bedroom_link}
    Wait Until Page Contains Element  ${SG_header_categories_hallway_entry_link}
    Element Should Not Be Visible  ${SG_header_categories_hallway_entry_link}
    Wait Until Page Contains Element  ${SG_header_categories_home_decor_link}
    Element Should Not Be Visible  ${SG_header_categories_home_decor_link}
    Wait Until Page Contains Element  ${SG_header_categories_home_improvement_link}
    Element Should Not Be Visible  ${SG_header_categories_home_improvement_link}
    Wait Until Page Contains Element  ${SG_header_categories_home_office_link}
    Element Should Not Be Visible  ${SG_header_categories_home_office_link}
    Wait Until Page Contains Element  ${SG_header_categories_housekeepng_link}
    Element Should Not Be Visible  ${SG_header_categories_housekeepng_link}
    Wait Until Page Contains Element  ${SG_header_categories_kitchen_dining_link}
    Element Should Not Be Visible  ${SG_header_categories_kitchen_dining_link}
    Wait Until Page Contains Element  ${SG_header_categories_lighting_link}
    Element Should Not Be Visible  ${SG_header_categories_lighting_link}
    Wait Until Page Contains Element  ${SG_header_categories_living_room_link}
    Element Should Not Be Visible  ${SG_header_categories_living_room_link}
    Wait Until Page Contains Element  ${SG_header_categories_outdoor_garden_link}
    Element Should Not Be Visible  ${SG_header_categories_outdoor_garden_link}
    Wait Until Page Contains Element  ${SG_header_categories_pets_suplies_link}
    Element Should Not Be Visible  ${SG_header_categories_pets_suplies_link}
    Wait Until Page Contains Element  ${SG_header_categories_security_link}
    Element Should Not Be Visible  ${SG_header_categories_security_link}
    Wait Until Page Contains Element  ${SG_header_categories_stationery_link}
    Element Should Not Be Visible  ${SG_header_categories_stationery_link}
    Wait Until Page Contains Element  ${SG_header_categories_gadgets_link}
    Element Should Not Be Visible  ${SG_header_categories_gadgets_link}
    Wait Until Page Contains Element  ${SG_header_categories_other_sports_link}
    Element Should Not Be Visible  ${SG_header_categories_other_sports_link}
    Wait Until Page Contains Element  ${SG_header_categories_upcoming_products_link}
    Element Should Not Be Visible  ${SG_header_categories_upcoming_products_link}
    Mouse Over    ${SG_header_categories_clothing_link}
    Wait Until Element Is Visible    ${SG_header_categories_clothing_men}
    Wait Until Element Is Visible    ${SG_header_categories_clothing_women}
    Mouse Over    ${SG_header_categories_shoes_link}
    Wait Until Element Is Visible    ${SG_header_categories_shoes_men}
    Wait Until Element Is Visible    ${SG_header_categories_shoes_women}

iPrice SG Access Header Link
    Click Element    ${SG_header_logo_link}
    Sleep    1
    iPrice SG Homepage Landing

iPrice SG Search In Header    [Arguments]    ${itemNames}
    Input Text    ${SG_header_search_input}    ${itemNames}
    Click Element    ${SG_header_search_icon}
    Sleep    1

iPrice SG Search Page Landing    [Arguments]    ${itemNames}
    Title Should Be    Search | iprice Singapore
    Wait Until Element Is Visible    //div[@id='products-header']//h1[text()='${itemNames}']

iPrice SG Access Coupons Link
    Click Element    ${SG_header_coupon_logo_link}
    Sleep    1
    iPrice SG Coupons Page Landing

iPrice SG Coupons Page Landing
    Title Should Be    ${SG_coupon_page_title}