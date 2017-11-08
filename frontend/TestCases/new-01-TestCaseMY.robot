*** Settings ***

Documentation   A test suite with various tests for iPrice MY.

#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestVariables/TestVariables-Homepage.robot
Resource  ../TestKeywords/new-siteMapKeywords.robot
Resource  ../TestKeywords/new-homePageKeywords.robot

#Setup/Tear Down
Test Setup  TestCase Setup
Test Teardown  Close Browser

*** Test Cases ***

Test Main Site Map Response MY
    [tags]  my  sitemap  case1
    Create New Request Session  MY
    Get Request Response Content
    Get All Main Links
    Get All Main Links Request  MY
    Delete All Sessions

Test Homepage Links Response MY
    [tags]  my  case2
    Access iPrice Homepage  MY
    Get All Available Links In Homepage
    Check All Links Response In Homepage  MY

Test Homepage UI MY
    [tags]  my  case3
    Access iPrice Homepage  MY
    iPrice Homepage Courtesy Validation  MY
    iPrice Header Validation  MY
    iPrice Products Mega Menu Validation  MY
