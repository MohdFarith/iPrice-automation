*** Settings ***
Documentation  This file will only store keywords for email subscription.
*** Variables ***

*** Keywords ***

iPrice Footer Email Subscription Validation  [Arguments]  ${country}
    Mouse Over  ${footer_email_subscription_logo}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Element Should Be Visible  ${EN_footer_email_subscription_header}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_footer_email_subscription_header}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_footer_email_subscription_header}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_footer_email_subscription_header}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Element Should Be Visible  ${EN_footer_email_subscription_input_placholder}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_footer_email_subscription_input_placholder}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_footer_email_subscription_input_placholder}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_footer_email_subscription_input_placholder}
    Run Keyword If  "${country}"=="my" or "${country}"=="sg" or "${country}"=="ph" or "${country}"=="hk"  Element Should Be Visible  ${EN_footer_email_subscription_sign_up_button}
    ...  ELSE IF  "${country}"=="vn"  Element Should Be Visible  ${VN_footer_email_subscription_sign_up_button}
    ...  ELSE IF  "${country}"=="id"  Element Should Be Visible  ${ID_footer_email_subscription_sign_up_button}
    ...  ELSE IF  "${country}"=="th"  Element Should Be Visible  ${TH_footer_email_subscription_sign_up_button}
