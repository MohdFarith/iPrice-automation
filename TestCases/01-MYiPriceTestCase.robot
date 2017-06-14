*** Setting ***
Documentation   A test suite with various tests for iPrice MY.

#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestVariables/01-MYTestVariables.robot
Resource  ../TestKeywords/01-MYTestKeywords.robot

#Setup/Tear Down
Test Setup  TestCase Setup    ${browser}
Test Teardown  Close Browser

*** Test Cases ***

Test URL MY
    [tags]  url_test
    Access iPrice MY Homepage
    Get All Available Links In MY
    Check All Links Response In MY

Test SEO Check Homepage In MY
    [tags]  seo
    Access iPrice MY Homepage
    iPrice MY Header Section Validation
    Get All Available Links In MY
    SEO Check Internal Link In MY
    SEO Check Images ALT In MY  6
    iPrice MY Access Coupons Link
    iPrice MY Header Section Validation
    iPrice MY Coupons Page Landing
    iPrice MY Coupons Access All Store
    iPrice MY Coupons Store Access A Store  Lazada

TestCase One MY
    [tags]  test  1_case
    Access iPrice MY Homepage
    iPrice MY Header Section Validation
    iPrice MY Access Header Logo Link
    iPrice MY Do A Search In Header  iphone 3gs
    iPrice MY Access Header Logo Link
    iPrice MY Do A Search In Header  dell
    iPrice MY Access Header Logo Link
    iPrice MY Header Section Validation
