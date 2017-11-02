*** Settings ***

Documentation   A test suite with various tests for iPrice SG.

#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestKeywords/new-siteMapKeywords.robot

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

Test Site Map Price Comparison Response SG
    [tags]  sg  sitemap  case2
    Create New Request Session  sg
    Get Request Response Content
    Get All Main Links
    Get All Main Links Request  sg
    Get All Main Price Comparison Link
    Get All Price Comparison Links  sg
    Delete All Sessions
