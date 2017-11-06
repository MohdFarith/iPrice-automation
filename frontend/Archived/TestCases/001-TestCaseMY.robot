*** Setting ***

Documentation   A test suite with various tests for iPrice MY.
#Import
Resource  ../TestSettings/TestSettings.robot
Resource  ../TestVariables/TestVariables-Homepage.robot
Resource  ../TestKeywords/TestKeywords-SEO.robot
Resource  ../TestKeywords/TestKeywords-Homepage.robot
Resource  ../TestKeywords/TestKeywords-COOD.robot
Resource  ../TestKeywords/TestKeywords-SearchResult.robot

#Setup/Tear Down
Test Setup  TestCase Setup
Test Teardown  Close Browser

*** Test Cases ***

Test URL MY
    [tags]  test  case1
    Access iPrice Homepage  MY
    Get All Available Links
    Check All Links Response  MY

Test SEO Check Homepage In MY
    [tags]  test  seo  case2
    Access iPrice Homepage  MY
    Get All Available Links
    SEO Check Internal Link  MY
    SEO Check Images ALT  6

Test COOD EN
    [tags]  test  cood
    Access COOD Says
    Validate COOD Says Main Page
    Access COOD Rappler EN
    Validate COOD Rappler EN Main Page

Test Search For A Product In MY
    [tags]  test  case3
    Access iPrice Homepage  MY
    iPrice Header Courtesy Validation  MY
    iPrice Header Validation    MY
    iPrice Dismiss Sign Up Modal
    iPrice Products Header Main Categories Validation  MY
    # iPrice Search, Compare & Save Section Validation  MY
    # iPrice Search, Compare & Save Section Electronic Gaming Validation  MY
    # iPrice Search, Compare & Save Section Fashion Beauty Validation  MY
    # iPrice Search, Compare & Save Section Coupons Offers Validation  MY
    # iPrice Homepage Recommended Products Validation  MY
    # iPrice Homepage Footer Validation  MY
    # iPrice Access Header Logo Link  MY
    iPrice Search For Something  MY  iphone 3gs
    iPrice Header Courtesy Validation  MY
    iPrice Product Search Result Page Validation  MY  iphone 3gs
    iPrice Search Result Listing Validation  MY  iphone 3gs

Test Search For A Brand In MY
    [tags]  test  case4
    Access iPrice Homepage  MY
    iPrice Header Courtesy Validation  MY
    iPrice Header Validation  MY
    iPrice Dismiss Sign Up Modal
    iPrice Products Header Main Categories Validation  MY
    # iPrice Search, Compare & Save Section Validation  MY
    # iPrice Search, Compare & Save Section Electronic Gaming Validation  MY
    # iPrice Search, Compare & Save Section Fashion Beauty Validation  MY
    # iPrice Search, Compare & Save Section Coupons Offers Validation  MY
    # iPrice Homepage Recommended Products Validation  MY
    # iPrice Homepage Footer Validation  MY
    # iPrice Access Header Logo Link  MY
    iPrice Search And Select From Suggestion  MY  Apple
    iPrice Header Courtesy Validation  MY
    iPrice Brand Search Result Page Validation  MY  Apple
    iPrice Search Result Listing Validation  MY  Apple
