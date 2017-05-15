*** Setting ***
Documentation   A test suite with various tests for iPrice ID.

#Import
Resource    ../TestData/TestSettings.robot
Resource    ../TestData/03-IDVariablesKeywords.robot

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
    Get All Available Links In ID
    SEO Check Internal Link In ID

TestCase One ID
    [tags]    test    1_case
    Access iPrice ID Homepage
    iPrice ID Homepage Landing
    iPrice ID Homepage Categories Landing
    iPrice ID Access Header Link
    iPrice ID Homepage Landing
    iPrice ID Search In Header    iphone 3gs
    iPrice ID Search Page Landing    iphone 3gs
    iPrice ID Access Header Link
    iPrice ID Access Coupons Link
    iPrice ID Access Header Link