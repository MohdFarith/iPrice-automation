*** Setting ***
Documentation   A test suite with various tests for iPrice HK.

#Import
Resource    ../TestSettings/TestSettings.robot
Resource    ../TestVariables/06-HKTestVariables.robot
Resource    ../TestKeywords/06-HKTestKeywords.robot

#Setup/Tear Down
Test Setup    TestCase Setup    ${browser}
Test Teardown    Close Browser

*** Test Cases ***

Test URL HK
    [tags]  url_test
    Access iPrice HK Homepage
    Get All Available Links In HK
    Check All Links Response In HK

Test SEO Check Homepage In HK
    [tags]  seo
    Access iPrice HK Homepage
    iPrice HK Header Section Validation
    Get All Available Links In HK
    SEO Check Internal Link In HK
    SEO Check Images ALT  6
    iPrice HK Access Coupons Link
    iPrice HK Header Section Validation
    iPrice HK Coupons Page Landing
    iPrice HK Coupons Access All Store
    iPrice HK Coupons Store Access A Store  Adidas

TestCase One HK
    [tags]    test    1_case
    Access iPrice HK Homepage
    iPrice HK Header Section Validation
    iPrice HK Access Header Logo Link
    iPrice HK Do A Search In Header  iphone 3gs
    iPrice HK Access Header Logo Link
    iPrice HK Do A Search In Header  dell
    iPrice HK Access Header Logo Link
    iPrice HK Header Section Validation
