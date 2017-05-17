*** Settings ***
Documentation    This file will only store variables and keywords fro VN.

*** Variables ***

${VN_homeURL}    https://iprice.vn/
${VN_homeTitle}    Shopping trực tuyến, Mã coupon & khuyến mãi tại iprice Việt Nam
${VN_header_logo_link}    //div[@id='logo']//a[@href='https://iprice.vn/']
${VN_header_search_input}    //div[@id='search']//input[@placeholder='Tìm kiếm sản phẩm, coupon hoặc thương hiệu...']
${VN_header_search_icon}    //div[@id='search']//i[@class='icon icon-search-blue']
${VN_header_popular_searches_text}    //div[@id='popular-searches']//li[normalize-space(text())='Xu hướng tìm kiếm:']
${VN_header_coupon_logo_link}    //div[@id='news-button']//a[@href='https://iprice.vn/coupons/']
${VN_header_coupon_text}    //div[@id='news-button']//button[normalize-space(text())='Coupon & Ưu đãi']
${VN_header_categories_clothing_link}    //div[@id='menu']//a[@href='https://iprice.vn/quan-ao/']//span[text()='Quần áo']
${VN_header_categories_clothing_men}    //div[@id='menu']//a[contains(@href,'https://iprice.vn/quan-ao/nam/') and text()='Nam']
${VN_header_categories_clothing_women}    //div[@id='menu']//a[contains(@href,'https://iprice.vn/quan-ao/nu/') and text()='Nữ']
${VN_header_categories_shoes_link}    //div[@id='menu']//a[@href='https://iprice.vn/giay-dep/']//span[text()='Giày dép']
${VN_header_categories_shoes_men}    //div[@id='menu']//a[contains(@href,'https://iprice.vn/giay-dep/nam/') and text()='Nam']
${VN_header_categories_shoes_women}    //div[@id='menu']//a[contains(@href,'https://iprice.vn/giay-dep/nu/') and text()='Nữ']
${VN_header_categories_bags_link}  //div[@id='menu']//a[@href='https://iprice.vn/tui/']//span[text()='Túi']
${VN_header_categories_watches_link}  //div[@id='menu']//a[@href='https://iprice.vn/dong-ho/']//span[text()='Đồng hồ']
${VN_header_categories_jewellery_link}  //div[@id='menu']//a[@href='https://iprice.vn/trang-suc/']//span[text()='Trang sức']
${VN_header_categories_computing_link}  //div[@id='menu']//a[@href='https://iprice.vn/tin-hoc/']//span[text()='Tin học']
${VN_header_categories_phones_tablets_link}  //div[@id='menu']//a[@href='https://iprice.vn/dien-thoai-may-tinh-bang/']//span[text()='Điện thoại & Máy tính bảng']
${VN_header_categories_gaming_link}  //div[@id='menu']//a[@href='https://iprice.vn/choi-game/']//span[text()='Chơi game']
${VN_header_categories_camera_photo_link}  //div[@id='menu']//a[@href='https://iprice.vn/may-anh/']//span[text()='Máy ảnh']
${VN_header_categories_tv_video_dvd_link}  //div[@id='menu']//a[@href='https://iprice.vn/tv-video-dvd/']//span[text()='TV, Video & DVD']
${VN_header_categories_appliances_link}  //div[@id='menu']//a[@href='https://iprice.vn/do-gia-dung/']//span[text()='Đồ gia dụng']
${VN_header_categories_automotive_link}  //div[@id='menu']//a[@href='https://iprice.vn/o-to-xe-may/']//span[text()='Ô tô, Xe máy']
# ${VN_header_categories_hobbies_link}  //div[@id='menu']//a[@href='https://iprice.vn/so-thich/']//span[text()='Sở thích']
# ${VN_header_categories_audio_hifi_link}  //div[@id='menu']//a[@href='https://iprice.vn/am-thanh-hi-fi/']//span[text()='Âm thanh & Hi Fi']
# ${VN_header_categories_action_sport_link}  //div[@id='menu']//a[@href='https://iprice.vn/dien-may/']//span[text()='Điện máy']
# ${VN_header_categories_adventure_link}  //div[@id='menu']//a[@href='https://iprice.vn/nha-cua-gia-dung/']//span[text()='Adventure']
# ${VN_header_categories_baby_clothing_link}  //div[@id='menu']//a[@href='https://iprice.my/baby-clothing/']//span[text()='Baby Clothing']
# ${VN_header_categories_baby_gear_link}  //div[@id='menu']//a[@href='https://iprice.my/baby-gear/']//span[text()='Baby Gear']
# ${VN_header_categories_bath_body_link}  //div[@id='menu']//a[@href='https://iprice.my/bath-body/']//span[text()='Bath & Body']
# ${VN_header_categories_dental_care_link}  //div[@id='menu']//a[@href='https://iprice.my/dental-care/']//span[text()='Dental Care']
# ${VN_header_categories_diapering_link}  //div[@id='menu']//a[@href='https://iprice.my/diapering/']//span[text()='Diapering']
# ${VN_header_categories_eyecare_link}  //div[@id='menu']//a[@href='https://iprice.my/eyecare/']//span[text()='Eyecare']
# ${VN_header_categories_feeding_link}  //div[@id='menu']//a[@href='https://iprice.my/feeding/']//span[text()='Feeding']
# ${VN_header_categories_food_supplements_link}  //div[@id='menu']//a[@href='https://iprice.my/food-supplements/']//span[text()='Food Supplements']
# ${VN_header_categories_gifts_link}  //div[@id='menu']//a[@href='https://iprice.my/gifts/']//span[text()='Gifts']
# ${VN_header_categories_gym_link}  //div[@id='menu']//a[@href='https://iprice.my/gym/']//span[text()='Gym']
# ${VN_header_categories_hair_care_link}  //div[@id='menu']//a[@href='https://iprice.my/hair-care/']//span[text()='Hair Care']
# ${VN_header_categories_health_link}  //div[@id='menu']//a[@href='https://iprice.my/health/']//span[text()='Health']
# ${VN_header_categories_kids_clothing_link}  //div[@id='menu']//a[@href='https://iprice.my/kids-clothing/']//span[text()='Kids Clothing']
# ${VN_header_categories_makeup_link}  //div[@id='menu']//a[@href='https://iprice.my/makeup/']//span[text()='Makeup']
# ${VN_header_categories_maternity_care_link}  //div[@id='menu']//a[@href='https://iprice.my/maternity-care/']//span[text()='Maternity Care']
# ${VN_header_categories_medical_supplies_link}  //div[@id='menu']//a[@href='https://iprice.my/medical-supplies/']//span[text()='Medical Supplies']
# ${VN_header_categories_nursery_link}  //div[@id='menu']//a[@href='https://iprice.my/nursery/']//span[text()='Nursery']
# ${VN_header_categories_perfeum_link}  //div[@id='menu']//a[@href='https://iprice.my/perfume/']//span[text()='Perfume']
# ${VN_header_categories_racquet_sports_link}  //div[@id='menu']//a[@href='https://iprice.my/racquet-sports/']//span[text()='Racquet Sports']
# ${VN_header_categories_shaving_supplies_link}  //div[@id='menu']//a[@href='https://iprice.my/shaving-supplies/']//span[text()='Shaving Supplies']
# ${VN_header_categories_skin_care_link}  //div[@id='menu']//a[@href='https://iprice.my/skin-care/']//span[text()='Skin Care']
# ${VN_header_categories_supplements_link}  //div[@id='menu']//a[@href='https://iprice.my/supplements/']//span[text()='Supplements']
# ${VN_header_categories_team_sports_link}  //div[@id='menu']//a[@href='https://iprice.my/team-sports/']//span[text()='Team Sports']
# ${VN_header_categories_toys_link}  //div[@id='menu']//a[@href='https://iprice.my/toys/']//span[text()='Toys']
# ${VN_header_categories_water_sports_link}  //div[@id='menu']//a[@href='https://iprice.my/water-sports/']//span[text()='Water Sports']
# ${VN_header_categories_ear_care_link}  //div[@id='menu']//a[@href='https://iprice.my/ear-care/']//span[text()='Ear Care']
# ${VN_header_categories_bathroom_link}  //div[@id='menu']//a[@href='https://iprice.my/bathroom/']//span[text()='Bathroom']
# ${VN_header_categories_bedroom_link}  //div[@id='menu']//a[@href='https://iprice.my/bedroom/']//span[text()='Bedroom']
# ${VN_header_categories_hallway_entry_link}  //div[@id='menu']//a[@href='https://iprice.my/hallway-entry/']//span[text()='Hallway & Entry']
# ${VN_header_categories_home_decor_link}  //div[@id='menu']//a[@href='https://iprice.my/home-decor/']//span[text()='Home Decor']
# ${VN_header_categories_home_improvement_link}  //div[@id='menu']//a[@href='https://iprice.my/home-improvement/']//span[text()='Home Improvement']
# ${VN_header_categories_home_office_link}  //div[@id='menu']//a[@href='https://iprice.my/home-office/']//span[text()='Home Office']
# ${VN_header_categories_housekeepng_link}  //div[@id='menu']//a[@href='https://iprice.my/housekeeping/']//span[text()='Housekeeping']
# ${VN_header_categories_kitchen_dining_link}  //div[@id='menu']//a[@href='https://iprice.my/kitchen-dining/']//span[text()='Kitchen & Dining']
# ${VN_header_categories_lighting_link}  //div[@id='menu']//a[@href='https://iprice.my/lighting/']//span[text()='Lighting']
# ${VN_header_categories_living_room_link}  //div[@id='menu']//a[@href='https://iprice.my/living-room/']//span[text()='Living Room']
# ${VN_header_categories_outdoor_garden_link}  //div[@id='menu']//a[@href='https://iprice.my/outdoor-garden/']//span[text()='Outdoor & Garden']
# ${VN_header_categories_pets_suplies_link}  //div[@id='menu']//a[@href='https://iprice.my/pets-supplies/']//span[text()='Pets Supplies']
# ${VN_header_categories_security_link}  //div[@id='menu']//a[@href='https://iprice.my/security/']//span[text()='Security']
# ${VN_header_categories_stationery_link}  //div[@id='menu']//a[@href='https://iprice.my/stationery/']//span[text()='Stationery']
# ${VN_header_categories_gadgets_link}  //div[@id='menu']//a[@href='https://iprice.my/gadgets/']//span[text()='Gadgets']
# ${VN_header_categories_other_sports_link}  //div[@id='menu']//a[@href='https://iprice.my/other-sports/']//span[text()='Other Sports']
# ${VN_header_categories_upcoming_products_link}  //div[@id='menu']//a[@href='https://iprice.my/upcoming-products/']//span[text()='Upcoming Products']

${VN_product_images}  //img[contains(@class,'lazy product-img')]

${VN_coupon_page_title}    Exclusive Sales, voucher và khuyến mãi tốt nhất tại vào năm 2017 | iPrice Vietnam

*** Keywords ***

Get All Available Links In VN
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

Check All Links Response In VN
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
    \  Create Session  iprice  https://iprice.vn/  disable_warnings=0
    \  Sleep  1
    \  ${link}  Get From List  ${filter_link2}  ${INDEX}
    \  ${link2}  Replace String  ${link}  https://iprice.vn/  ${empty}
    \  ${link3}  Replace String  ${link2}  ${space}  ${empty}
    \  ${resp}  RequestsLibrary.Get Request  iprice  ${link3}
    \  ${status}  Run Keyword And Return Status  Should Be Equal As Strings  ${resp.status_code}  200
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to ${link} failed and not return 200.
    # \  Should Be Equal As Strings  ${resp.status_code}  200
    \  Delete All Sessions

SEO Check Internal Link In VN
    ${internal_links}   Create List
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link1_count}
    \  ${link}  Get From List  ${filter_link1}  ${INDEX}
    \  ${match}  Get Regexp Matches  ${link}  iprice.vn
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
    ${match}  Get Matching Xpath Count  ${VN_product_images}
    Run Keyword If  "${match}"!="${imageCount}"  Run Keyword And Continue On Failure  Fail  Images count wrong.
    :FOR  ${INDEX}  IN RANGE  1  ${imageCount}
    \  ${altImages}  Get Element Attribute  xpath=(${VN_product_images})[${INDEX}]@alt
    \  Run Keyword If  "${altImages}"=="None"  Run Keyword And Continue On Failure  Fail  Image does not contains alt.

Access iPrice VN Homepage
    Go To    ${VN_homeURL}
    Sleep    1
    Title Should Be    ${VN_homeTitle}

iPrice VN Homepage Landing
    Title Should Be    ${VN_homeTitle}
    Wait Until Element Is Visible    ${VN_header_logo_link}
    Wait Until Element Is Visible    ${VN_header_search_input}
    Wait Until Element Is Visible    ${VN_header_popular_searches_text}
    Wait Until Element Is Visible    ${VN_header_coupon_logo_link}
    Wait Until Element Is Visible    ${VN_header_coupon_text}

iPrice VN Homepage Categories Landing
    ${match}  Get Matching Xpath Count  //div[@id='menu']//li[@class='cursor-pointer list-item']//span
    Run Keyword If  ${match}!=59  Run Keyword And Continue On Failure  Fail  Main categories count incorrect.
    Wait Until Element Is Visible    ${VN_header_categories_clothing_link}
    Wait Until Element Is Visible    ${VN_header_categories_shoes_link}
    Wait Until Element Is Visible    ${VN_header_categories_bags_link}
    Wait Until Element Is Visible    ${VN_header_categories_watches_link}
    Wait Until Element Is Visible    ${VN_header_categories_jewellery_link}
    Wait Until Element Is Visible    ${VN_header_categories_computing_link}
    Wait Until Element Is Visible    ${VN_header_categories_phones_tablets_link}
    Wait Until Element Is Visible    ${VN_header_categories_gaming_link}
    Wait Until Element Is Visible    ${VN_header_categories_camera_photo_link}
    Wait Until Element Is Visible    ${VN_header_categories_tv_video_dvd_link}
    Wait Until Element Is Visible    ${VN_header_categories_appliances_link}
    Wait Until Element Is Visible    ${VN_header_categories_automotive_link}
    Mouse Over    ${VN_header_categories_clothing_link}
    Wait Until Element Is Visible    ${VN_header_categories_clothing_men}
    Wait Until Element Is Visible    ${VN_header_categories_clothing_women}
    Mouse Over    ${VN_header_categories_shoes_link}
    Wait Until Element Is Visible    ${VN_header_categories_shoes_men}
    Wait Until Element Is Visible    ${VN_header_categories_shoes_women}

iPrice VN Access Header Link
    Click Element    ${VN_header_logo_link}
    Sleep    1
    iPrice VN Homepage Landing

iPrice VN Search In Header    [Arguments]    ${itemNames}
    Input Text    ${VN_header_search_input}    ${itemNames}
    Click Element    ${VN_header_search_icon}
    Sleep    1

iPrice VN Search Page Landing    [Arguments]    ${itemNames}
    Title Should Be    Tìm kiếm | iprice Việt Nam
    Wait Until Element Is Visible    //div[@id='products-header']//h1[text()='${itemNames}']

iPrice VN Access Coupons Link
    Click Element    ${VN_header_coupon_logo_link}
    Sleep    1
    iPrice VN Coupons Page Landing

iPrice VN Coupons Page Landing
    Title Should Be    ${VN_coupon_page_title}