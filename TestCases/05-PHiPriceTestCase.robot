*** Setting ***
Documentation   A test suite with various tests for iPrice PH.

#Import
Resource    ../TestData/TestSettings.robot
Resource    ../TestData/05-PHVariablesKeywords.robot

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
    Get All Available Links In PH
    SEO Check Internal Link In PH
    SEO Check Images ALT  6

TestCase One PH
    [tags]    test    1_case
    Access iPrice PH Homepage
    iPrice PH Homepage Landing
    iPrice PH Homepage Categories Landing
    iPrice PH Access Header Link
    iPrice PH Search In Header    iphone 3gs
    iPrice PH Search Page Landing    iphone 3gs
    iPrice PH Access Header Link
    iPrice PH Access Coupons Link
    iPrice PH Access Header Link