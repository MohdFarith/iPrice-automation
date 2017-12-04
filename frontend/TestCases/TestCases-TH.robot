*** Settings ***

Documentation   A test suite with various tests for iPrice TH.

#Import
Resource  ../TestSettings/TestSettings.robot

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

Test Homepage Links Response TH
    [tags]  th  case2
    Access iPrice Homepage  th
    Get All Available Links In Homepage
    Check All Links Response In Homepage  th

Test Homepage UI TH
    [tags]  th  case3
    Access iPrice Homepage  th
    iPrice Homepage Courtesy Validation  th
    iPrice Header Validation  th
    iPrice Products Mega Menu Validation  th
    iPrice Products Carousel Banner Validation  no
    iPrice Search, Compare & Save Section Validation  th
    iPrice Search, Compare & Save Section Electronic Gaming Validation  th
    iPrice Search, Compare & Save Section Fashion Beauty Validation  th
    iPrice Search, Compare & Save Section Coupons Offers Validation  th
    iPrice Homepage Recommended Products Validation  th
    iPrice Footer Email Subscription Validation  th
    iPrice Homepage Footer Validation  th

Test Coupons Page UI TH
    [tags]  th  case4
    Access iPrice Homepage  th
    iPrice Homepage Courtesy Validation  th
    Access Coupon Page From Courtesy  th
    iPrice Coupon Page Courtesy Validation  th
    iPrice Coupons Page Header Validation  th
    iPrice Coupons Mega Menu Validation  0  คูปองเอ็กซ์คลูซีฟประจำสัปดาห์
    iPrice Coupons Mega Menu Validation  1  อิเล็คทรอนิกส์ & แก็ดเจ็ต
    iPrice Coupons Mega Menu Validation  2  แฟชั่น
    iPrice Coupons Mega Menu Validation  3  สุขภาพและความงาม
    iPrice Coupons Mega Menu Validation  4  อาหาร & ผักและผลไม้
    iPrice Coupons Mega Menu Validation  5  ท่องเที่ยว & โรงแรม
    iPrice Coupons Mega Menu Validation  6  กีฬา & กิจกรรมกลางแจ้ง
    iPrice Coupons Carousel Banner Validation  no
