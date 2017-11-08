*** Settings ***

Documentation   A test suite with various tests for iPrice TH.

#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestVariables/TestVariables-Homepage.robot
Resource  ../TestKeywords/new-siteMapKeywords.robot
Resource  ../TestKeywords/new-homePageKeywords.robot

#Setup/Tear Down
Test Setup  TestCase Setup
Test Teardown  Close Browser

*** Test Cases ***

Test Main Site Map Response TH
    [tags]  th  sitemap  case1
    Create New Request Session  th
    Get Request Response Content
    Get All Main Links
    Get All Main Links Request  th
    Delete All Sessions

Test Homepage Links Response TH
    [tags]  th  case2
    Access iPrice Homepage  TH
    Get All Available Links In Homepage
    Check All Links Response In Homepage  TH

Test Homepage UI TH
    [tags]  th  case3
    Access iPrice Homepage  TH
    iPrice Homepage Courtesy Validation  TH
    iPrice Header Validation  TH
    iPrice Products Mega Menu Validation  TH
