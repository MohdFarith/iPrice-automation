*** Setting ***
Documentation   A test suite with various tests for iPrice PH.

#Import
Resource    ../TestSettings/TestSettings.robot
Resource    ../TestVariables/05-PHTestVariables.robot
Resource    ../TestKeywords/05-PHTestKeywords.robot

#Setup/Tear Down
Test Setup    TestCase Setup    ${browser}
Test Teardown    Close Browser

*** Test Cases ***

Test URL PH
    [tags]  url_test
    Access iPrice PH Homepage
    Get All Available Links In PH
    Check All Links Response In PH

Test SEO Check Homepage In PH
    [tags]  seo
    Access iPrice PH Homepage
    iPrice PH Header Section Validation
    Get All Available Links In PH
    SEO Check Internal Link In PH
    SEO Check Images ALT  6
    iPrice PH Access Coupons Link
    iPrice PH Header Section Validation
    iPrice PH Coupons Page Landing
    iPrice PH Coupons Access All Store
    iPrice PH Coupons Store Access A Store  Lazada

TestCase One PH
    [tags]    test    1_case
    Access iPrice PH Homepage
    iPrice PH Header Section Validation
    iPrice PH Access Header Logo Link
    iPrice PH Do A Search In Header  iphone 3gs
    iPrice PH Access Header Logo Link
    iPrice PH Do A Search In Header  dell
    iPrice PH Access Header Logo Link
    iPrice PH Header Section Validation
