*** Setting ***
Documentation   A test suite with various tests for iPrice TH.

#Import
Resource    ../TestData/TestSettings.robot
Resource    ../TestData/07-THVariablesKeywords.robot

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
    Get All Available Links In TH
    SEO Check Internal Link In TH
    SEO Check Images ALT  6
    iPrice TH Access Coupons Link

TestCase One TH
    [tags]    test    1_case
    Access iPrice TH Homepage
    iPrice TH Homepage Landing
    iPrice TH Homepage Categories Landing
    iPrice TH Access Header Link
    iPrice TH Search In Header    iphone 3gs
    iPrice TH Search Page Landing    iphone 3gs
    iPrice TH Access Header Link
    iPrice TH Access Coupons Link
    iPrice TH Access Header Link
