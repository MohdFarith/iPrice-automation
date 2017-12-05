*** Settings ***

Documentation   A test suite with various tests for iPrice MY.

#Import
Resource  ../TestSettings/TestSettings.robot

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
    iPrice Products Carousel Banner Validation  yes
    iPrice Search, Compare & Save Section Validation  my
    iPrice Search, Compare & Save Section Electronic Gaming Validation  my
    iPrice Search, Compare & Save Section Fashion Beauty Validation  my
    iPrice Search, Compare & Save Section Coupons Offers Validation  my
    iPrice Homepage Recommended Products Validation  my
    iPrice Footer Email Subscription Validation  my
    iPrice Homepage Footer Validation  my

Test Coupons Page UI MY
    [tags]  my  case4
    Access iPrice Homepage  my
    iPrice Homepage Courtesy Validation  my
    Access Coupon Page From Courtesy  my
    iPrice Coupon Page Courtesy Validation  my
    iPrice Coupons Page Header Validation  my
    iPrice Coupons Mega Menu Validation  0  Weekly Exclusives
    iPrice Coupons Mega Menu Validation  1  Electronics
    iPrice Coupons Mega Menu Validation  2  Fashion
    iPrice Coupons Mega Menu Validation  3  Beauty & Health
    iPrice Coupons Mega Menu Validation  4  Food & Grocery
    iPrice Coupons Mega Menu Validation  5  Travel & Hotels
    iPrice Coupons Mega Menu Validation  6  Home & Living
    iPrice Coupons Mega Menu Validation  7  Sports & Outdoors
    iPrice Coupons Mega Menu Validation  8  Kids & Toys
    iPrice Coupons Carousel Banner Validation  yes
    iPrice Coupons Main Breadcrumb Validation  my
    iPrice Coupons Main Header Validation  my
    iPrice Coupons Top Store Validation  my
