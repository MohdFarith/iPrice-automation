*** Settings ***

Documentation   A test suite with various tests for iPrice TH.

#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestKeywords/new-siteMapKeywords.robot

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

Test Site Map Price Comparison Response TH
    [tags]  th  sitemap  case2
    Create New Request Session  th
    Get Request Response Content
    Get All Main Links
    Get All Main Links Request  th
    Get All Main Price Comparison Link
    Get All Price Comparison Links  th
    Delete All Sessions
