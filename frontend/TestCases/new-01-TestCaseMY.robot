*** Settings ***

Documentation   A test suite with various tests for iPrice MY.

#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestKeywords/new-siteMapKeywords.robot

#Setup/Tear Down
Test Setup  TestCase Setup
Test Teardown  Close Browser

*** Test Cases ***

Test Main Site Map Response MY
    [tags]  my  sitemap  case1
    Create New Request Session  my
    Get Request Response Content
    Get All Main Links
    Get All Main Links Request  my
    Delete All Sessions

Test Site Map Price Comparison Response MY
    [tags]  my  sitemap  case2
    Create New Request Session  my
    Get Request Response Content
    Get All Main Links
    Get All Main Links Request  my
    Get All Main Price Comparison Link
    Get All Price Comparison Links  my
    Delete All Sessions
