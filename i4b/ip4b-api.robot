*** Settings ***

Library  ExcelLibrary
Library  RequestsLibrary

*** Variables ***


*** Keywords ***

Open Excel File  [Arguments]  ${filename}
    Open Excel  ${filename}
    Sleep  1

Get All Row Count  [Arguments]  ${sheetName}
    ${rowCount}  Get Row Count  ${sheetName}
    Set Global Variable  ${rowCount}

Set New Row Range Count  [Arguments]  ${additionalRow}
    ${newRowCount}  Evaluate  ${rowCount}+${additionalRow}
    Set Global Variable  ${newRowCount}

Create New Request Session  [Arguments]  ${sessionName}  ${url}  ${keyName}  ${keyValue}
    ${header}  Create Dictionary  ${keyName}  ${keyValue}
    Create Session  ${sessionName}  ${url}  ${header}  disable_warnings=1

Get Expert Rating Response Using ID  [Arguments]  ${startingRow}  ${endingRow}  ${country}
    :For  ${index}  In Range  ${startingRow}  ${endingRow}
    \  ${value}  Read Cell Data By Name  Sheet1  C${index}
    \  Set Suite Variable  ${value}
    \  ${resp}  Get Request  iprice  /v1/expert-rating?product_id=${value}&cc=${country}
    \  Run Keyword If  "${resp.status_code}"=="404"  Run Keyword And Continue On Failure  Fail  Status 404 returned
    \  ...  ELSE IF  "${resp.status_code}"=="429"  Retry Expert Rating Response Using ID  ${country}
    \  ...  ELSE IF  "${resp.status_code}"=="200"   Should Be Equal As Strings  ${resp.status_code}  200

Retry Expert Rating Response Using ID  [Arguments]  ${country}
    :FOR  ${index}  In Range  0  500
    \  ${resp}  Get Request  iprice  /v1/expert-rating?product_id=${value}&cc=${country}
    \  Run Keyword If  "${resp.status_code}"=="404"  Run Keyword And Continue On Failure  Fail  Status 404 returned
    \  Run Keyword If  "${resp.status_code}"=="404"  Exit For Loop
    \  Run Keyword If  "${resp.status_code}"=="200"  Should Be Equal As Strings  ${resp.status_code}  200
    \  Run Keyword If  "${resp.status_code}"=="200"  Exit For Loop

Get Price List Response Using ID  [Arguments]  ${startingRow}  ${endingRow}  ${rrp}  ${country}  ${pref_merchant}
    :For  ${index}  In Range  ${startingRow}  ${endingRow}
    \  ${value}  Read Cell Data By Name  Sheet1  C${index}
    \  Set Suite Variable  ${value}
    \  ${resp}  Get Request  iprice  /v1/price-list?rrp=${rrp}&cc=${country}&pref_merchant=${pref_merchant}&product_id=${value}
    \  Run Keyword If  "${resp.status_code}"=="404"  Price List 404 Error
    \  ...  ELSE IF  "${resp.status_code}"=="429"  Retry Price List Response Using ID  ${rrp}  ${country}  ${pref_merchant}
    \  ...  ELSE IF  "${resp.status_code}"=="200"   Price List Check Response Data  ${resp}

Price List 404 Error
    Run Keyword And Continue On Failure  Fail  Request to ${value} failed
    Log  Request to ${value} failed  level=ERROR

Retry Price List Response Using ID  [Arguments]  ${rrp}  ${country}  ${pref_merchant}
    :FOR  ${index}  In Range  0  100
    \  ${resp}  Get Request  iprice  /v1/price-list?rrp=${rrp}&cc=${country}&pref_merchant=${pref_merchant}&product_id=${value}
    \  Run Keyword If  "${resp.status_code}"=="404"  Price List 404 Error
    \  Run Keyword If  "${resp.status_code}"=="404"  Exit For Loop
    \  Run Keyword If  "${resp.status_code}"=="200"  Price List Check Response Data  ${resp}
    \  Run Keyword If  "${resp.status_code}"=="200"  Exit For Loop

Price List Check Response Data  [Arguments]  ${resp}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}  To Json  ${resp.content}
    ${status}  Run Keyword And Return Status  Should Not Be Empty  ${jsondata['data']['stores']}
    Run Keyword If  "${status}"=="False"  Handle Empty Store

Handle Empty Store
    Run Keyword And Continue On Failure  Fail  Request to ${value} returned 0 store
    Log  Request to ${value} returned 0 store  level=ERROR

*** Test Cases ***

Test Expert Rating With ID In Indonesia
    [tags]  expert-rating-id
    Open Excel File  Product_Listing_RRP.xls
    Create New Request Session  iprice  https://api.ipricegroup.com  x-api-key  nk3WQIfDBbMmQeyJpdiI6IjdVMVVIUlw
    Get Expert Rating Response Using ID  2  404  id

Test Expert Rating With ID In Malaysia
    [tags]  expert-rating-my
    Open Excel File  Product_Listing_RRP.xls
    Create New Request Session  iprice  https://api.ipricegroup.com  x-api-key  nk3WQIfDBbMmQeyJpdiI6IjdVMVVIUlw
    Get Expert Rating Response Using ID  404  738  my

Test Expert Rating With ID In Philippines
    [tags]  expert-rating-ph
    Open Excel File  Product_Listing_RRP.xls
    Create New Request Session  iprice  https://api.ipricegroup.com  x-api-key  nk3WQIfDBbMmQeyJpdiI6IjdVMVVIUlw
    Get Expert Rating Response Using ID  738  999  ph

Test Price List With ID In Indonesia
    [tags]  price-list-id
    Open Excel File  Product_Listing_RRP.xls
    Create New Request Session  iprice  https://api.ipricegroup.com  x-api-key  eWcQkGIm3n8DYeNqcqIq9EgsIAhFSXQ6FV0QD6Cf
    Get Price List Response Using ID  2  404  true  id  true

Test Price List With ID In Malaysia
    [tags]  price-list-my
    Open Excel File  Product_Listing_RRP.xls
    Create New Request Session  iprice  https://api.ipricegroup.com  x-api-key  nk3WQIfDBbMmQeyJpdiI6IjdVMVVIUlw
    Get Price List Response Using ID  404  738  true  my  true

Test Price List With ID In Philippines
    [tags]  price-list-ph
    Open Excel File  Product_Listing_RRP.xls
    Create New Request Session  iprice  https://api.ipricegroup.com  x-api-key  nk3WQIfDBbMmQeyJpdiI6IjdVMVVIUlw
    Get Price List Response Using ID  738  404  true  ph  true