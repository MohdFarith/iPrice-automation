*** Settings ***
Documentation  This file will only store keywords for coupons.
*** Variables ***

*** Keywords ***

Access Coupons Page  [Arguments]  ${country}
    Run Keyword If  "${country}"=="my"  Go To  ${MY_homeURL}coupons
    ...  ELSE IF  "${country}"=="vn"  Go To  ${VN_homeURL}coupons
    ...  ELSE IF  "${country}"=="id"  Go To  ${id_homeURL}coupons
    ...  ELSE IF  "${country}"=="th"  Go To  ${th_homeURL}coupons
    ...  ELSE IF  "${country}"=="sg"  Go To  ${sg_homeURL}coupons
    ...  ELSE IF  "${country}"=="hk"  Go To  ${hk_homeURL}coupons
    ...  ELSE IF  "${country}"=="ph"  Go To  ${ph_homeURL}coupons

Access Coupon Page From Courtesy  [Arguments]  ${country}
    Run Keyword If  "${country}"=="my"  Click Element  ${MY_courtesy_coupons}
    ...  ELSE IF  "${country}"=="vn"  Click Element  ${VN_courtesy_coupons}
    ...  ELSE IF  "${country}"=="id"  Click Element  ${id_courtesy_coupons}
    ...  ELSE IF  "${country}"=="th"  Click Element  ${th_courtesy_coupons}
    ...  ELSE IF  "${country}"=="sg"  Click Element  ${sg_courtesy_coupons}
    ...  ELSE IF  "${country}"=="hk"  Click Element  ${hk_courtesy_coupons}
    ...  ELSE IF  "${country}"=="ph"  Click Element  ${ph_courtesy_coupons}
    Run Keyword If  "${country}"=="my"  Location Should Be  ${MY_homeURL}coupons/
    ...  ELSE IF  "${country}"=="vn"  Location Should Be  ${VN_homeURL}coupons/
    ...  ELSE IF  "${country}"=="id"  Location Should Be  ${ID_homeURL}coupons/
    ...  ELSE IF  "${country}"=="th"  Location Should Be  ${TH_homeURL}coupons/
    ...  ELSE IF  "${country}"=="sg"  Location Should Be  ${SG_homeURL}coupons/
    ...  ELSE IF  "${country}"=="hk"  Location Should Be  ${HK_homeURL}coupons/
    ...  ELSE IF  "${country}"=="ph"  Location Should Be  ${PH_homeURL}coupons/
    Run Keyword If  "${country}"=="my"  Title Should Be  ${MY_coupon_page_title}
    ...  ELSE IF  "${country}"=="vn"  Title Should Be  ${VN_coupon_page_title}
    ...  ELSE IF  "${country}"=="id"  Title Should Be  ${ID_coupon_page_title}
    ...  ELSE IF  "${country}"=="th"  Title Should Be  ${TH_coupon_page_title}
    ...  ELSE IF  "${country}"=="sg"  Title Should Be  ${SG_coupon_page_title}
    ...  ELSE IF  "${country}"=="hk"  Title Should Be  ${HK_coupon_page_title}
    ...  ELSE IF  "${country}"=="ph"  Title Should Be  ${PH_coupon_page_title}

iPrice Coupon Page Courtesy Validation  [Arguments]  ${country}
    Run Keyword If  "${country}"=="my"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_courtesy_products}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_courtesy_products}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_courtesy_products}
    ...  ELSE IF  "${country}"=="sg"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_courtesy_products}
    ...  ELSE IF  "${country}"=="ph"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_courtesy_products}
    ...  ELSE IF  "${country}"=="hk"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_courtesy_products}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_courtesy_products}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${EN_courtesy_products_highlight}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${VN_courtesy_products_highlight}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${ID_courtesy_products_highlight}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${TH_courtesy_products_highlight}
    Run Keyword If  "${country}"=="my"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_courtesy_coupons}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_courtesy_coupons}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_courtesy_coupons}
    ...  ELSE IF  "${country}"=="sg"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_courtesy_coupons}
    ...  ELSE IF  "${country}"=="ph"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_courtesy_coupons}
    ...  ELSE IF  "${country}"=="hk"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_courtesy_coupons}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_courtesy_coupons}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Run Keyword And Continue On Failure  Element Should Be Visible  ${EN_courtesy_coupons_highlight}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_courtesy_coupons_highlight}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_courtesy_coupons_highlight}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_courtesy_coupons_highlight}
    Run Keyword If  "${country}"=="my"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_courtesy_trends}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_courtesy_trends}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_courtesy_trends}
    ...  ELSE IF  "${country}"=="sg"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_courtesy_trends}
    ...  ELSE IF  "${country}"=="ph"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_courtesy_trends}
    ...  ELSE IF  "${country}"=="hk"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_courtesy_trends}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_courtesy_trends}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${en_courtesy_trends_highlight}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${VN_courtesy_trends_highlight}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${ID_courtesy_trends_highlight}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${TH_courtesy_trends_highlight}

iPrice Coupons Page Header Validation  [Arguments]  ${country}
    Run Keyword If  "${country}"=="my"  Element Should Be Visible  ${MY_coupons_header_logo_link}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_coupons_header_logo_link}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_coupons_header_logo_link}
    ...  ELSE IF  "${country}"=="sg"  Element Should Be Visible  ${SG_coupons_header_logo_link}
    ...  ELSE IF  "${country}"=="ph"  Element Should Be Visible  ${PH_coupons_header_logo_link}
    ...  ELSE IF  "${country}"=="hk"  Element Should Be Visible  ${HK_coupons_header_logo_link}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_coupons_header_logo_link}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Element Should Be Visible  ${EN_header_search_compare_save}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_header_search_compare_save}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_header_search_compare_save}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_header_search_compare_save}
    Run Keyword If  "${country}"=="my"  Element Should Be Visible  ${MY_header_search_input}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_header_search_input}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_header_search_input}
    ...  ELSE IF  "${country}"=="sg"  Element Should Be Visible  ${SG_header_search_input}
    ...  ELSE IF  "${country}"=="ph"  Element Should Be Visible  ${PH_header_search_input}
    ...  ELSE IF  "${country}"=="hk"  Element Should Be Visible  ${HK_header_search_input}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_header_search_input}
    Element Should Be Visible  ${header_search_icon}

iPrice Coupons Mega Menu Validation  [Arguments]  ${index}  ${categoryName}
    Element Should Be Visible  //div[@id='mega-menu-amp']//li[@tabindex='${index}']//strong[normalize-space(text()='${categoryName}')]

iPrice Coupons Carousel Banner Validation  [Arguments]  ${displayed}
    Run Keyword If  "${displayed}"=="yes"  Run Keyword And Continue On Failure  Element Should Be Visible  ${coupons_banner}
    ...  ELSE IF  "${displayed}"=="no"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${coupons_banner}
