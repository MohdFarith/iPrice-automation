*** Setting ***
Documentation   A test suite with various tests for iPrice HK.

#Import
Resource    ../TestData/TestSettings.robot
Resource    ../TestData/06-HKVariablesKeywords.robot

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
    Get All Available Links In HK
    SEO Check Internal Link In HK
    SEO Check Images ALT  6
    iPrice HK Access Coupons Link

TestCase One HK
    [tags]    test    1_case
    Access iPrice HK Homepage
    iPrice HK Homepage Landing
    iPrice HK Homepage Categories Landing
    iPrice HK Access Header Link
    iPrice HK Search In Header    iphone 3gs
    iPrice HK Search Page Landing    iphone 3gs
    iPrice HK Access Header Link
    iPrice HK Access Coupons Link
    iPrice HK Access Header Link
