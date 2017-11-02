*** Setting ***
Documentation   A test suite with various tests for iPrice SG.

#Import
Resource    ../TestSettings/TestSettings.robot
Resource    ../TestVariables/04-SGTestVariables.robot
Resource    ../TestKeywords/04-SGTestKeywords.robot

#Setup/Tear Down
Test Setup    TestCase Setup    ${browser}
Test Teardown    Close Browser

*** Test Cases ***

Test URL SG
    [tags]  url_test
    Access iPrice SG Homepage
    Get All Available Links In SG
    Check All Links Response In SG

Test SEO Check Homepage In SG
    [tags]  seo
    Access iPrice SG Homepage
    iPrice SG Header Section Validation
    Get All Available Links In SG
    SEO Check Internal Link In SG
    SEO Check Images ALT  6
    iPrice SG Access Coupons Link
    iPrice SG Header Section Validation
    iPrice SG Coupons Page Landing
    iPrice SG Coupons Access All Store
    iPrice SG Coupons Store Access A Store  Lazada

TestCase One SG
    [tags]    test    1_case
    Access iPrice SG Homepage
    iPrice SG Header Section Validation
    iPrice SG Access Header Logo Link
    iPrice SG Do A Search In Header  iphone 3gs
    iPrice SG Access Header Logo Link
    iPrice SG Do A Search In Header  dell
    iPrice SG Access Header Logo Link
    iPrice SG Header Section Validation
