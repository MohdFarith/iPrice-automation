*** Settings ***

Documentation   A test suite with various tests for iPrice HK.

#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestKeywords/new-siteMapKeywords.robot

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

Test Site Map Price Comparison Response HK
    [tags]  hk  sitemap  case2
    Create New Request Session  hk
    Get Request Response Content
    Get All Main Links
    Get All Main Links Request  hk
    Get All Main Price Comparison Link
    Get All Price Comparison Links  hk
    Delete All Sessions
