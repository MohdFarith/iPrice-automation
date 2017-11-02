*** Settings ***

Documentation   A test suite with various tests for iPrice VN.

#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestKeywords/new-siteMapKeywords.robot

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

Test Site Map Price Comparison Response VN
    [tags]  vn  sitemap  case2
    Create New Request Session  vn
    Get Request Response Content
    Get All Main Links
    Get All Main Links Request  vn
    Get All Main Price Comparison Link
    Get All Price Comparison Links  vn
    Delete All Sessions
