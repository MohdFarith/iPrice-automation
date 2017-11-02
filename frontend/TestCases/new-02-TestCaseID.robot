*** Settings ***

Documentation   A test suite with various tests for iPrice ID.

#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestKeywords/new-siteMapKeywords.robot

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

Test Site Map Price Comparison Response ID
    [tags]  id  sitemap  case2
    Create New Request Session  id
    Get Request Response Content
    Get All Main Links
    Get All Main Links Request  id
    Get All Main Price Comparison Link
    Get All Price Comparison Links  id
    Delete All Sessions
