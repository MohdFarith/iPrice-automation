*** Settings ***

Documentation   A test suite with various tests for iPrice SG.

#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestVariables/TestVariables-Homepage.robot
Resource  ../TestKeywords/new-siteMapKeywords.robot
Resource  ../TestKeywords/new-homePageKeywords.robot

#Setup/Tear Down
Test Setup  TestCase Setup
Test Teardown  Close Browser

*** Test Cases ***

Test Main Site Map Response SG
    [tags]  sg  sitemap  case1
    Create New Request Session  sg
    Get Request Response Content
    Get All Main Links
    Get All Main Links Request  sg
    Delete All Sessions

Test Homepage Links Response SG
    [tags]  sg  case2
    Access iPrice Homepage  SG
    Get All Available Links In Homepage
    Check All Links Response In Homepage  SG

Test Homepage UI SG
    [tags]  sg  case3
    Access iPrice Homepage  SG
    iPrice Homepage Courtesy Validation  SG
    iPrice Header Validation  SG
    iPrice Products Mega Menu Validation  SG
