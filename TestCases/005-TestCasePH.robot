*** Setting ***

Documentation   A test suite with various tests for iPrice PH.
#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestVariables/TestVariables-Homepage.robot
Resource  ../TestKeywords/TestKeywords-SEO.robot
Resource  ../TestKeywords/TestKeywords-Homepage.robot
Resource  ../TestKeywords/TestKeywords-SearchResult.robot

#Setup/Tear Down
Test Setup  TestCase Setup
Test Teardown  Close Browser

*** Test Cases ***

Test URL PH
    [tags]  test  case1
    Access iPrice Homepage  PH
    Get All Available Links
    Check All Links Response  PH

Test SEO Check Homepage In PH
    [tags]  test  seo  case2
    Access iPrice Homepage  PH
    Get All Available Links
    SEO Check Internal Link  PH
    SEO Check Images ALT  6
    iPrice Homepage Access Coupons Link  PH
    iPrice Coupon Page Validation  PH

Test Search For A Product In PH
    [tags]  test  case3
    Access iPrice Homepage  PH
    iPrice Header Courtesy Validation  PH
    iPrice Header Validation  PH
    iPrice Dismiss Sign Up Modal
    iPrice Products Header Main Categories Validation  PH
    iPrice Search, Compare & Save Section Validation  PH
    iPrice Search, Compare & Save Section Electronic Gaming Validation  PH
    iPrice Search, Compare & Save Section Fashion Beauty Validation  PH
    iPrice Search, Compare & Save Section Coupons Offers Validation  PH
    iPrice Homepage Recommended Products Validation  PH
    iPrice Homepage Footer Validation  PH
    iPrice Access Header Logo Link  PH
    iPrice Search For Something  PH  iphone 3gs
    iPrice Header Courtesy Validation  PH
    iPrice Product Search Result Page Validation  PH  iphone 3gs
    iPrice Search Result Listing Validation  PH  iphone 3gs

Test Search For A Brand In PH
    [tags]  test  case4
    Access iPrice Homepage  PH
    iPrice Header Courtesy Validation  PH
    iPrice Header Validation  PH
    iPrice Dismiss Sign Up Modal
    iPrice Products Header Main Categories Validation  PH
    iPrice Search, Compare & Save Section Validation  PH
    iPrice Search, Compare & Save Section Electronic Gaming Validation  PH
    iPrice Search, Compare & Save Section Fashion Beauty Validation  PH
    iPrice Search, Compare & Save Section Coupons Offers Validation  PH
    iPrice Homepage Recommended Products Validation  PH
    iPrice Homepage Footer Validation  PH
    iPrice Access Header Logo Link  PH
    iPrice Search And Select From Suggestion  PH  Apple
    iPrice Header Courtesy Validation  PH
    iPrice Brand Search Result Page Validation  PH  Apple
    iPrice Search Result Listing Validation  PH  Apple
