*** Settings ***

Documentation   A test suite with various tests for iPrice PH.

#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestVariables/TestVariables-Homepage.robot
Resource  ../TestKeywords/new-siteMapKeywords.robot
Resource  ../TestKeywords/new-homePageKeywords.robot

#Setup/Tear Down
Test Setup  TestCase Setup
Test Teardown  Close Browser

*** Test Cases ***

Test Main Site Map Response PH
    [tags]  ph  sitemap  case1
    Create New Request Session  ph
    Get Request Response Content
    Get All Main Links
    Get All Main Links Request  ph
    Delete All Sessions

Test Homepage Links Response PH
    [tags]  ph  case2
    Access iPrice Homepage  PH
    Get All Available Links In Homepage
    Check All Links Response In Homepage  PH
