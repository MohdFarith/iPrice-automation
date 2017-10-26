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

Test Expert Reviews With URL For ID
    [tags]  ip4b  review  reviewCase1  id
    Open Excel File  ${excel_file}
    Get URL From Excel File  id
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Reviews Response  url  id
    Delete All Request Session

Test Expert Reviews With URL For MY
    [tags]  ip4b  review  reviewCase2  my
    Open Excel File  ${excel_file}
    Get URL From Excel File  my
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Reviews Response  url  my
    Delete All Request Session

Test Expert Reviews With URL For PH
    [tags]  ip4b  review  reviewCase3  ph
    Open Excel File  ${excel_file}
    Get URL From Excel File  ph
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Reviews Response  url  ph
    Delete All Request Session

Test Expert Reviews With SKU For ID
    [tags]  ip4b  review  reviewCase4  id
    Open Excel File  ${excel_file}
    Get SKU From Excel File  id
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Reviews Response  sku  id
    Delete All Request Session

Test Expert Reviews With SKU For MY
    [tags]  ip4b  review  reviewCase5  my
    Open Excel File  ${excel_file}
    Get SKU From Excel File  my
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Reviews Response  sku  my
    Delete All Request Session

Test Expert Reviews With SKU For PH
    [tags]  ip4b  review  reviewCase6  ph
    Open Excel File  ${excel_file}
    Get SKU From Excel File  ph
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Reviews Response  sku  ph
    Delete All Request Session

Test Expert Reviews With Max Review For ID
    [tags]  ip4b  review  reviewCase7  id
    Open Excel File  ${excel_file}
    Get URL From Excel File  id
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Reviews Response With Max Review  url  id  2
    Delete All Request Session

Test Expert Reviews With Max Review For MY
    [tags]  ip4b  review  reviewCase8  my
    Open Excel File  ${excel_file}
    Get URL From Excel File  my
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Reviews Response With Max Review  url  my  2
    Delete All Request Session

Test Expert Reviews With Max Review For PH
    [tags]  ip4b  review  reviewCase9  ph
    Open Excel File  ${excel_file}
    Get URL From Excel File  ph
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Reviews Response With Max Review  url  ph  2
    Delete All Request Session

Test Expert Reviews With Only Local For ID
    [tags]  ip4b  review  reviewCase10  id
    Open Excel File  ${excel_file}
    Get URL From Excel File  id
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Reviews Response With Only Local  url  id
    Delete All Request Session

Test Expert Reviews With Only Local For MY
    [tags]  ip4b  review  reviewCase11  my
    Open Excel File  ${excel_file}
    Get URL From Excel File  my
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Reviews Response With Only Local  url  my
    Delete All Request Session

Test Expert Reviews With Only Local For PH
    [tags]  ip4b  review  reviewCase12  ph
    Open Excel File  ${excel_file}
    Get URL From Excel File  ph
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Reviews Response With Only Local  url  ph
    Delete All Request Session

Test Expert Reviews With Max Review And Only Local For ID
    [tags]  ip4b  review  reviewCase13  id
    Open Excel File  ${excel_file}
    Get URL From Excel File  id
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Reviews Response With Max Review And Local Only    url  id  2
    Delete All Request Session

Test Expert Reviews With Max Review And Only Local Without Identifier For ID
    [tags]  ip4b  review  reviewCase14  id
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Reviews Response With Max Review And Local Only Without Identifier  id  2
    Delete All Request Session

Test Expert Reviews With Max Review And Only Local Without Identifier For MY
    [tags]  ip4b  review  reviewCase15  my
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Reviews Response With Max Review And Local Only Without Identifier  my  2
    Delete All Request Session

Test Expert Reviews With Max Review And Only Local Without Identifier For PH
    [tags]  ip4b  review  reviewCase16  ph
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Reviews Response With Max Review And Local Only Without Identifier  ph  2
    Delete All Request Session

Test Expert Reviews With Max Review And Only Local Without Country For ID
    [tags]  ip4b  review  reviewCase17  id
    Open Excel File  ${excel_file}
    Get URL From Excel File  id
    Create New Request Session  ${api_sessionName}  ${api_url}  ${api_keyName}  ${api_keyValue}
    Get Expert Reviews Response With Max Review And Local Only Without Country  url  id  2
    Delete All Request Session
