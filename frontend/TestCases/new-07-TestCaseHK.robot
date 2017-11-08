*** Settings ***

Documentation   A test suite with various tests for iPrice HK.

#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestVariables/TestVariables-Homepage.robot
Resource  ../TestKeywords/new-siteMapKeywords.robot
Resource  ../TestKeywords/new-homePageKeywords.robot

#Setup/Tear Down
Test Setup  TestCase Setup
Test Teardown  Close Browser

*** Test Cases ***

Test Main Site Map Response HK
    [tags]  hk  sitemap  case1
    Create New Request Session  hk
    Get Request Response Content
    Get All Main Links
    Get All Main Links Request  hk
    Delete All Sessions

Test Homepage Links Response HK
    [tags]  hk  case2
    Access iPrice Homepage  HK
    Get All Available Links In Homepage
    Check All Links Response In Homepage  HK
