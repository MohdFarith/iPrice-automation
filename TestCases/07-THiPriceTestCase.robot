*** Setting ***
Documentation   A test suite with various tests for iPrice TH.

#Import
Resource    ../TestSettings/TestSettings.robot
Resource    ../TestVariables/07-THTestVariables.robot
Resource    ../TestKeywords/07-THTestKeywords.robot

#Setup/Tear Down
Test Setup    TestCase Setup    ${browser}
Test Teardown    Close Browser

*** Test Cases ***

Test URL TH
    [tags]  url_test
    Access iPrice TH Homepage
    Get All Available Links In TH
    Check All Links Response In TH

Test SEO Check Homepage In TH
    [tags]  seo
    Access iPrice TH Homepage
    iPrice TH Header Section Validation
    Get All Available Links In TH
    SEO Check Internal Link In TH
    SEO Check Images ALT  6
    iPrice TH Access Coupons Link
    iPrice TH Header Section Validation
    iPrice TH Coupons Page Landing
    iPrice TH Coupons Access All Store
    iPrice TH Coupons Store Access A Store  Lazada

TestCase One TH
    [tags]    test    1_case
    Access iPrice TH Homepage
    iPrice TH Header Section Validation
    iPrice TH Access Header Logo Link
    iPrice TH Do A Search In Header  iphone 3gs
    iPrice TH Access Header Logo Link
    iPrice TH Do A Search In Header  dell
    iPrice TH Access Header Logo Link
    iPrice TH Header Section Validation
