*** Settings ***

Documentation   A test suite with various tests for iPrice HK.

#Import
Resource  ../TestSettings/TestSettings.robot

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

Test Homepage Links Response HK
    [tags]  hk  case2
    Access iPrice Homepage  hk
    Get All Available Links In Homepage
    Check All Links Response In Homepage  hk

Test Homepage UI HK
    [tags]  sg  case3
    Access iPrice Homepage  hk
    iPrice Homepage Courtesy Validation  hk
    iPrice Header Validation  hk
    iPrice Products Mega Menu Validation  hk
    iPrice Products Carousel Banner Validation  yes
    iPrice Search, Compare & Save Section Validation  hk
    iPrice Search, Compare & Save Section Electronic Gaming Validation  hk
    iPrice Search, Compare & Save Section Fashion Beauty Validation  hk
    iPrice Search, Compare & Save Section Coupons Offers Validation  hk
    iPrice Homepage Recommended Products Validation  hk
    iPrice Footer Email Subscription Validation  hk
    iPrice Homepage Footer Validation  hk

Test Coupons Page UI HK
    [tags]  hk  case4
    Access Coupons Page  hk
    iPrice Coupon Page Courtesy Validation  hk
