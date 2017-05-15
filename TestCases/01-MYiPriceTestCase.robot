*** Setting ***
Documentation   A test suite with various tests for iPrice MY.

#Import
Resource  ../TestData/TestSettings.robot
Resource  ../TestData/01-MYVariablesKeywords.robot

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
    Get All Available Links In MY
    SEO Check Internal Link In MY
    SEO Check Images ALT  6

TestCase One MY
    [tags]  test  1_case
    Access iPrice MY Homepage
    iPrice MY Homepage Landing
    iPrice MY Homepage Categories Landing
    iPrice MY Access Header Link
    iPrice MY Search In Header  iphone 3gs
    iPrice MY Search Page Landing  iphone 3gs
    iPrice MY Access Header Link
    iPrice MY Access Coupons Link
    iPrice MY Access Header Link