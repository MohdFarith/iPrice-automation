*** Settings ***

Documentation   A test suite with various tests for iPrice PH.

#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestKeywords/new-siteMapKeywords.robot

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

Test Site Map Price Comparison Response PH
    [tags]  ph  sitemap  case2
    Create New Request Session  ph
    Get Request Response Content
    Get All Main Links
    Get All Main Links Request  ph
    Get All Main Price Comparison Link
    Get All Price Comparison Links  ph
    Delete All Sessions
