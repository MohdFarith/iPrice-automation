*** Setting ***
Documentation   A test suite with various tests for iPrice VN.

#Import
Resource    ../TestData/TestSettings.robot
Resource    ../TestData/02-VNVariablesKeywords.robot

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
    Get All Available Links In VN
    SEO Check Internal Link In VN
    SEO Check Images ALT  6

TestCase One VN
    [tags]    test    1_case
    Access iPrice VN Homepage
    iPrice VN Homepage Landing
    iPrice VN Homepage Categories Landing
    iPrice VN Access Header Link
    iPrice VN Search In Header    iphone 3gs
    iPrice VN Search Page Landing    iphone 3gs
    iPrice VN Access Header Link
    iPrice VN Access Coupons Link
    iPrice VN Access Header Link