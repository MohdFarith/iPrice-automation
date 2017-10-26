*** Setting ***
Documentation   A test suite with various tests for iPrice MY.
#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestVariables/01-MYTestVariables.robot
Resource  ../TestKeywords/01-MYTestKeywords.robot

#Setup/Tear Down
Test Setup  TestCase Setup    ${browser}
Test Teardown  Close Browser

*** Test Cases ***

Test URL MY
    [tags]  url_test
    Access iPrice MY Homepage
    Get All Available Links In MY
    Check All Links Response In MY

Test SEO Check Homepage In MY
    [tags]  test  seo
    Access iPrice MY Homepage
    iPrice MY Header Section Validation
    Get All Available Links In MY
    SEO Check Internal Link In MY
    SEO Check Images ALT In MY  6
    iPrice MY Access Coupons Link
    iPrice MY Header Section Validation
    iPrice MY Coupons Page Landing
    iPrice MY Coupons Access All Store
    iPrice MY Coupons Store Access A Store  Lazada

Test COOD
    [tags]  test  cood
    Access COOD Says
    Validate COOD Says Main Page
    Access COOD Rappler EN
    Validate COOD Rappler EN Main Page
    Access COOD Rappler ID
    Validate COOD Rappler ID Main Page

Test Search For A Product
    [tags]  test  1_case
    Access iPrice MY Homepage
    iPrice MY Header Section Validation
    iPrice MY Check Search, Compare & Save Section
    iPrice MY Validate Footer
    iPrice MY Access Header Logo Link
    iPrice MY Search For A Product  iphone 3gs

Test Search For A Brand
    [tags]  test  2_case
    Access iPrice MY Homepage
    iPrice MY Header Section Validation
    iPrice MY Check Search, Compare & Save Section
    iPrice MY Validate Footer
    iPrice MY Access Header Logo Link
    iPrice MY Search For A Brand  Targus

Test Search For A Coupon
    [tags]  test  3_case
    Access iPrice MY Homepage
    iPrice MY Header Section Validation
    iPrice MY Check Search, Compare & Save Section
    iPrice MY Validate Footer
    iPrice MY Access Header Logo Link
    iPrice MY Search For A Coupon  11street

Test Main Categories
    [tags]  test  4_case
    Access iPrice MY Homepage
    iPrice MY Header Section Validation
    iPrice MY Check Search, Compare & Save Section
    iPrice MY Validate Footer
    iPrice MY Check Main Categories Display Popup  Clothing
    iPrice MY Check Main Categories Display Popup  Shoes
    iPrice MY Check Main Categories Display Popup  Bags
    iPrice MY Check Main Categories Display Popup  Watches
    iPrice MY Check Main Categories Display Popup  Jewellery
    iPrice MY Check Main Categories Display Popup  Computing
    iPrice MY Check Main Categories Display Popup  Phones & Tablets
    iPrice MY Check Main Categories Display Popup  Gaming
    iPrice MY Check Main Categories Display Popup  Camera & Photo
    iPrice MY Check Main Categories Display Popup  TV, Video & DVD
    iPrice MY Check Main Categories Display Popup  Appliances
    iPrice MY Check Main Categories Display Popup  Cars
    iPrice MY Check Main Categories Display Popup  Automotive
    iPrice MY Access Main Categories From Homepage  Clothing
    iPrice MY Access Main Categories From Homepage  Shoes
    iPrice MY Access Main Categories From Homepage  Bags
    iPrice MY Access Main Categories From Homepage  Watches
    iPrice MY Access Main Categories From Homepage  Jewellery
    iPrice MY Access Main Categories From Homepage  Computing
    iPrice MY Access Main Categories From Homepage  Phones & Tablets
    iPrice MY Access Main Categories From Homepage  Gaming
    iPrice MY Access Main Categories From Homepage  Camera & Photo
    iPrice MY Access Main Categories From Homepage  TV, Video & DVD
    iPrice MY Access Main Categories From Homepage  Appliances
    iPrice MY Access Main Categories From Homepage  Cars
    iPrice MY Access Main Categories From Homepage  Automotive
    iPrice MY Access +Categories From Navigation Bar

Test Discovery Page With Ascending Sort For Men
    [tags]  test  5_case
    Access iPrice MY Homepage
    iPrice MY Header Section Validation
    iPrice MY Check Search, Compare & Save Section
    iPrice MY Validate Footer
    iPrice MY Access Main Categories From Homepage  Shoes
    Shoes Main Category Validation
    iPrice MY Select Sort By  Price (ascending)
    iPrice MY Check Product Discovery Price Ascending  shoes
    Shoes Main Category Validation

Test Timestamp
    [tags]  time
    ${time}  Get Current Date  result_format=%B
