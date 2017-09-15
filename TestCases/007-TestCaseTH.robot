*** Setting ***

Documentation   A test suite with various tests for iPrice TH.
#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestVariables/TestVariables-Homepage.robot
Resource  ../TestKeywords/TestKeywords-SEO.robot
Resource  ../TestKeywords/TestKeywords-Homepage.robot
Resource  ../TestKeywords/TestKeywords-Coupon.robot
Resource  ../TestKeywords/TestKeywords-SearchResult.robot

#Setup/Tear Down
Test Setup  TestCase Setup    ${browser}
Test Teardown  Close Browser

*** Test Cases ***

Test URL TH
    [tags]  test  case1
    Access iPrice Homepage  TH
    Get All Available Links
    Check All Links Response  TH

Test SEO Check Homepage In TH
    [tags]  test  seo  case2
    Access iPrice Homepage  TH
    Get All Available Links
    SEO Check Internal Link  TH
    SEO Check Images ALT  6
    iPrice Homepage Access Coupons Link  TH
    iPrice Coupon Page Validation  TH

Test Search For A Product In TH
    [tags]  test  case3
    Access iPrice Homepage  TH
    iPrice Header Courtesy Validation  TH
    iPrice Header Logo Validation  TH
    iPrice Header Search Bar Validation  TH
    iPrice Header Coupons And Offer Validation  TH
    iPrice Dismiss Sign Up Modal
    iPrice Header Main Categories Validation  TH
    iPrice Search, Compare & Save Section Validation  TH
    iPrice Search, Compare & Save Section Electronic Gaming Validation  TH
    iPrice Search, Compare & Save Section Fashion Beauty Validation  TH
    iPrice Search, Compare & Save Section Coupons Offers Validation  TH
    iPrice Homepage Footer Validation  TH
    iPrice Access Header Logo Link  TH
    iPrice Search For Something  TH  iphone 3gs
    iPrice Header Courtesy Validation  TH
    iPrice Product Search Result Page Validation  TH  iphone 3gs
    iPrice Search Result Listing Validation  TH  iphone 3gs

Test Search For A Brand In TH
    [tags]  test  case4
    Access iPrice Homepage  TH
    iPrice Header Courtesy Validation  TH
    iPrice Header Logo Validation  TH
    iPrice Header Search Bar Validation  TH
    iPrice Header Coupons And Offer Validation  TH
    iPrice Dismiss Sign Up Modal
    iPrice Header Main Categories Validation  TH
    iPrice Search, Compare & Save Section Validation  TH
    iPrice Search, Compare & Save Section Electronic Gaming Validation  TH
    iPrice Search, Compare & Save Section Fashion Beauty Validation  TH
    iPrice Search, Compare & Save Section Coupons Offers Validation  TH
    iPrice Homepage Footer Validation  TH
    iPrice Access Header Logo Link  TH
    iPrice Search And Select From Suggestion  TH  Apple
    iPrice Header Courtesy Validation  TH
    iPrice Brand Search Result Page Validation  TH  Apple
    iPrice Search Result Listing Validation  TH  Apple
