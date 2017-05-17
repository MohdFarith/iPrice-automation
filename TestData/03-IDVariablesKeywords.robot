*** Settings ***
Documentation    This file will only store variables and keywords for ID.

*** Variables ***

${ID_homeURL}    https://iprice.co.id/
${ID_homeTitle}    Belanja Online, Kode Kupon & Diskon di iprice Indonesia
${ID_header_logo_link}    //div[@id='logo']//a[@href='https://iprice.co.id/']
${ID_header_search_input}    //div[@id='search']//input[@placeholder='Cari produk, kupon atau brand...']
${ID_header_search_icon}    //div[@id='search']//i[@class='icon icon-search-blue']
${ID_header_popular_searches_text}    //div[@id='popular-searches']//li[normalize-space(text())='Pencarian Terpopuler:']
${ID_header_coupon_logo_link}    //div[@id='news-button']//a[@href='https://iprice.co.id/coupons/']
${ID_header_coupon_text}    //div[@id='news-button']//button[normalize-space(text())='Kupon & Penawaran']
${ID_header_categories_clothing_link}    //div[@id='menu']//a[@href='https://iprice.co.id/pakaian/']//span[text()='Pakaian']
${ID_header_categories_clothing_men}    //div[@id='menu']//a[contains(@href,'https://iprice.co.id/pakaian/pria/') and text()='Pria']
${ID_header_categories_clothing_women}    //div[@id='menu']//a[contains(@href,'https://iprice.co.id/pakaian/wanita/') and text()='Wanita']
${ID_header_categories_shoes_link}    //div[@id='menu']//a[@href='https://iprice.co.id/sepatu/']//span[text()='Sepatu']
${ID_header_categories_shoes_men}    //div[@id='menu']//a[contains(@href,'https://iprice.co.id/sepatu/pria/') and text()='Pria']
${ID_header_categories_shoes_women}    //div[@id='menu']//a[contains(@href,'https://iprice.co.id/sepatu/wanita/') and text()='Wanita']
${ID_header_categories_bags_link}  //div[@id='menu']//a[@href='https://iprice.co.id/tas/']//span[text()='Tas']
${ID_header_categories_watches_link}  //div[@id='menu']//a[@href='https://iprice.co.id/jam-tangan/']//span[text()='Jam Tangan']
${ID_header_categories_jewellery_link}  //div[@id='menu']//a[@href='https://iprice.co.id/perhiasan/']//span[text()='Perhiasan']
${ID_header_categories_computing_link}  //div[@id='menu']//a[@href='https://iprice.co.id/komputer/']//span[text()='Komputer']
${ID_header_categories_phones_tablets_link}  //div[@id='menu']//a[@href='https://iprice.co.id/ponsel-tablet/']//span[text()='Ponsel & Tablet']
${ID_header_categories_gaming_link}  //div[@id='menu']//a[@href='https://iprice.co.id/video-game/']//span[text()='Video Game']
${ID_header_categories_camera_photo_link}  //div[@id='menu']//a[@href='https://iprice.co.id/kamera-foto/']//span[text()='Kamera & Foto']
${ID_header_categories_tv_video_dvd_link}  //div[@id='menu']//a[@href='https://iprice.co.id/tv-video-dvd/']//span[text()='TV, Video & DVD']
${ID_header_categories_appliances_link}  //div[@id='menu']//a[@href='https://iprice.co.id/peralatan/']//span[text()='Peralatan']
${ID_header_categories_automotive_link}  //div[@id='menu']//a[@href='https://iprice.co.id/otomotif/']//span[text()='Otomotif']
${ID_header_categories_hobbies_link}  //div[@id='menu']//a[@href='https://iprice.co.id/hobi/']//span[text()='Hobi']
${ID_header_categories_audio_hifi_link}  //div[@id='menu']//a[@href='https://iprice.ph/audio-hi-fi/']//span[text()='Audio & Hi Fi']
${ID_header_categories_action_sport_link}  //div[@id='menu']//a[@href='https://iprice.ph/action-sports/']//span[text()='Action Sports']
${ID_header_categories_adventure_link}  //div[@id='menu']//a[@href='https://iprice.ph/adventure/']//span[text()='Adventure']
${ID_header_categories_baby_clothing_link}  //div[@id='menu']//a[@href='https://iprice.ph/baby-clothing/']//span[text()='Baby Clothing']
${ID_header_categories_baby_gear_link}  //div[@id='menu']//a[@href='https://iprice.ph/baby-gear/']//span[text()='Baby Gear']
${ID_header_categories_bath_body_link}  //div[@id='menu']//a[@href='https://iprice.ph/bath-body/']//span[text()='Bath & Body']
${ID_header_categories_dental_care_link}  //div[@id='menu']//a[@href='https://iprice.ph/dental-care/']//span[text()='Dental Care']
${ID_header_categories_diapering_link}  //div[@id='menu']//a[@href='https://iprice.ph/diapering/']//span[text()='Diapering']
${ID_header_categories_eyecare_link}  //div[@id='menu']//a[@href='https://iprice.ph/eyecare/']//span[text()='Eyecare']
${ID_header_categories_feeding_link}  //div[@id='menu']//a[@href='https://iprice.ph/feeding/']//span[text()='Feeding']
${ID_header_categories_food_supplements_link}  //div[@id='menu']//a[@href='https://iprice.ph/food-supplements/']//span[text()='Food Supplements']
${ID_header_categories_gifts_link}  //div[@id='menu']//a[@href='https://iprice.ph/gifts/']//span[text()='Gifts']
${ID_header_categories_gym_link}  //div[@id='menu']//a[@href='https://iprice.ph/gym/']//span[text()='Gym']
${ID_header_categories_hair_care_link}  //div[@id='menu']//a[@href='https://iprice.ph/hair-care/']//span[text()='Hair Care']
${ID_header_categories_health_link}  //div[@id='menu']//a[@href='https://iprice.ph/health/']//span[text()='Health']
${ID_header_categories_kids_clothing_link}  //div[@id='menu']//a[@href='https://iprice.ph/kids-clothing/']//span[text()='Kids Clothing']
${ID_header_categories_makeup_link}  //div[@id='menu']//a[@href='https://iprice.ph/makeup/']//span[text()='Makeup']
${ID_header_categories_maternity_care_link}  //div[@id='menu']//a[@href='https://iprice.ph/maternity-care/']//span[text()='Maternity Care']
${ID_header_categories_medical_supplies_link}  //div[@id='menu']//a[@href='https://iprice.ph/medical-supplies/']//span[text()='Medical Supplies']
${ID_header_categories_nursery_link}  //div[@id='menu']//a[@href='https://iprice.ph/nursery/']//span[text()='Nursery']
${ID_header_categories_perfeum_link}  //div[@id='menu']//a[@href='https://iprice.ph/perfume/']//span[text()='Perfume']
${ID_header_categories_racquet_sports_link}  //div[@id='menu']//a[@href='https://iprice.ph/racquet-sports/']//span[text()='Racquet Sports']
${ID_header_categories_shaving_supplies_link}  //div[@id='menu']//a[@href='https://iprice.ph/shaving-supplies/']//span[text()='Shaving Supplies']
${ID_header_categories_skin_care_link}  //div[@id='menu']//a[@href='https://iprice.ph/skin-care/']//span[text()='Skin Care']
${ID_header_categories_supplements_link}  //div[@id='menu']//a[@href='https://iprice.ph/supplements/']//span[text()='Supplements']
${ID_header_categories_team_sports_link}  //div[@id='menu']//a[@href='https://iprice.ph/team-sports/']//span[text()='Team Sports']
${ID_header_categories_toys_link}  //div[@id='menu']//a[@href='https://iprice.ph/toys/']//span[text()='Toys']
${ID_header_categories_water_sports_link}  //div[@id='menu']//a[@href='https://iprice.ph/water-sports/']//span[text()='Water Sports']
${ID_header_categories_ear_care_link}  //div[@id='menu']//a[@href='https://iprice.ph/ear-care/']//span[text()='Ear Care']
${ID_header_categories_bathroom_link}  //div[@id='menu']//a[@href='https://iprice.ph/bathroom/']//span[text()='Bathroom']
${ID_header_categories_bedroom_link}  //div[@id='menu']//a[@href='https://iprice.ph/bedroom/']//span[text()='Bedroom']
${ID_header_categories_hallway_entry_link}  //div[@id='menu']//a[@href='https://iprice.ph/hallway-entry/']//span[text()='Hallway & Entry']
${ID_header_categories_home_decor_link}  //div[@id='menu']//a[@href='https://iprice.ph/home-decor/']//span[text()='Home Decor']
${ID_header_categories_home_improvement_link}  //div[@id='menu']//a[@href='https://iprice.ph/home-improvement/']//span[text()='Home Improvement']
${ID_header_categories_home_office_link}  //div[@id='menu']//a[@href='https://iprice.ph/home-office/']//span[text()='Home Office']
${ID_header_categories_housekeepng_link}  //div[@id='menu']//a[@href='https://iprice.ph/housekeeping/']//span[text()='Housekeeping']
${ID_header_categories_kitchen_dining_link}  //div[@id='menu']//a[@href='https://iprice.ph/kitchen-dining/']//span[text()='Kitchen & Dining']
${ID_header_categories_lighting_link}  //div[@id='menu']//a[@href='https://iprice.ph/lighting/']//span[text()='Lighting']
${ID_header_categories_living_room_link}  //div[@id='menu']//a[@href='https://iprice.ph/living-room/']//span[text()='Living Room']
${ID_header_categories_outdoor_garden_link}  //div[@id='menu']//a[@href='https://iprice.ph/outdoor-garden/']//span[text()='Outdoor & Garden']
${ID_header_categories_pets_suplies_link}  //div[@id='menu']//a[@href='https://iprice.ph/pets-supplies/']//span[text()='Pets Supplies']
${ID_header_categories_security_link}  //div[@id='menu']//a[@href='https://iprice.ph/security/']//span[text()='Security']
${ID_header_categories_stationery_link}  //div[@id='menu']//a[@href='https://iprice.ph/stationery/']//span[text()='Stationery']
${ID_header_categories_gadgets_link}  //div[@id='menu']//a[@href='https://iprice.ph/gadgets/']//span[text()='Gadgets']
${ID_header_categories_other_sports_link}  //div[@id='menu']//a[@href='https://iprice.ph/other-sports/']//span[text()='Other Sports']
${ID_header_categories_upcoming_products_link}  //div[@id='menu']//a[@href='https://iprice.ph/upcoming-products/']//span[text()='Upcoming Products']

${ID_product_images}  //img[contains(@class,'lazy product-img')]

${ID_coupon_page_title}    Dapatkan Exclusive Promo, Sales & Vouchers\u00a0di tahun 2017 | iPrice Indonesia

*** Keywords ***

Get All Available Links In ID
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

Check All Links Response In ID
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
    \  Create Session  iprice  https://iprice.co.id/  disable_warnings=0
    \  Sleep  1
    \  ${link}  Get From List  ${filter_link2}  ${INDEX}
    \  ${link2}  Replace String  ${link}  https://iprice.co.id/  ${empty}
    \  ${link3}  Replace String  ${link2}  ${space}  ${empty}
    \  ${status}  Run Keyword And Return Status  RequestsLibrary.Get Request  iprice  ${link3}
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to ${link} failed and not return 200.
    # \  Should Be Equal As Strings  ${resp.status_code}  200
    \  Delete All Sessions

SEO Check Internal Link In ID
    ${internal_links}   Create List
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link1_count}
    \  ${link}  Get From List  ${filter_link1}  ${INDEX}
    \  ${match}  Get Regexp Matches  ${link}  iprice.co.id
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
    ${match}  Get Matching Xpath Count  ${ID_product_images}
    Run Keyword If  "${match}"!="${imageCount}"  Run Keyword And Continue On Failure  Fail  Images count wrong.
    :FOR  ${INDEX}  IN RANGE  1  ${imageCount}
    \  ${altImages}  Get Element Attribute  xpath=(${ID_product_images})[${INDEX}]@alt
    \  Run Keyword If  "${altImages}"=="None"  Run Keyword And Continue On Failure  Fail  Image does not contains alt.

Access iPrice ID Homepage
    Go To    ${ID_homeURL}
    Sleep    1
    Title Should Be    ${ID_homeTitle}

iPrice ID Homepage Landing
    Title Should Be    ${ID_homeTitle}
    Wait Until Element Is Visible    ${ID_header_logo_link}
    Wait Until Element Is Visible    ${ID_header_search_input}
    Wait Until Element Is Visible    ${ID_header_popular_searches_text}
    Wait Until Element Is Visible    ${ID_header_coupon_logo_link}
    Wait Until Element Is Visible    ${ID_header_coupon_text}

iPrice ID Homepage Categories Landing
    ${match}  Get Matching Xpath Count  //div[@id='menu']//li[@class='cursor-pointer list-item']//span
    Run Keyword If  ${match}!=59  Run Keyword And Continue On Failure  Fail  Main categories count incorrect.
    Wait Until Element Is Visible    ${ID_header_categories_clothing_link}
    Wait Until Element Is Visible    ${ID_header_categories_shoes_link}
    Wait Until Element Is Visible    ${ID_header_categories_bags_link}
    Wait Until Element Is Visible    ${ID_header_categories_watches_link}
    Wait Until Element Is Visible    ${ID_header_categories_jewellery_link}
    Wait Until Element Is Visible    ${ID_header_categories_computing_link}
    Wait Until Element Is Visible    ${ID_header_categories_phones_tablets_link}
    Wait Until Element Is Visible    ${ID_header_categories_gaming_link}
    Wait Until Element Is Visible    ${ID_header_categories_camera_photo_link}
    Wait Until Element Is Visible    ${ID_header_categories_tv_video_dvd_link}
    Wait Until Element Is Visible    ${ID_header_categories_appliances_link}
    Wait Until Element Is Visible    ${ID_header_categories_automotive_link}
    Mouse Over    ${ID_header_categories_clothing_link}
    Wait Until Element Is Visible    ${ID_header_categories_clothing_men}
    Wait Until Element Is Visible    ${ID_header_categories_clothing_women}
    Mouse Over    ${ID_header_categories_shoes_link}
    Wait Until Element Is Visible    ${ID_header_categories_shoes_men}
    Wait Until Element Is Visible    ${ID_header_categories_shoes_women}

iPrice ID Access Header Link
    Click Element    ${ID_header_logo_link}
    Sleep    1
    iPrice ID Homepage Landing

iPrice ID Search In Header    [Arguments]    ${itemNames}
    Input Text    ${ID_header_search_input}    ${itemNames}
    Click Element    ${ID_header_search_icon}
    Sleep    1

iPrice ID Search Page Landing    [Arguments]    ${itemNames}
    Title Should Be    Toko | iprice Indonesia
    Wait Until Element Is Visible    //div[@id='products-header']//h1[text()='${itemNames}']

iPrice ID Access Coupons Link
    Click Element    ${ID_header_coupon_logo_link}
    Sleep    1
    iPrice ID Coupons Page Landing

iPrice ID Coupons Page Landing
    Run Keyword And Continue On Failure    Title Should Be    ${ID_coupon_page_title}