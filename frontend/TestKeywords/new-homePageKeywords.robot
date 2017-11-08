*** Settings ***
Documentation  This file will only store keywords for SEO.
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
    Run Keyword If  "${country}"=="MY"  Run Keyword And Continue On Failure  Title Should Be  ${MY_homeTitle}
    ...  ELSE IF  "${country}"=="VN"  Run Keyword And Continue On Failure  Title Should Be  ${VN_homeTitle}
    ...  ELSE IF  "${country}"=="ID"  Run Keyword And Continue On Failure  Title Should Be  ${ID_homeTitle}
    ...  ELSE IF  "${country}"=="SG"  Run Keyword And Continue On Failure  Title Should Be  ${SG_homeTitle}
    ...  ELSE IF  "${country}"=="PH"  Run Keyword And Continue On Failure  Title Should Be  ${PH_homeTitle}
    ...  ELSE IF  "${country}"=="HK"  Run Keyword And Continue On Failure  Title Should Be  ${HK_homeTitle}
    ...  ELSE IF  "${country}"=="TH"  Run Keyword And Continue On Failure  Title Should Be  ${TH_homeTitle}

Get All Available Links In Homepage
    ${AllLinksCount}  Get Matching Xpath Count  //a
    ${LinkItems}  Create List
    Set Suite Variable  ${LinkItems}

    :FOR  ${INDEX}  IN RANGE  1  ${AllLinksCount}
    \  ${href}  Selenium2Library.Get Element Attribute  xpath=(//a)[${INDEX}]@href
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
    Log  ${filter_link1}
    Log  ${filter_link2}

Check All Links Response In Homepage  [Arguments]  ${country}
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link1_count}
    \  ${link}  Get From List  ${filter_link1}  ${INDEX}
    \  ${status}  Run Keyword And Return Status   HttpLibrary.HTTP.Get  ${link}
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to ${link} failed and not return 200.
    Run Keyword If  ${filter_link2_count}>0  Check Redirection URL  ${country}

Check Redirection URL  [Arguments]  ${country}
    Sleep  2
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link2_count}
    \  Run Keyword If  "${country}"=="MY"  Create Session  iprice  ${MY_homeURL}  disable_warnings=0
    \  ...  ELSE IF  "${country}"=="VN"  Create Session  iprice  ${VN_homeURL}  disable_warnings=0
    \  ...  ELSE IF  "${country}"=="ID"  Create Session  iprice  ${ID_homeURL}  disable_warnings=0
    \  ...  ELSE IF  "${country}"=="SG"  Create Session  iprice  ${SG_homeURL}  disable_warnings=0
    \  ...  ELSE IF  "${country}"=="PH"  Create Session  iprice  ${PH_homeURL}  disable_warnings=0
    \  ...  ELSE IF  "${country}"=="HK"  Create Session  iprice  ${HK_homeURL}  disable_warnings=0
    \  ...  ELSE IF  "${country}"=="TH"  Create Session  iprice  ${TH_homeURL}  disable_warnings=0
    \  Sleep  1
    \  ${link}  Get From List  ${filter_link2}  ${INDEX}
    \  ${link2}  Run Keyword If  "${country}"=="MY"  Replace String  ${link}  ${MY_homeURL}  ${empty}
    \  ...  ELSE IF  "${country}"=="VN"  Replace String  ${link}  ${VN_homeURL}  ${empty}
    \  ...  ELSE IF  "${country}"=="ID"  Replace String  ${link}  ${ID_homeURL}  ${empty}
    \  ...  ELSE IF  "${country}"=="SG"  Replace String  ${link}  ${SG_homeURL}  ${empty}
    \  ...  ELSE IF  "${country}"=="PH"  Replace String  ${link}  ${PH_homeURL}  ${empty}
    \  ...  ELSE IF  "${country}"=="HK"  Replace String  ${link}  ${HK_homeURL}  ${empty}
    \  ...  ELSE IF  "${country}"=="TH"  Replace String  ${link}  ${TH_homeURL}  ${empty}
    \  ${link3}  Replace String  ${link2}  ${space}  ${empty}
    \  ${link4}  Replace String  ${link3}  %3Fnocache%3D1  ${empty}
    \  ${link5}  Replace String  ${link4}  ${space}  ${empty}
    \  ${resp}  RequestsLibrary.Get Request  iprice  ${link5}  allow_redirects=True
    \  ${status}  Run Keyword And Return Status  Should Be Equal As Strings  ${resp.status_code}  200
    \  Run Keyword If  "${status}"=="False" and "${country}"=="MY"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.my/${link5} failed and not return 200.
    \  ...  ELSE IF  "${status}"=="False" and "${country}"=="VN"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.vn/${link5} failed and not return 200.
    \  ...  ELSE IF  "${status}"=="False" and "${country}"=="ID"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.co.id/${link5} failed and not return 200.
    \  ...  ELSE IF  "${status}"=="False" and "${country}"=="SG"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.sg/${link5} failed and not return 200.
    \  ...  ELSE IF  "${status}"=="False" and "${country}"=="PH"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.ph/${link5} failed and not return 200.
    \  ...  ELSE IF  "${status}"=="False" and "${country}"=="HK"  Run Keyword And Continue On Failure  Fail  Request to https://iprice.hk/${link5} failed and not return 200.
    \  ...  ELSE IF  "${status}"=="False" and "${country}"=="TH"  Run Keyword And Continue On Failure  Fail  Request to https://ipricethailand.com/${link5} failed and not return 200.
    \  Delete All Sessions

iPrice Homepage Courtesy Validation  [Arguments]  ${country}
    Run Keyword If  "${country}"=="MY"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_courtesy_products}
    ...  ELSE IF  "${country}"=="VN"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_courtesy_products}
    ...  ELSE IF  "${country}"=="ID"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_courtesy_products}
    ...  ELSE IF  "${country}"=="SG"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_courtesy_products}
    ...  ELSE IF  "${country}"=="PH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_courtesy_products}
    ...  ELSE IF  "${country}"=="HK"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_courtesy_products}
    ...  ELSE IF  "${country}"=="TH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_courtesy_products}
    Run Keyword If  "${country}"=="MY"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_courtesy_products_highlight}
    ...  ELSE IF  "${country}"=="VN"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_courtesy_products_highlight}
    ...  ELSE IF  "${country}"=="ID"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_courtesy_products_highlight}
    ...  ELSE IF  "${country}"=="SG"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_courtesy_products_highlight}
    ...  ELSE IF  "${country}"=="PH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_courtesy_products_highlight}
    ...  ELSE IF  "${country}"=="HK"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_courtesy_products_highlight}
    ...  ELSE IF  "${country}"=="TH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_courtesy_products_highlight}
    Run Keyword If  "${country}"=="MY"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_courtesy_coupons}
    ...  ELSE IF  "${country}"=="VN"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_courtesy_coupons}
    ...  ELSE IF  "${country}"=="ID"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_courtesy_coupons}
    ...  ELSE IF  "${country}"=="SG"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_courtesy_coupons}
    ...  ELSE IF  "${country}"=="PH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_courtesy_coupons}
    ...  ELSE IF  "${country}"=="HK"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_courtesy_coupons}
    ...  ELSE IF  "${country}"=="TH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_courtesy_coupons}
    Run Keyword If  "${country}"=="MY"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_courtesy_coupons_highlight}
    ...  ELSE IF  "${country}"=="VN"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${VN_courtesy_couponss_highlight}
    ...  ELSE IF  "${country}"=="ID"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${ID_courtesy_coupons_highlight}
    ...  ELSE IF  "${country}"=="SG"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${SG_courtesy_coupons_highlight}
    ...  ELSE IF  "${country}"=="PH"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${PH_courtesy_coupons_highlight}
    ...  ELSE IF  "${country}"=="HK"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${HK_courtesy_coupons_highlight}
    ...  ELSE IF  "${country}"=="TH"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${TH_courtesy_coupons_highlight}
    Run Keyword If  "${country}"=="MY"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_courtesy_trends}
    ...  ELSE IF  "${country}"=="VN"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_courtesy_trends}
    ...  ELSE IF  "${country}"=="ID"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_courtesy_trends}
    ...  ELSE IF  "${country}"=="SG"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_courtesy_trends}
    ...  ELSE IF  "${country}"=="PH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_courtesy_trends}
    ...  ELSE IF  "${country}"=="HK"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_courtesy_trends}
    ...  ELSE IF  "${country}"=="TH"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_courtesy_trends}
        Run Keyword If  "${country}"=="MY"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_courtesy_trends_highlight}
    ...  ELSE IF  "${country}"=="VN"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${VN_courtesy_trends_highlight}
    ...  ELSE IF  "${country}"=="ID"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${ID_courtesy_trends_highlight}
    ...  ELSE IF  "${country}"=="SG"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${SG_courtesy_trends_highlight}
    ...  ELSE IF  "${country}"=="PH"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${PH_courtesy_trends_highlight}
    ...  ELSE IF  "${country}"=="HK"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${HK_courtesy_trends_highlight}
    ...  ELSE IF  "${country}"=="TH"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${TH_courtesy_trends_highlight}

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

iPrice Products Mega Menu Validation  [Arguments]  ${country}
    Element Should Be Visible  ${products_mega_menu_electronics_icon}
    Element Should Be Visible  ${products_mega_menu_fashion_icon}
    Element Should Be Visible  ${products_mega_menu_sports_outdoors_icon}
    Element Should Be Visible  ${products_mega_menu_home_living_icon}
    Element Should Be Visible  ${products_mega_menu_kid_toys_icon}
    Element Should Be Visible  ${products_mega_menu_health_beauty_icon}
    Element Should Be Visible  ${products_mega_menu_automotive_icon}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Element Should Be Visible  ${EN_products_mega_menu_electronics}
    ...  ELSE IF  "${country}"=="VN"  Element Should Be Visible  ${VN_products_mega_menu_electronics}
    ...  ELSE IF  "${country}"=="ID"  Element Should Be Visible  ${ID_products_mega_menu_electronics}
    ...  ELSE IF  "${country}"=="TH"  Element Should Be Visible  ${TH_products_mega_menu_electronics}
    Run Keyword If  "${country}"=="MY" or "${country}"=="SG" or "${country}"=="PH" or "${country}"=="HK"  Element Should Be Visible  ${EN_products_mega_menu_fashion}
    ...  ELSE IF  "${country}"=="VN"  Element Should Be Visible  ${VN_products_mega_menu_fashion}
    ...  ELSE IF  "${country}"=="ID"  Element Should Be Visible  ${ID_products_mega_menu_fashion}
    ...  ELSE IF  "${country}"=="TH"  Element Should Be Visible  ${TH_products_mega_menu_fashion}

SEO Check Internal Link  [Arguments]  ${country}
    ${internal_links}  Create List
    :FOR  ${INDEX}  IN RANGE  0  ${filter_link1_count}
    \  ${link}  Get From List  ${filter_link1}  ${INDEX}
    \  ${match}  Run Keyword If  "${country}"=="MY"  Get Regexp Matches  ${link}  iprice.my
    \   ...  ELSE IF  "${country}"=="VN"  Get Regexp Matches  ${link}  iprice.vn
    \  ...  ELSE IF  "${country}"=="ID"  Get Regexp Matches  ${link}  iprice.co.id
    \  ...  ELSE IF  "${country}"=="SG"  Get Regexp Matches  ${link}  iprice.sg
    \  ...  ELSE IF  "${country}"=="PH"  Get Regexp Matches  ${link}  iprice.ph
    \  ...  ELSE IF  "${country}"=="HK"  Get Regexp Matches  ${link}  iprice.hk
    \  ...  ELSE IF  "${country}"=="TH"  Get Regexp Matches  ${link}  ipricethailand.com
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

SEO Check Images ALT  [Arguments]  ${imageCount}
    ${match}  Get Matching Xpath Count  ${homepage_bottom_product_images}
    Run Keyword If  "${match}"!="${imageCount}"  Run Keyword And Continue On Failure  Fail  Images count wrong.
    :FOR  ${INDEX}  IN RANGE  1  ${imageCount}
    \  ${altImages}  Get Element Attribute  xpath=(${homepage_bottom_product_images})[${INDEX}]@alt
    \  Run Keyword If  "${altImages}"=="None"  Run Keyword And Continue On Failure  Fail  Image does not contains alt.
