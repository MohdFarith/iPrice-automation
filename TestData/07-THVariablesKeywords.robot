*** Settings ***
Documentation    This file will only store variables and keywords for TH.

*** Variables ***

${TH_homeURL}  https://ipricethailand.com/
${TH_homeTitle}  ipriceThailand - ค้นหา เช็กราคา ที่เดียวครบสุดคุ้ม
${TH_header_logo_link}  //div[@id='logo']//a[@href='https://ipricethailand.com/']
${TH_header_search_input}  //div[@id='search']//input[@placeholder='ค้นหาสินค้า,คูปองหรือแบรนด์...']
${TH_header_search_icon}  //div[@id='search']//i[@class='icon icon-search-blue']
${TH_header_popular_searches_text}  //div[@id='popular-searches']//li[normalize-space(text())='\u200bคำค้นหายอดนิยม:']
${TH_header_coupon_logo_link}  //div[@id='news-button']//a[@href='https://ipricethailand.com/coupons/']
${TH_header_coupon_text}  //div[@id='news-button']//*[(contains(text(),'คูปอง &') and (normalize-space(text()='ข้อเสนอ')))]
${TH_header_categories_clothing_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/เครองแตงกาย/']//span[text()='เครื่องแต่งกาย']
${TH_header_categories_clothing_men}  //div[@id='menu']//a[contains(@href,'https://ipricethailand.com/เครองแตงกาย/ผชาย/') and text()='ผู้ชาย']
${TH_header_categories_clothing_women}  //div[@id='menu']//a[contains(@href,'https://ipricethailand.com/เครองแตงกาย/ผหญง/') and text()='ผู้หญิง']
${TH_header_categories_shoes_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/รองเทา/']//span[text()='รองเท้า']
${TH_header_categories_shoes_men}  //div[@id='menu']//a[contains(@href,'https://ipricethailand.com/รองเทา/ผชาย/') and text()='ผู้ชาย']
${TH_header_categories_shoes_women}  //div[@id='menu']//a[contains(@href,'https://ipricethailand.com/รองเทา/ผหญง/') and text()='ผู้หญิง']
${TH_header_categories_bags_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/กระเปา/']//span[text()='กระเป๋า']
${TH_header_categories_watches_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/นาฬกาขอมอ/']//span[text()='นาฬิกาข้อมือ']
${TH_header_categories_jewellery_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/เครองประดบ/']//span[text()='เครื่องประดับ']
${TH_header_categories_computing_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/อปกรณคอมพวเตอร/']//span[text()='อุปกรณ์คอมพิวเตอร์']
${TH_header_categories_phones_tablets_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/โทรศพทและแทบเลต/']//span[text()='โทรศัพท์และแท็บเล็ต']
${TH_header_categories_gaming_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/เครองเลนเกมส/']//span[text()='เครื่องเล่นเกมส์']
${TH_header_categories_camera_photo_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/กลองถายรปและรปภาพ/']//span[text()='กล้องถ่ายรูปและรูปภาพ']
${TH_header_categories_tv_video_dvd_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/ทว-วดโอ-และดวด/']//span[text()='ทีวี วีดีโอ และดีวีดี']
${TH_header_categories_appliances_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/เครองใชไฟฟา/']//span[text()='เครื่องใช้ไฟฟ้า']
${TH_header_categories_automotive_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/ยานยนต/']//span[text()='ยานยนต']
${TH_header_categories_hobbies_link}  //div[@id='menu']//a[@href='href="https://ipricethailand.com/งานอดเรก/"']//span[text()='งานอดิเรก']
${TH_header_categories_audio_hifi_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/เครองเสยงและ-hi-fi/']//span[text()='เครื่องเสียงและ Hi Fi']
${TH_header_categories_action_sport_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/กฬาเอกซตรม/']//span[text()='กีฬาเอ็กซ์ตรีม']
${TH_header_categories_adventure_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/การผจญภย/']//span[text()='การผจญภัย']
${TH_header_categories_baby_clothing_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/เครองแตงกายสำหรบเดกทารก/']//span[text()='เครื่องแต่งกายสำหรับเด็กทารก']
${TH_header_categories_baby_gear_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/อปกรณการเดนทางสำหรบเดก/']//span[text()='อุปกรณ์การเดินทางสำหรับเด็ก']
${TH_header_categories_bath_body_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/ผลตภณฑดแลและทำความสะอาดผวกาย/']//span[text()='ผลิตภัณฑ์ดูแลและทำความสะอาดผิวกาย']
${TH_header_categories_dental_care_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/ผลตภณฑดแลชองปาก/']//span[text()='ผลิตภัณฑ์ดูแลช่องปาก']
${TH_header_categories_diapering_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/อปกรณสำหรบการเปลยนผาออม/']//span[text()='อุปกรณ์สำหรับการเปลี่ยนผ้าอ้อม']
${TH_header_categories_eyecare_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/ผลตภณฑสำหรบดวงตา/']//span[text()='ผลิตภัณฑ์สำหรับดวงตา']
${TH_header_categories_feeding_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/อาหาร-นมและอปกรณอนๆ/']//span[text()='อาหาร นมและอุปกรณ์อื่นๆ']
${TH_header_categories_food_supplements_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/อาหารเสรมสำหรบออกกำลงกาย/']//span[text()='อาหารเสริมสำหรับออกกำลังกาย']
${TH_header_categories_gifts_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/ของขวญ/']//span[text()='ของขวัญ']
${TH_header_categories_gym_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/ฟตเนส/']//span[text()='ฟิตเนส']
${TH_header_categories_hair_care_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/ผลตภณฑดแลเสนผม/']//span[text()='ผลิตภัณฑ์ดูแลเส้นผม']
${TH_header_categories_health_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/สขภาพ/']//span[text()='สุขภาพ']
${TH_header_categories_kids_clothing_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/เครองแตงกายสำหรบเดกทารก/']//span[text()='เครื่องแต่งกายสำหรับเด็ก']
${TH_header_categories_makeup_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/เครองสำอาง/']//span[text()='เครื่องสำอาง']
${TH_header_categories_maternity_care_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/ผลตภณฑสำหรบคณแม/']//span[text()='ผลิตภัณฑ์สำหรับคุณแม']
${TH_header_categories_medical_supplies_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/ผลตภณฑสำหรบคณแม/']//span[text()='เวชภัณฑ์']
${TH_header_categories_nursery_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/ผลตภณฑสำหรบคณแม/']//span[text()='เนอสเซอรี่']
${TH_header_categories_perfeum_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/นำหอม/']//span[text()='น้ำหอม']
${TH_header_categories_racquet_sports_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/กฬาประเภทแรกเกต/']//span[text()='กีฬาประเภทแร็กเกต']
${TH_header_categories_shaving_supplies_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/ผลตภณฑกำจดขน/']//span[text()='ผลิตภัณฑ์กำจัดขน']
${TH_header_categories_skin_care_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/ผลตภณฑดแลผว/']//span[text()='ผลิตภัณฑ์ดูแลผิว']
${TH_header_categories_supplements_link}  //div[@id='menu']//a[@href='href="https://ipricethailand.com/อาหารเสรม/"']//span[text()='อาหารเสริม']
${TH_header_categories_team_sports_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/กฬาประเภททม/']//span[text()='กีฬาประเภททีม']
${TH_header_categories_toys_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/ของเลน/']//span[text()='ของเล่น']
${TH_header_categories_water_sports_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/กฬาทางนำ/']//span[text()='กีฬาทางน้ำ']
${TH_header_categories_ear_care_link}  //div[@id='menu']//a[@href='https://ipricethailand.com/ผลตภณฑดแลสขภาพห/']//span[text()='ผลิตภัณฑ์ดูแลสุขภาพห']
${TH_header_categories_bathroom_link}  //div[@id='menu']//a[@href='https://iprice.sg/bathroom/']//span[text()='Bathroom']
${TH_header_categories_bedroom_link}  //div[@id='menu']//a[@href='https://iprice.sg/bedroom/']//span[text()='Bedroom']
${TH_header_categories_hallway_entry_link}  //div[@id='menu']//a[@href='https://iprice.sg/hallway-entry/']//span[text()='Hallway & Entry']
${TH_header_categories_home_decor_link}  //div[@id='menu']//a[@href='https://iprice.sg/home-decor/']//span[text()='Home Decor']
${TH_header_categories_home_improvement_link}  //div[@id='menu']//a[@href='https://iprice.sg/home-improvement/']//span[text()='Home Improvement']
${TH_header_categories_home_office_link}  //div[@id='menu']//a[@href='https://iprice.sg/home-office/']//span[text()='Home Office']
${TH_header_categories_housekeepng_link}  //div[@id='menu']//a[@href='https://iprice.sg/housekeeping/']//span[text()='Housekeeping']
${TH_header_categories_kitchen_dining_link}  //div[@id='menu']//a[@href='https://iprice.sg/kitchen-dining/']//span[text()='Kitchen & Dining']
${TH_header_categories_lighting_link}  //div[@id='menu']//a[@href='https://iprice.sg/lighting/']//span[text()='Lighting']
${TH_header_categories_living_room_link}  //div[@id='menu']//a[@href='https://iprice.sg/living-room/']//span[text()='Living Room']
${TH_header_categories_outdoor_garden_link}  //div[@id='menu']//a[@href='https://iprice.sg/outdoor-garden/']//span[text()='Outdoor & Garden']
${TH_header_categories_pets_suplies_link}  //div[@id='menu']//a[@href='https://iprice.sg/pets-supplies/']//span[text()='Pets Supplies']
${TH_header_categories_security_link}  //div[@id='menu']//a[@href='https://iprice.sg/security/']//span[text()='Security']
${TH_header_categories_stationery_link}  //div[@id='menu']//a[@href='https://iprice.sg/stationery/']//span[text()='Stationery']
${TH_header_categories_gadgets_link}  //div[@id='menu']//a[@href='https://iprice.sg/gadgets/']//span[text()='Gadgets']
${TH_header_categories_other_sports_link}  //div[@id='menu']//a[@href='https://iprice.sg/other-sports/']//span[text()='Other Sports']
${TH_header_categories_upcoming_products_link}  //div[@id='menu']//a[@href='https://iprice.sg/upcoming-products/']//span[text()='Upcoming Products']

${TH_product_images}  //img[contains(@class,'lazy product-img')]

${TH_coupon_page_title}  แจก ดีล คูปอง รหัสส่วนลด บัตรส่วนลด โปรโมชั่น  ที่ iprice ประเทศไทย

*** Keywords ***

Get All Available Links In TH
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

Check All Links Response In TH
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link1_count}
    \  ${link}  Get From List  ${filter_link1}  ${INDEX}
    \  ${status}  Run Keyword And Return Status   HttpLibrary.HTTP.Get  ${link}
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to ${link} failed and not return 200.
    Run Keyword If  ${filter_link2_count}>0  Check On 3rd Part Site

Check On 3rd Part Site
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link2_count}
    \  Create Session  iprice  https://ipricethailand.com/  disable_warnings=0
    \  Sleep  1
    \  ${link}  Get From List  ${filter_link2}  ${INDEX}
    \  ${link2}  Replace String  ${link}  https://ipricethailand.com/  ${empty}
    \  ${link3}  Replace String  ${link2}  ${space}  ${empty}
    \  ${resp}  RequestsLibrary.Get Request  iprice  ${link3}
    \  ${status}  Run Keyword And Return Status  Should Be Equal As Strings  ${resp.status_code}  200
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to ${link} failed and not return 200.
    \  Delete All Sessions

SEO Check Internal Link In TH
    ${internal_links}  Create List
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link1_count}
    \  ${link}  Get From List  ${filter_link1}  ${INDEX}
    \  ${match}  Get Regexp Matches  ${link}  ipricethailand.com
    \  ${matchCount}  Get Length  ${match}
    \  Run Keyword If  ${matchCount}>0  Append To List  ${internal_links}  ${link}
    ${internal_links_count}  Get Length  ${internal_links}

    ${internal_links2}  Create List
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
    ${match}  Get Matching Xpath Count  ${TH_product_images}
    Run Keyword If  "${match}"!="${imageCount}"  Run Keyword And Continue On Failure  Fail  Images count wrong.
    :FOR  ${INDEX}  IN RANGE  1  ${imageCount}
    \  ${altImages}  Get Element Attribute  xpath=(${TH_product_images})[${INDEX}]@alt
    \  Run Keyword If  "${altImages}"=="None"  Run Keyword And Continue On Failure  Fail  Image does not contains alt.

Access iPrice TH Homepage
    Go To  ${TH_homeURL}
    Sleep  1
    iPrice TH Homepage Landing

iPrice TH Homepage Landing
    Title Should Be  ${TH_homeTitle}
    Wait Until Element Is Visible  ${TH_header_logo_link}
    Wait Until Element Is Visible  ${TH_header_search_input}
    Run Keyword And Continue On Failure  Wait Until Element Is Visible  ${TH_header_popular_searches_text}
    Wait Until Element Is Visible  ${TH_header_coupon_logo_link}
    Wait Until Element Is Visible  ${TH_header_coupon_text}

iPrice TH Homepage Categories Landing
    ${match}  Get Matching Xpath Count  //div[@id='menu']//li[@class='cursor-pointer list-item']//span
    Run Keyword If  ${match}!=59  Run Keyword And Continue On Failure  Fail  Main categories count incorrect.
    Wait Until Element Is Visible  ${TH_header_categories_clothing_link}
    Wait Until Element Is Visible  ${TH_header_categories_shoes_link}
    Wait Until Element Is Visible  ${TH_header_categories_bags_link}
    Wait Until Element Is Visible  ${TH_header_categories_watches_link}
    Wait Until Element Is Visible  ${TH_header_categories_jewellery_link}
    Wait Until Element Is Visible  ${TH_header_categories_computing_link}
    Wait Until Element Is Visible  ${TH_header_categories_phones_tablets_link}
    Wait Until Element Is Visible  ${TH_header_categories_gaming_link}
    Wait Until Element Is Visible  ${TH_header_categories_camera_photo_link}
    Wait Until Element Is Visible  ${TH_header_categories_tv_video_dvd_link}
    # Wait Until Element Is Visible  ${TH_header_categories_appliances_link}
    # Wait Until Element Is Visible  ${TH_header_categories_automotive_link}
    Mouse Over  ${TH_header_categories_clothing_link}
    Wait Until Element Is Visible  ${TH_header_categories_clothing_men}
    Wait Until Element Is Visible  ${TH_header_categories_clothing_women}
    Mouse Over  ${TH_header_categories_shoes_link}
    Wait Until Element Is Visible  ${TH_header_categories_shoes_men}
    Wait Until Element Is Visible  ${TH_header_categories_shoes_women}

iPrice TH Access Header Link
    Click Element  ${TH_header_logo_link}
    Sleep  1
    iPrice TH Homepage Landing

iPrice TH Search In Header  [Arguments]  ${itemNames}
    Input Text  ${TH_header_search_input}  ${itemNames}
    Click Element  ${TH_header_search_icon}
    Sleep    1

iPrice TH Search Page Landing  [Arguments]  ${itemNames}
    Title Should Be  ค้นหา | iprice ประเทศไทย
    Wait Until Element Is Visible  //div[@id='products-header']//h1[text()='${itemNames}']

iPrice TH Access Coupons Link
    Click Element  ${TH_header_coupon_logo_link}
    Sleep  1
    iPrice TH Coupons Page Landing

iPrice TH Coupons Page Landing
    Title Should Be  ${TH_coupon_page_title}
