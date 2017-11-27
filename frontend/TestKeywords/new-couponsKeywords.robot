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

iPrice Coupon Page Courtesy Validation  [Arguments]  ${country}
    Run Keyword If  "${country}"=="my"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_courtesy_products}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_courtesy_products}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_courtesy_products}
    ...  ELSE IF  "${country}"=="sg"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_courtesy_products}
    ...  ELSE IF  "${country}"=="ph"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_courtesy_products}
    ...  ELSE IF  "${country}"=="hk"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_courtesy_products}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_courtesy_products}
    Run Keyword If  "${country}"=="my"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_courtesy_products_highlight}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${VN_courtesy_products_highlight}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${ID_courtesy_products_highlight}
    ...  ELSE IF  "${country}"=="sg"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${SG_courtesy_products_highlight}
    ...  ELSE IF  "${country}"=="ph"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${PH_courtesy_products_highlight}
    ...  ELSE IF  "${country}"=="hk"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${HK_courtesy_products_highlight}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${TH_courtesy_products_highlight}
    Run Keyword If  "${country}"=="my"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_courtesy_coupons}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_courtesy_coupons}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_courtesy_coupons}
    ...  ELSE IF  "${country}"=="sg"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_courtesy_coupons}
    ...  ELSE IF  "${country}"=="ph"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_courtesy_coupons}
    ...  ELSE IF  "${country}"=="hk"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_courtesy_coupons}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_courtesy_coupons}
    Run Keyword If  "${country}"=="my"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_courtesy_coupons_highlight}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_courtesy_coupons_highlight}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_courtesy_coupons_highlight}
    ...  ELSE IF  "${country}"=="sg"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_courtesy_coupons_highlight}
    ...  ELSE IF  "${country}"=="ph"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_courtesy_coupons_highlight}
    ...  ELSE IF  "${country}"=="hk"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_courtesy_coupons_highlight}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_courtesy_coupons_highlight}
    Run Keyword If  "${country}"=="my"  Run Keyword And Continue On Failure  Element Should Be Visible  ${MY_courtesy_trends}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Element Should Be Visible  ${VN_courtesy_trends}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Element Should Be Visible  ${ID_courtesy_trends}
    ...  ELSE IF  "${country}"=="sg"  Run Keyword And Continue On Failure  Element Should Be Visible  ${SG_courtesy_trends}
    ...  ELSE IF  "${country}"=="ph"  Run Keyword And Continue On Failure  Element Should Be Visible  ${PH_courtesy_trends}
    ...  ELSE IF  "${country}"=="hk"  Run Keyword And Continue On Failure  Element Should Be Visible  ${HK_courtesy_trends}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Element Should Be Visible  ${TH_courtesy_trends}
    Run Keyword If  "${country}"=="my"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${MY_courtesy_trends_highlight}
    ...  ELSE IF  "${country}"=="vn"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${VN_courtesy_trends_highlight}
    ...  ELSE IF  "${country}"=="id"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${ID_courtesy_trends_highlight}
    ...  ELSE IF  "${country}"=="sg"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${SG_courtesy_trends_highlight}
    ...  ELSE IF  "${country}"=="ph"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${PH_courtesy_trends_highlight}
    ...  ELSE IF  "${country}"=="hk"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${HK_courtesy_trends_highlight}
    ...  ELSE IF  "${country}"=="th"  Run Keyword And Continue On Failure  Element Should Not Be Visible  ${TH_courtesy_trends_highlight}
