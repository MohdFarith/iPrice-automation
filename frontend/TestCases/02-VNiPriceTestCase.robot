*** Setting ***
Documentation   A test suite with various tests for iPrice VN.

#Import
Resource    ../TestSettings/TestSettings.robot
Resource    ../TestVariables/02-VNTestVariables.robot
Resource    ../TestKeywords/02-VNTestKeywords.robot

#Setup/Tear Down
Test Setup    TestCase Setup    ${browser}
Test Teardown    Close Browser

*** Test Cases ***

Test URL VN
    [tags]  url_test
    Access iPrice VN Homepage
    Get All Available Links in VN
    Check All Links Response In VN

Test SEO Check Homepage In VN
    [tags]  seo
    Access iPrice VN Homepage
    iPrice VN Header Section Validation
    Get All Available Links In VN
    SEO Check Internal Link In VN
    SEO Check Images ALT  6
    iPrice VN Access Coupons Link
    iPrice VN Header Section Validation
    iPrice VN Coupons Page Landing
    iPrice VN Coupons Access All Store
    iPrice VN Coupons Store Access A Store  Lazada

TestCase One VN
    [tags]    test    1_case
    Access iPrice VN Homepage
    iPrice VN Header Section Validation
    iPrice VN Access Header Logo Link
    iPrice VN Do A Search In Header  iphone 3gs
    iPrice VN Access Header Logo Link
    iPrice VN Do A Search In Header  dell
    iPrice VN Access Header Logo Link
    iPrice VN Header Section Validation
