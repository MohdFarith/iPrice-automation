*** Setting ***

Documentation   A test suite with various tests for iPrice HK.
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

Test URL HK
    [tags]  test  case1
    Access iPrice Homepage  HK
    Get All Available Links
    Check All Links Response  HK

Test SEO Check Homepage In HK
    [tags]  test  seo  case2
    Access iPrice Homepage  HK
    Get All Available Links
    SEO Check Internal Link  HK
    SEO Check Images ALT  6
    iPrice Homepage Access Coupons Link  HK
    iPrice Coupon Page Validation  HK

Test Search For A Product In HK
    [tags]  test  case3
    Access iPrice Homepage  HK
    iPrice Header Courtesy Validation  HK
    iPrice Header Logo Validation  HK
    iPrice Header Search Bar Validation  HK
    iPrice Header Coupons And Offer Validation  HK
    iPrice Dismiss Sign Up Modal
    iPrice Header Main Categories Validation  HK
    iPrice Search, Compare & Save Section Validation  HK
    iPrice Search, Compare & Save Section Electronic Gaming Validation  HK
    iPrice Search, Compare & Save Section Fashion Beauty Validation  HK
    iPrice Search, Compare & Save Section Coupons Offers Validation  HK
    iPrice Homepage Footer Validation  HK
    iPrice Access Header Logo Link  HK
    iPrice Search For Something  HK  iphone 3gs
    iPrice Header Courtesy Validation  HK
    iPrice Product Search Result Page Validation  HK  iphone 3gs
    iPrice Search Result Listing Validation  HK  iphone 3gs

Test Search For A Brand In HK
    [tags]  test  case4
    Access iPrice Homepage  HK
    iPrice Header Courtesy Validation  HK
    iPrice Header Logo Validation  HK
    iPrice Header Search Bar Validation  HK
    iPrice Header Coupons And Offer Validation  HK
    iPrice Dismiss Sign Up Modal
    iPrice Header Main Categories Validation  HK
    iPrice Search, Compare & Save Section Validation  HK
    iPrice Search, Compare & Save Section Electronic Gaming Validation  HK
    iPrice Search, Compare & Save Section Fashion Beauty Validation  HK
    iPrice Search, Compare & Save Section Coupons Offers Validation  HK
    iPrice Homepage Footer Validation  HK
    iPrice Access Header Logo Link  HK
    iPrice Search And Select From Suggestion  HK  Apple
    iPrice Header Courtesy Validation  HK
    iPrice Brand Search Result Page Validation  HK  Apple
    iPrice Search Result Listing Validation  HK  Apple
