*** Settings ***

Documentation   A test suite with various tests for iPrice ID.

#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestVariables/TestVariables-Homepage.robot
Resource  ../TestKeywords/new-siteMapKeywords.robot
Resource  ../TestKeywords/new-homePageKeywords.robot
Resource  ../TestKeywords/new-couponsKeywords.robot

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

Test Homepage Links Response ID
    [tags]  id  case2
    Access iPrice Homepage  id
    Get All Available Links In Homepage
    Check All Links Response In Homepage  id

Test Homepage UI ID
    [tags]  id  case3
    Access iPrice Homepage  id
    iPrice Homepage Courtesy Validation  id
    iPrice Header Validation  id
    iPrice Products Mega Menu Validation  id
    iPrice Products Carousel Banner Validation
    iPrice Search, Compare & Save Section Validation  id
    iPrice Search, Compare & Save Section Electronic Gaming Validation  id
    iPrice Search, Compare & Save Section Fashion Beauty Validation  id
    iPrice Search, Compare & Save Section Coupons Offers Validation  id
    iPrice Homepage Recommended Products Validation  id
    iPrice Homepage Footer Validation  id

Test Coupons Page UI ID
    [tags]  id  case4
    Access Coupons Page  id
    iPrice Coupon Page Courtesy Validation  id
