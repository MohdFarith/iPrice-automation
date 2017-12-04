*** Settings ***

Documentation   A test suite with various tests for iPrice VN.

#Import
Resource  ../TestSettings/TestSettings.robot

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
    iPrice Products Carousel Banner Validation  yes
    iPrice Search, Compare & Save Section Validation  vn
    iPrice Search, Compare & Save Section Electronic Gaming Validation  vn
    iPrice Search, Compare & Save Section Fashion Beauty Validation  vn
    iPrice Search, Compare & Save Section Coupons Offers Validation  vn
    iPrice Homepage Recommended Products Validation  vn
    iPrice Footer Email Subscription Validation  vn
    iPrice Homepage Footer Validation  vn

Test Coupons Page UI VN
    [tags]  vn  case4
    Access iPrice Homepage  vn
    iPrice Homepage Courtesy Validation  vn
    Access Coupon Page From Courtesy  vn
    iPrice Coupon Page Courtesy Validation  vn
    iPrice Coupons Page Header Validation  vn
    iPrice Coupons Mega Menu Validation  0  Coupon Hot trong tuần
    iPrice Coupons Mega Menu Validation  1  Điện máy
    iPrice Coupons Mega Menu Validation  2  Trẻ em & Đồ chơi
    iPrice Coupons Mega Menu Validation  3  Thời trang
    iPrice Coupons Mega Menu Validation  4  Sức khỏe & Sắc đẹp
    iPrice Coupons Mega Menu Validation  5  Thực phẩm & Tạp hoá
    iPrice Coupons Mega Menu Validation  6  Thể thao & Dã ngoại
    iPrice Coupons Mega Menu Validation  7  Du lịch & Khách sạn
    iPrice Coupons Carousel Banner Validation  no
