*** Setting ***
Documentation   A test suite with various tests for iPrice ID.

#Import
Resource    ../TestSettings/TestSettings.robot
Resource    ../TestVariables/03-IDTestVariables.robot
Resource    ../TestKeywords/03-IDTestKeywords.robot

#Setup/Tear Down
Test Setup    TestCase Setup    ${browser}
Test Teardown    Close Browser

*** Test Cases ***

Test URL ID
    [tags]  url_test
    Access iPrice ID Homepage
    Get All Available Links In ID
    Check All Links Response In ID

Test SEO Check Homepage In ID
    [tags]  seo
    Access iPrice ID Homepage
    iPrice ID Header Section Validation
    Get All Available Links In ID
    SEO Check Internal Link In ID
    SEO Check Images ALT  6
    iPrice ID Access Coupons Link
    iPrice ID Header Section Validation
    iPrice ID Coupons Page Landing
    iPrice ID Coupons Access All Store
    iPrice ID Coupons Store Access A Store  Lazada

TestCase One ID
    [tags]    test    1_case
    Access iPrice ID Homepage
    iPrice ID Header Section Validation
    iPrice ID Access Header Logo Link
    iPrice ID Do A Search In Header  iphone 3gs
    iPrice ID Access Header Logo Link
    iPrice ID Do A Search In Header  dell
    iPrice ID Access Header Logo Link
    iPrice ID Header Section Validation
