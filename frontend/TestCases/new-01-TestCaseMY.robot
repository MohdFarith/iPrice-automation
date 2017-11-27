*** Settings ***

Documentation   A test suite with various tests for iPrice MY.

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

Test Main Site Map Response MY
    [tags]  my  sitemap  case1
    Create New Request Session  my
    Get Request Response Content
    Get All Main Links
    Get All Main Links Request  my
    Delete All Sessions

Test Homepage Links Response MY
    [tags]  my  case2
    Access iPrice Homepage  my
    Get All Available Links In Homepage
    Check All Links Response In Homepage  my

Test Homepage UI MY
    [tags]  my  case3
    Access iPrice Homepage  my
    iPrice Homepage Courtesy Validation  my
    iPrice Header Validation  my
    iPrice Products Mega Menu Validation  my
    iPrice Products Carousel Banner Validation
    iPrice Search, Compare & Save Section Validation  my
    iPrice Search, Compare & Save Section Electronic Gaming Validation  my
    iPrice Search, Compare & Save Section Fashion Beauty Validation  my
    iPrice Search, Compare & Save Section Coupons Offers Validation  my
    iPrice Homepage Recommended Products Validation  my
    iPrice Homepage Footer Validation  my

Test Coupons Page UI MY
    [tags]  my  case4
    Access Coupons Page  my
    iPrice Coupon Page Courtesy Validation  my
