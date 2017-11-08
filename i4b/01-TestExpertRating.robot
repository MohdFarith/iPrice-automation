*** Setting ***
Documentation   A test suite with various tests for expert rating api.

#Import
Resource  shared-Functions.robot

*** Variables ***

${excel_file}  Product_Listing_RRP.xls
${api_sessionName}  iprice
${api_url}  https://api.ipricegroup.com
${api_keyName}  x-api-key
${api_keyValue}  nk3WQIfDBbMmQeyJpdiI6IjdVMVVIUlw

*** Test Cases ***

Test Expert Rating With URL For ID
    [tags]  ip4b  rating  ratingCase1  id
    Open Excel File  ${excel_file}
    Get URL From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Rating Response  url  id
    Delete All Request Session

Test Expert Rating With URL For MY
    [tags]  ip4b  rating  ratingCase2  my
    Open Excel File  ${excel_file}
    Get URL From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Rating Response  url  my
    Delete All Request Session

Test Expert Rating With URL For PH
    [tags]  ip4b  rating  ratingCase3  ph
    Open Excel File  ${excel_file}
    Get URL From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Rating Response  url  ph
    Delete All Request Session

Test Expert Rating With SKU For ID
    [tags]  ip4b  rating  ratingCase4  id
    Open Excel File  ${excel_file}
    Get SKU From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Rating Response  sku  id
    Delete All Request Session

Test Expert Rating With SKU For MY
    [tags]  ip4b  rating  ratingCase5  my
    Open Excel File  ${excel_file}
    Get SKU From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Rating Response  sku  my
    Delete All Request Session

Test Expert Rating With SKU For PH
    [tags]  ip4b  rating  ratingCase6  ph
    Open Excel File  ${excel_file}
    Get SKU From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Rating Response  sku  ph
    Delete All Request Session

Test Expert Rating Without Identifier For ID
    [tags]  ip4b  rating  ratingCase8  id
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Rating Response Without Identifier  id
    Delete All Request Session

Test Expert Rating Without Identifier For MY
    [tags]  ip4b  rating  ratingCase9  my
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Rating Response Without Identifier  my
    Delete All Request Session

Test Expert Rating Without Identifier For PH
    [tags]  ip4b  rating  ratingCase10  ph
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Rating Response Without Identifier  ph

Test Expert Rating Without Country For ID Using URL
    [tags]  ip4b  rating  ratingCase11  id
    Open Excel File  ${excel_file}
    Get URL From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Rating Response Without Country  url  id
    Delete All Request Session

Test Expert Rating Without Country For MY Using URL
    [tags]  ip4b  rating  ratingCase12  my
    Open Excel File  ${excel_file}
    Get URL From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Rating Response Without Country  url  my
    Delete All Request Session

Test Expert Rating Without Country For PH Using URL
    [tags]  ip4b  rating  ratingCase13  ph
    Open Excel File  ${excel_file}
    Get URL From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Rating Response Without Country  url  ph
    Delete All Request Session

Test Expert Rating Without Country For ID Using SKU
    [tags]  ip4b  rating  ratingCase14  id
    Open Excel File  ${excel_file}
    Get SKU From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Rating Response Without Country  sku  id
    Delete All Request Session

Test Expert Rating Without Country For MY Using SKU
    [tags]  ip4b  rating  ratingCase15  my
    Open Excel File  ${excel_file}
    Get SKU From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Rating Response Without Country  sku  my
    Delete All Request Session

Test Expert Rating Without Country For PH Using SKU
    [tags]  ip4b  rating  ratingCase16  ph
    Open Excel File  ${excel_file}
    Get SKU From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Rating Response Without Country  SKU  ph
    Delete All Request Session
