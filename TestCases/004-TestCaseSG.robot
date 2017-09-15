*** Setting ***

Documentation   A test suite with various tests for iPrice SG.
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

Test URL SG
    [tags]  test  case1
    Access iPrice Homepage  SG
    Get All Available Links
    Check All Links Response  SG

Test SEO Check Homepage In SG
    [tags]  test  seo  case2
    Access iPrice Homepage  SG
    Get All Available Links
    SEO Check Internal Link  SG
    SEO Check Images ALT  6
    iPrice Homepage Access Coupons Link  SG
    iPrice Coupon Page Validation  SG

Test Search For A Product In SG
    [tags]  test  case3
    Access iPrice Homepage  SG
    iPrice Header Courtesy Validation  SG
    iPrice Header Logo Validation  SG
    iPrice Header Search Bar Validation  SG
    iPrice Header Coupons And Offer Validation  SG
    iPrice Dismiss Sign Up Modal
    iPrice Header Main Categories Validation  SG
    iPrice Search, Compare & Save Section Validation  SG
    iPrice Search, Compare & Save Section Electronic Gaming Validation  SG
    iPrice Search, Compare & Save Section Fashion Beauty Validation  SG
    iPrice Search, Compare & Save Section Coupons Offers Validation  SG
    iPrice Homepage Footer Validation  SG
    iPrice Access Header Logo Link  SG
    iPrice Search For Something  SG  iphone 3gs
    iPrice Header Courtesy Validation  SG
    iPrice Product Search Result Page Validation  SG  iphone 3gs
    iPrice Search Result Listing Validation  SG  iphone 3gs

Test Search For A Brand In SG
    [tags]  test  case4
    Access iPrice Homepage  SG
    iPrice Header Courtesy Validation  SG
    iPrice Header Logo Validation  SG
    iPrice Header Search Bar Validation  SG
    iPrice Header Coupons And Offer Validation  SG
    iPrice Dismiss Sign Up Modal
    iPrice Header Main Categories Validation  SG
    iPrice Search, Compare & Save Section Validation  SG
    iPrice Search, Compare & Save Section Electronic Gaming Validation  SG
    iPrice Search, Compare & Save Section Fashion Beauty Validation  SG
    iPrice Search, Compare & Save Section Coupons Offers Validation  SG
    iPrice Homepage Footer Validation  SG
    iPrice Access Header Logo Link  SG
    iPrice Search And Select From Suggestion  SG  Apple
    iPrice Header Courtesy Validation  SG
    iPrice Brand Search Result Page Validation  SG  Apple
    iPrice Search Result Listing Validation  SG  Apple
