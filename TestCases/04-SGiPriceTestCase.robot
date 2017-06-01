*** Setting ***
Documentation   A test suite with various tests for iPrice SG.

#Import
Resource    ../TestData/TestSettings.robot
Resource    ../TestData/04-SGVariablesKeywords.robot

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
    Get All Available Links In SG
    SEO Check Internal Link In SG
    SEO Check Images ALT  6
    iPrice SG Access Coupons Link

TestCase One SG
    [tags]    test    1_case
    Access iPrice SG Homepage
    iPrice SG Homepage Landing
    iPrice SG Homepage Categories Landing
    iPrice SG Access Header Link
    iPrice SG Search In Header    iphone 3gs
    iPrice SG Search Page Landing    iphone 3gs
    iPrice SG Access Header Link
    iPrice SG Access Coupons Link
    iPrice SG Access Header Link
