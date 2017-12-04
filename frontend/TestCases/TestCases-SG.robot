*** Settings ***

Documentation   A test suite with various tests for iPrice SG.

#Import
Resource  ../TestSettings/TestSettings.robot

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

Test Homepage Links Response SG
    [tags]  sg  case2
    Access iPrice Homepage  sg
    Get All Available Links In Homepage
    Check All Links Response In Homepage  sg

Test Homepage UI SG
    [tags]  sg  case3
    Access iPrice Homepage  sg
    iPrice Homepage Courtesy Validation  sg
    iPrice Header Validation  sg
    iPrice Products Mega Menu Validation  sg
    iPrice Products Carousel Banner Validation  yes
    iPrice Search, Compare & Save Section Validation  sg
    iPrice Search, Compare & Save Section Electronic Gaming Validation  sg
    iPrice Search, Compare & Save Section Fashion Beauty Validation  sg
    iPrice Search, Compare & Save Section Coupons Offers Validation  sg
    iPrice Homepage Recommended Products Validation  sg
    iPrice Footer Email Subscription Validation  sg
    iPrice Homepage Footer Validation  sg

Test Coupons Page UI SG
    [tags]  sg  case4
    Access iPrice Homepage  sg
    iPrice Homepage Courtesy Validation  sg
    Access Coupon Page From Courtesy  sg
    iPrice Coupon Page Courtesy Validation  sg
    iPrice Coupons Page Header Validation  sg
    iPrice Coupons Mega Menu Validation  0  Weekly Exclusives
    iPrice Coupons Mega Menu Validation  1  Electronics
    iPrice Coupons Mega Menu Validation  2  Beauty & Health
    iPrice Coupons Mega Menu Validation  3  Food & Grocery
    iPrice Coupons Mega Menu Validation  4  Travel & Hotels
    iPrice Coupons Mega Menu Validation  5  Fashion
    iPrice Coupons Mega Menu Validation  6  Home & Living
    iPrice Coupons Mega Menu Validation  7  Sports & Outdoors
    iPrice Coupons Mega Menu Validation  8  Kids & Toys
    iPrice Coupons Carousel Banner Validation  yes
