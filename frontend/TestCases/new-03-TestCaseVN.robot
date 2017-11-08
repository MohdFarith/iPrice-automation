*** Settings ***

Documentation   A test suite with various tests for iPrice VN.

#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestVariables/TestVariables-Homepage.robot
Resource  ../TestKeywords/new-siteMapKeywords.robot
Resource  ../TestKeywords/new-homePageKeywords.robot

#Setup/Tear Down
Test Setup  TestCase Setup
Test Teardown  Close Browser

*** Test Cases ***

Test Main Site Map Response VN
    [tags]  vn  sitemap  case1
    Create New Request Session  vn
    Get Request Response Content
    Get All Main Links
    Get All Main Links Request  vn
    Delete All Sessions

Test Homepage Links Response VN
    [tags]  vn  case2
    Access iPrice Homepage  VN
    Get All Available Links In Homepage
    Check All Links Response In Homepage  VN

Test Homepage UI VN
    [tags]  vn  case3
    Access iPrice Homepage  VN
    iPrice Homepage Courtesy Validation  VN
    iPrice Header Validation  VN
    iPrice Products Mega Menu Validation  VN
