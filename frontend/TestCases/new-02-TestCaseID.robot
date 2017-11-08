*** Settings ***

Documentation   A test suite with various tests for iPrice ID.

#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestVariables/TestVariables-Homepage.robot
Resource  ../TestKeywords/new-siteMapKeywords.robot
Resource  ../TestKeywords/new-homePageKeywords.robot

#Setup/Tear Down
Test Setup  TestCase Setup
Test Teardown  Close Browser

*** Test Cases ***

Test Main Site Map Response ID
    [tags]  id  sitemap  case1
    Create New Request Session  id
    Get Request Response Content
    Get All Main Links
    Get All Main Links Request  id
    Delete All Sessions

Test Homepage Links Response ID
    [tags]  id  case2
    Access iPrice Homepage  ID
    Get All Available Links In Homepage
    Check All Links Response In Homepage  ID

Test Homepage UI ID
    [tags]  id  case3
    Access iPrice Homepage  ID
    iPrice Homepage Courtesy Validation  ID
    iPrice Header Validation  ID
    iPrice Products Mega Menu Validation  ID
