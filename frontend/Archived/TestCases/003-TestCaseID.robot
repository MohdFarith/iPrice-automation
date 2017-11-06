*** Setting ***

Documentation   A test suite with various tests for iPrice ID.
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

Test URL ID
    [tags]  test  case1
    Access iPrice Homepage  ID
    Get All Available Links
    Check All Links Response  ID

Test SEO Check Homepage In ID
    [tags]  test  seo  case2
    Access iPrice Homepage  ID
    Get All Available Links
    SEO Check Internal Link  ID
    SEO Check Images ALT  6

Test COOD ID
    [tags]  test  cood
    Access COOD Rappler ID
    Validate COOD Rappler ID Main Page

Test Search For A Product In ID
    [tags]  test  case3
    Access iPrice Homepage  ID
    iPrice Header Courtesy Validation  ID
    iPrice Header Validation  ID
    iPrice Dismiss Sign Up Modal
    # iPrice Products Header Main Categories Validation  ID
    # iPrice Search, Compare & Save Section Validation  ID
    # iPrice Search, Compare & Save Section Electronic Gaming Validation  ID
    # iPrice Search, Compare & Save Section Fashion Beauty Validation  ID
    # iPrice Search, Compare & Save Section Coupons Offers Validation  ID
    # iPrice Homepage Recommended Products Validation  ID
    # iPrice Homepage Footer Validation  ID
    # iPrice Access Header Logo Link  ID
    iPrice Search For Something  ID  iphone 3gs
    iPrice Header Courtesy Validation  ID
    iPrice Product Search Result Page Validation  ID  iphone 3gs
    iPrice Search Result Listing Validation  ID  iphone 3gs

Test Search For A Brand In ID
    [tags]  test  case4
    Access iPrice Homepage  ID
    iPrice Header Courtesy Validation  ID
    iPrice Header Validation  ID
    iPrice Dismiss Sign Up Modal
    # iPrice Products Header Main Categories Validation  ID
    # iPrice Search, Compare & Save Section Validation  ID
    # iPrice Search, Compare & Save Section Electronic Gaming Validation  ID
    # iPrice Search, Compare & Save Section Fashion Beauty Validation  ID
    # iPrice Search, Compare & Save Section Coupons Offers Validation  ID
    # iPrice Homepage Recommended Products Validation  ID
    # iPrice Homepage Footer Validation  ID
    # iPrice Access Header Logo Link  ID
    iPrice Search And Select From Suggestion  ID  Apple
    iPrice Header Courtesy Validation  ID
    iPrice Brand Search Result Page Validation  ID  Apple
    iPrice Search Result Listing Validation  ID  Apple
