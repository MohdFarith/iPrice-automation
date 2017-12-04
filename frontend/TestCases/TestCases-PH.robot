*** Settings ***

Documentation   A test suite with various tests for iPrice PH.

#Import
Resource  ../TestSettings/TestSettings.robot

#Setup/Tear Down
Test Setup  TestCase Setup
Test Teardown  Close Browser

*** Test Cases ***

Test Main Site Map Response PH
    [tags]  ph  sitemap  case1
    Create New Request Session  ph
    Get Request Response Content
    Get All Main Links
    Get All Main Links Request  ph
    Delete All Sessions

Test Homepage Links Response PH
    [tags]  ph  case2
    Access iPrice Homepage  ph
    Get All Available Links In Homepage
    Check All Links Response In Homepage  ph

Test Homepage UI PH
    [tags]  sg  case3
    Access iPrice Homepage  ph
    iPrice Homepage Courtesy Validation  ph
    iPrice Header Validation  ph
    iPrice Products Mega Menu Validation  ph
    iPrice Products Carousel Banner Validation  no
    iPrice Search, Compare & Save Section Validation  ph
    iPrice Search, Compare & Save Section Electronic Gaming Validation  ph
    iPrice Search, Compare & Save Section Fashion Beauty Validation  ph
    iPrice Search, Compare & Save Section Coupons Offers Validation  ph
    iPrice Homepage Recommended Products Validation  ph
    iPrice Footer Email Subscription Validation  ph
    iPrice Homepage Footer Validation  ph

Test Coupons Page UI PH
    [tags]  ph  case4
    Access iPrice Homepage  ph
    iPrice Homepage Courtesy Validation  ph
    Access Coupon Page From Courtesy  ph
    iPrice Coupon Page Courtesy Validation  ph
    iPrice Coupons Page Header Validation  ph
    iPrice Coupons Mega Menu Validation  0  Weekly Exclusives
    iPrice Coupons Mega Menu Validation  1  Fashion
    iPrice Coupons Mega Menu Validation  2  Beauty & Health
    iPrice Coupons Mega Menu Validation  3  Electronics
    iPrice Coupons Mega Menu Validation  4  Travel & Hotels
    iPrice Coupons Mega Menu Validation  5  Food & Grocery
    iPrice Coupons Mega Menu Validation  6  Sports & Outdoors
    iPrice Coupons Mega Menu Validation  7  Home & Living
    iPrice Coupons Mega Menu Validation  8  Kids & Toys
    iPrice Coupons Carousel Banner Validation  yes
