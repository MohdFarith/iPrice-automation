*** Setting ***

Documentation   A test suite with various tests for iPrice VN.
#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestVariables/TestVariables-Homepage.robot
Resource  ../TestKeywords/TestKeywords-SEO.robot
Resource  ../TestKeywords/TestKeywords-Homepage.robot
Resource  ../TestKeywords/TestKeywords-SearchResult.robot

#Setup/Tear Down
Test Setup  TestCase Setup    ${browser}
Test Teardown  Close Browser

*** Test Cases ***

Test URL VN
    [tags]  test  case1
    Access iPrice Homepage  VN
    Get All Available Links
    Check All Links Response  VN

Test SEO Check Homepage In VN
    [tags]  test  seo  case2
    Access iPrice Homepage  VN
    Get All Available Links
    SEO Check Internal Link  VN
    SEO Check Images ALT  6
    iPrice Homepage Access Coupons Link  VN
    iPrice Coupon Page Validation  VN

Test Search For A Product In VN
    [tags]  test  case3
    Access iPrice Homepage  VN
    iPrice Header Courtesy Validation  VN
    iPrice Header Logo Validation  VN
    iPrice Header Search Bar Validation  VN
    iPrice Header Coupons And Offer Validation  VN
    iPrice Dismiss Sign Up Modal
    iPrice Header Main Categories Validation  VN
    iPrice Search, Compare & Save Section Validation  VN
    iPrice Search, Compare & Save Section Electronic Gaming Validation  VN
    iPrice Search, Compare & Save Section Fashion Beauty Validation  VN
    iPrice Search, Compare & Save Section Coupons Offers Validation  VN
    iPrice Homepage Footer Validation  VN
    iPrice Access Header Logo Link  VN
    iPrice Search For Something  VN  iphone 3gs
    iPrice Header Courtesy Validation  VN
    iPrice Product Search Result Page Validation  VN  iphone 3gs
    iPrice Search Result Listing Validation  VN  iphone 3gs

Test Search For A Brand In VN
    [tags]  test  case4
    Access iPrice Homepage  VN
    iPrice Header Courtesy Validation  VN
    iPrice Header Logo Validation  VN
    iPrice Header Search Bar Validation  VN
    iPrice Header Coupons And Offer Validation  VN
    iPrice Dismiss Sign Up Modal
    iPrice Header Main Categories Validation  VN
    iPrice Search, Compare & Save Section Validation  VN
    iPrice Search, Compare & Save Section Electronic Gaming Validation  VN
    iPrice Search, Compare & Save Section Fashion Beauty Validation  VN
    iPrice Search, Compare & Save Section Coupons Offers Validation  VN
    iPrice Homepage Footer Validation  VN
    iPrice Access Header Logo Link  VN
    iPrice Search And Select From Suggestion  MY  Apple
    iPrice Header Courtesy Validation  MY
    iPrice Brand Search Result Page Validation  MY  Apple
    iPrice Search Result Listing Validation  MY  Apple
