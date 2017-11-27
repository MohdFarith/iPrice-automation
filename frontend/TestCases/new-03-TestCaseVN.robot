*** Settings ***

Documentation   A test suite with various tests for iPrice VN.

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

Test Main Site Map Response VN
    [tags]  vn  sitemap  case1
    Create New Request Session  vn
    Get Request Response Content
    Get All Main Links
    Get All Main Links Request  vn
    Delete All Sessions

Test Homepage Links Response VN
    [tags]  vn  case2
    Access iPrice Homepage  vn
    Get All Available Links In Homepage
    Check All Links Response In Homepage  vn

Test Homepage UI VN
    [tags]  vn  case3
    Access iPrice Homepage  vn
    iPrice Homepage Courtesy Validation  vn
    iPrice Header Validation  vn
    iPrice Products Mega Menu Validation  vn
    iPrice Products Carousel Banner Validation
    iPrice Search, Compare & Save Section Validation  vn
    iPrice Search, Compare & Save Section Electronic Gaming Validation  vn
    iPrice Search, Compare & Save Section Fashion Beauty Validation  vn
    iPrice Search, Compare & Save Section Coupons Offers Validation  vn
    iPrice Homepage Recommended Products Validation  vn
    iPrice Homepage Footer Validation  vn

Test Coupons Page UI VN
    [tags]  vn  case4
    Access Coupons Page  vn
    iPrice Coupon Page Courtesy Validation  vn
