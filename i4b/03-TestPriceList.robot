*** Setting ***
Documentation   A test suite with various tests for expert reviews api.

#Import
Resource  shared-Functions.robot

*** Variables ***

${excel_file}  Product_Listing_RRP.xls
${api_sessionName}  iprice
${api_url}  https://api.ipricegroup.com
${api_keyName}  x-api-key
${api_keyValue}  nk3WQIfDBbMmQeyJpdiI6IjdVMVVIUlw

*** Test Cases ***

Test Price List Witd URL For ID
    [tags]  ip4b  price  priceCase1  id
    Open Excel File  ${excel_file}
    Get URL From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Price List Response  url  id
    Delete All Request Session

Test Price List Witd URL For MY
    [tags]  ip4b  price  priceCase2  my
    Open Excel File  ${excel_file}
    Get URL From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Price List Response  url  my
    Delete All Request Session

Test Price List Witd URL For PH
    [tags]  ip4b  price  priceCase3  ph
    Open Excel File  ${excel_file}
    Get URL From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Price List Response  url  ph
    Delete All Request Session

Test Price List Witd SKU For ID
    [tags]  ip4b  price  priceCase4  id
    Open Excel File  ${excel_file}
    Get SKU From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Price List Response  sku  id
    Delete All Request Session

Test Price List Witd SKU For MY
    [tags]  ip4b  price  priceCase5  my
    Open Excel File  ${excel_file}
    Get SKU From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Price List Response  sku  my
    Delete All Request Session

Test Price List Witd SKU For PH
    [tags]  ip4b  price  priceCase6  ph
    Open Excel File  ${excel_file}
    Get SKU From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Price List Response  sku  ph
    Delete All Request Session

Test Price List With Max Merchant For ID
    [tags]  ip4b  price  priceCase7  id
    Open Excel File  ${excel_file}
    Get URL From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Price List Response With Max Merchant  url  id  2
    Delete All Request Session

Test Price List With Max Merchant For MY
    [tags]  ip4b  price  priceCase8  my
    Open Excel File  ${excel_file}
    Get URL From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Price List Response With Max Merchant  url  my  2
    Delete All Request Session

Test Price List With Max Merchant For PH
    [tags]  ip4b  price  priceCase9  ph
    Open Excel File  ${excel_file}
    Get URL From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Price List Response With Max Merchant  url  ph  2
    Delete All Request Session

Test Price List With Pref Merchant For ID
    [tags]  ip4b  price  priceCase10  id
    Open Excel File  ${excel_file}
    Get URL From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Price List Response With Pref Merchant  url  id
    Delete All Request Session

Test Price List With Pref Merchant For MY
    [tags]  ip4b  price  priceCase11  my
    Open Excel File  ${excel_file}
    Get URL From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Price List Response With Pref Merchant  url  my
    Delete All Request Session

Test Price List With Pref Merchant For PH
    [tags]  ip4b  price  priceCase12  ph
    Open Excel File  ${excel_file}
    Get URL From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Price List Response With Pref Merchant  url  ph
    Delete All Request Session

Test Price List With RRP And Pref Merchant Using SKU For ID
    [tags]  ip4b  price  priceCase13  id
    Open Excel File  ${excel_file}
    Get SKU From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Price List Response With RRP And Pref Merchant  sku  id
    Delete All Request Session

Test Price List With RRP And Pref Merchant Using SKU For MY
    [tags]  ip4b  price  priceCase14  my
    Open Excel File  ${excel_file}
    Get SKU From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Price List Response With RRP And Pref Merchant  sku  my
    Delete All Request Session

Test Price List With RRP And Pref Merchant Using SKU For PH
    [tags]  ip4b  price  priceCase15  ph
    Open Excel File  ${excel_file}
    Get SKU From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Price List Response With RRP And Pref Merchant  sku  ph
    Delete All Request Session

Test Price List With Aff Custom For ID
    [tags]  ip4b  price  priceCase16  id
    Open Excel File  ${excel_file}
    Get URL From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Price List With Aff Custom Response  url  id  customaffvalue
    Delete All Request Session

Test Price List With Aff Custom For MY
    [tags]  ip4b  price  priceCase17  my
    Open Excel File  ${excel_file}
    Get URL From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Price List With Aff Custom Response  url  my  customaffvalue
    Delete All Request Session

Test Price List With Aff Custom For PH
    [tags]  ip4b  price  priceCase18  ph
    Open Excel File  ${excel_file}
    Get URL From Excel File
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Price List With Aff Custom Response  url  ph  customaffvalue
    Delete All Request Session
