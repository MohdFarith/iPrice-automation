*** Settings ***
Documentation  This file stored all functions only.

Library  ExcelLibrary
Library  RequestsLibrary
Library  String
Library  Collections
Library  LangDetection.py

*** Keywords ***

Open Excel File  [Arguments]  ${filename}
    Open Excel  ${filename}
    Sleep  1

Get URL From Excel File
    ${rowCount}  Get Row Count  Sheet1
    @{IDlink}  Create List
    @{MYlink}  Create List
    @{PHlink}  Create List
    :For  ${INDEX}  IN RANGE  1  ${rowCount}
    \  ${rowValue}  Get Row Values  Sheet1  ${index}
    \  ${rowLink}  Get From List  ${rowValue}  0
    \  ${rowLinkValue}  Get From List  ${rowLink}  1
    \  ${status1}  Run Keyword And Return Status  Should Start With  ${rowLinkValue}  https://iprice.co.id
    \  ${status2}  Run Keyword And Return Status  Should Start With  ${rowLinkValue}  https://iprice.my
    \  ${status3}  Run Keyword And Return Status  Should Start With  ${rowLinkValue}  https://iprice.ph
    \  Run Keyword If  "${status1}" == "True"  Get URL For ID  ${rowLinkValue}  ${IDlink}
    \  ...  ELSE IF  "${status2}" == "True"  Get URL For MY  ${rowLinkValue}  ${MYlink}
    \  ...  ELSE IF  "${status3}" == "True"  Get URL For PH  ${rowLinkValue}  ${PHlink}
    Set Suite Variable  ${IDlink}
    Set Suite Variable  ${MYlink}
    Set Suite Variable  ${PHlink}

Get URL For ID  [Arguments]  ${rowLinkValue}  ${IDlink}
    ${url}  Split String  ${rowLinkValue}  /
    ${shortURL}  Get From List  ${url}  -2
    Append To List  ${IDlink}  ${shortURL}

Get URL For MY  [Arguments]  ${rowLinkValue}  ${MYlink}
    ${url}  Split String  ${rowLinkValue}  /
    ${shortURL}  Get From List  ${url}  -2
    Append To List  ${MYlink}  ${shortURL}

Get URL For PH  [Arguments]  ${rowLinkValue}  ${PHlink}
    ${url}  Split String  ${rowLinkValue}  /
    ${shortURL}  Get From List  ${url}  -2
    Append To List  ${PHlink}  ${shortURL}

Get SKU From Excel File
    ${rowCount}  Get Row Count  Sheet1
    @{IDSKU}  Create List
    @{MYSKU}  Create List
    @{PHSKU}  Create List
    :For  ${INDEX}  IN RANGE  1  ${rowCount}
    \  ${rowValue}  Get Row Values  Sheet1  ${index}
    \  ${rowLink}  Get From List  ${rowValue}  0
    \  ${rowLinkValue}  Get From List  ${rowLink}  1
    \  ${status1}  Run Keyword And Return Status  Should Start With  ${rowLinkValue}  https://iprice.co.id
    \  ${status2}  Run Keyword And Return Status  Should Start With  ${rowLinkValue}  https://iprice.my
    \  ${status3}  Run Keyword And Return Status  Should Start With  ${rowLinkValue}  https://iprice.ph
    \  Run Keyword If  "${status1}" == "True"  Get SKU For ID  ${rowValue}  ${IDSKU}
    \  ...  ELSE IF  "${status2}" == "True"  Get SKU For MY  ${rowValue}  ${MYSKU}
    \  ...  ELSE IF  "${status3}" == "True"  Get SKU For PH  ${rowValue}  ${PHSKU}
    Set Suite Variable  ${IDSKU}
    Set Suite Variable  ${MYSKU}
    Set Suite Variable  ${PHSKU}

Get SKU For ID  [Arguments]  ${rowValue}  ${IDSKU}
    ${rowSKU}  Get From List  ${rowValue}  2
    ${rowSKUValue}  Get From List  ${rowSKU}  1
    Append To List  ${IDSKU}  ${rowSKUValue}

Get SKU For MY  [Arguments]  ${rowValue}  ${MYSKU}
    ${rowSKU}  Get From List  ${rowValue}  2
    ${rowSKUValue}  Get From List  ${rowSKU}  1
    Append To List  ${MYSKU}  ${rowSKUValue}

Get SKU For PH  [Arguments]  ${rowValue}  ${PHSKU}
    ${rowSKU}  Get From List  ${rowValue}  2
    ${rowSKUValue}  Get From List  ${rowSKU}  1
    Append To List  ${PHSKU}  ${rowSKUValue}

Create New Request Session  [Arguments]  ${sessionName}  ${url}  ${keyName}  ${keyValue}
    ${header}  Create Dictionary  ${keyName}  ${keyValue}
    Create Session  ${sessionName}  ${url}  ${header}  disable_warnings=1

Delete All Request Session
    Delete All Sessions

Get Expert Rating Response  [Arguments]  ${get_type}  ${country}
    # ${list_length}  Run Keyword If  "${get_type}"=="url"  Get Length  ${url_list}
    # ...  ELSE IF  "${get_type}"=="sku"  Get Length  ${sku_list}
    ${list_length}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get Length  ${IDlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get Length  ${MYlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get Length  ${PHlink}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get Length  ${IDSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get Length  ${MYSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get Length  ${PHSKU}
    :For  ${index}  In Range  0  ${list_length}
    \  ${list_value}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get From List  ${IDlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get From List  ${MYlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get From List  ${PHlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get From List  ${IDSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get From List  ${MYSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get From List  ${PHSKU}  ${INDEX}
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/expert-rating?product_url=${list_value}&cc=${country}
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/expert-rating?product_id=${list_value}&cc=${country}
    \  Run Keyword If  "${resp.status_code}"=="404"  Expert Rating Response 404 Error  ${list_value}
    \  ...  ELSE IF  "${resp.status_code}"=="429"  Retry Expert Rating Response  ${list_value}  ${get_type}  ${country}
    \  ...  ELSE IF  "${resp.status_code}"=="200"   Expert Rating Response 200  ${resp}

Retry Expert Rating Response  [Arguments]  ${list_value}  ${get_type}  ${country}
    :FOR  ${index}  In Range  0  500
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/expert-rating?product_url=${list_value}&cc=${country}
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/expert-rating?product_id=${listvalue}&cc=${country}
    \  Run Keyword If  "${resp.status_code}"=="404"  Expert Rating Response 404 Error  ${list_value}
    \  Run Keyword If  "${resp.status_code}"=="404"  Exit For Loop
    \  Run Keyword If  "${resp.status_code}"=="200"  Expert Rating Response 200  ${resp}
    \  Run Keyword If  "${resp.status_code}"=="200"  Exit For Loop

Expert Rating Response 404 Error  [Arguments]  ${list_value}
    Run Keyword And Continue On Failure  Fail  Request to ${list_value} failed
    # Log  Request to ${list_value} failed  level=ERROR

Expert Rating Response 200  [Arguments]  ${resp}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}  To Json  ${resp.content}
    # Should Not Be Empty  ${jsondata['data'][4]['rating']}
    ${rating}  Get Variable Value  ${jsondata['data']['rating']}
    Run Keyword If  ${rating}<0  Run Keyword And Continue On Failure  Fail  Rating not returned.

Get Expert Rating Response Without Identifier  [Arguments]  ${country}
    ${resp}  Get Request  iprice  /v1/expert-rating?cc=${country}
    Run Keyword If  "${resp.status_code}"=="400"  Correct Expert Rating Response Without Identifier  ${resp}
    ...  ELSE IF  "${resp.status_code}"=="429"  Retry Expert Rating Response Without Identifier  ${country}

Correct Expert Rating Response Without Identifier  [Arguments]  ${resp}
    Should Be Equal As Strings  ${resp.status_code}  400
    ${jsondata}  To Json  ${resp.content}
    Should Be Equal  ${jsondata['message']}  Neither 'product_url' nor 'product_id' is specified

Retry Expert Rating Response Without Identifier  [Arguments]  ${country}
    :FOR  ${index}  In Range  0  500
    \  ${resp}  Get Request  iprice  /v1/expert-rating?cc=${country}
    \  Run Keyword If  "${resp.status_code}"=="400"  Correct Expert Rating Response Without Identifier  ${resp}
    \  Run Keyword If  "${resp.status_code}"=="400"  Exit For Loop

Get Expert Rating Response Without Country  [Arguments]  ${get_type}  ${country}
    ${list_length}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get Length  ${IDlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get Length  ${MYlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get Length  ${PHlink}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get Length  ${IDSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get Length  ${MYSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get Length  ${PHSKU}
    :For  ${index}  In Range  0  ${list_length}
    \  ${list_value}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get From List  ${IDlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get From List  ${MYlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get From List  ${PHlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get From List  ${IDSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get From List  ${MYSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get From List  ${PHSKU}  ${INDEX}
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/expert-rating?product_url=${list_value}
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/expert-rating?product_id=${list_value}
    \  Run Keyword If  "${resp.status_code}"=="400"  Correct Expert Rating Response Without Country  ${resp}
    \  ...  ELSE IF  "${resp.status_code}"=="429"  Retry Expert Rating Response Without Country  ${list_value}  ${get_type}

Correct Expert Rating Response Without Country  [Arguments]  ${resp}
    Should Be Equal As Strings  ${resp.status_code}  400
    ${jsondata}  To Json  ${resp.content}
    Should Be Equal  ${jsondata['message']}  Missing required request parameters: [cc]

Retry Expert Rating Response Without Country  [Arguments]  ${list_value}  ${get_type}
    :FOR  ${index}  In Range  0  500
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/expert-rating?product_url=${list_value}
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/expert-rating?product_id=${listvalue}
    \  Run Keyword If  "${resp.status_code}"=="400"  Correct Expert Rating Response Without Country  ${resp}
    \  Run Keyword If  "${resp.status_code}"=="400"  Exit For Loop

Get Expert Reviews Response  [Arguments]  ${get_type}  ${country}
    ${list_length}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get Length  ${IDlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get Length  ${MYlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get Length  ${PHlink}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get Length  ${IDSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get Length  ${MYSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get Length  ${PHSKU}
    :For  ${index}  In Range  0  ${list_length}
    \  ${list_value}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get From List  ${IDlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get From List  ${MYlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get From List  ${PHlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get From List  ${IDSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get From List  ${MYSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get From List  ${PHSKU}  ${INDEX}
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/expert-reviews?product_url=${list_value}&cc=${country}
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/expert-reviews?product_id=${list_value}&cc=${country}
    \  Run Keyword If  "${resp.status_code}"=="404"  Expert Reviews Response 404 Error  ${list_value}  ${resp}
    \  ...  ELSE IF  "${resp.status_code}"=="429"  Retry Expert Reviews Response  ${list_value}  ${get_type}  ${country}
    \  ...  ELSE IF  "${resp.status_code}"=="200"   Expert Reviews Response 200  ${resp}

Retry Expert Reviews Response  [Arguments]  ${list_value}  ${get_type}  ${country}
    :FOR  ${index}  In Range  0  500
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/expert-reviews?product_url=${list_value}&cc=${country}
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/expert-reviews?product_id=${listvalue}&cc=${country}
    \  Run Keyword If  "${resp.status_code}"=="404"  Expert Reviews Response 404 Error  ${list_value}  ${resp}
    \  Run Keyword If  "${resp.status_code}"=="404"  Exit For Loop
    \  Run Keyword If  "${resp.status_code}"=="200"  Expert Reviews Response 200  ${resp}
    \  Run Keyword If  "${resp.status_code}"=="200"  Exit For Loop

Expert Reviews Response 404 Error  [Arguments]  ${list_value}  ${resp}
    Should Be Equal As Strings  ${resp.status_code}  404
    ${jsondata}  To Json  ${resp.content}
    ${status}  Run Keyword And Return Status  Should Be Equal  ${jsondata['message']}  No review found
    Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to ${list_value} failed
    ...  ELSE IF  "${status}"=="True"  Run Keyword And Continue On Failure  Fail  No expert reviews found for ${list_value}
    # Log  Request to ${list_value} failed  level=ERROR

Expert Reviews Response 200  [Arguments]  ${resp}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}  To Json  ${resp.content}
    # Should Not Be Empty  ${jsondata['data'][4]['rating']}
    ${review}  Get Variable Value  ${jsondata['data']['expertReviews']}
    Run Keyword If  ${review}<0  Run Keyword And Continue On Failure  Fail  Rating not returned.

Get Expert Reviews Response With Max Review  [Arguments]  ${get_type}  ${country}  ${maxReview}
    ${list_length}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get Length  ${IDlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get Length  ${MYlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get Length  ${PHlink}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get Length  ${IDSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get Length  ${MYSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get Length  ${PHSKU}
    :For  ${index}  In Range  0  ${list_length}
    \  ${list_value}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get From List  ${IDlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get From List  ${MYlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get From List  ${PHlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get From List  ${IDSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get From List  ${MYSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get From List  ${PHSKU}  ${INDEX}
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/expert-reviews?product_url=${list_value}&cc=${country}&max_reviews=${maxReview}
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/expert-reviews?product_id=${list_value}&cc=${country}&max_reviews=${maxReview}
    \  Run Keyword If  "${resp.status_code}"=="404"  Expert Reviews With Max Review Response 404 Error  ${list_value}  ${resp}
    \  ...  ELSE IF  "${resp.status_code}"=="429"  Retry Expert Reviews With Max Review Response  ${list_value}  ${get_type}  ${country}  ${maxReview}
    \  ...  ELSE IF  "${resp.status_code}"=="200"   Expert Reviews With Max Review Response 200  ${resp}  ${maxReview}

Expert Reviews With Max Review Response 404 Error  [Arguments]  ${list_value}  ${resp}
    Should Be Equal As Strings  ${resp.status_code}  404
    ${jsondata}  To Json  ${resp.content}
    ${status}  Run Keyword And Return Status  Should Be Equal  ${jsondata['message']}  No review found
    Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to ${list_value} failed
    ...  ELSE IF  "${status}"=="True"  Run Keyword And Continue On Failure  Fail  No expert reviews with max review found for ${list_value}
    # Log  Request to ${list_value} failed  level=ERROR

Retry Expert Reviews With Max Review Response  [Arguments]  ${list_value}  ${get_type}  ${country}  ${maxReview}
    :FOR  ${index}  In Range  0  500
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/expert-reviews?product_url=${list_value}&cc=${country}&max_reviews=${maxReview}
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/expert-reviews?product_id=${listvalue}&cc=${country}&max_reviews=${maxReview}
    \  Run Keyword If  "${resp.status_code}"=="404"  Expert Reviews With Max Review Response 404 Error  ${list_value}  ${resp}
    \  Run Keyword If  "${resp.status_code}"=="404"  Exit For Loop
    \  Run Keyword If  "${resp.status_code}"=="200"  Expert Reviews With Max Review Response 200  ${resp}  ${maxReview}
    \  Run Keyword If  "${resp.status_code}"=="200"  Exit For Loop

Expert Reviews With Max Review Response 200  [Arguments]  ${resp}  ${maxReview}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}  To Json  ${resp.content}
    # Should Not Be Empty  ${jsondata['data'][4]['rating']}
    ${review}  Get Length  ${jsondata['data']['expertReviews']}
    # ${review}  Get Variable Value  ${jsondata['data']['expertReviews']}
    Run Keyword If  ${review}>${maxReview}  Run Keyword And Continue On Failure  Fail  Max review exceed expectation.

Get Expert Reviews Response With Only Local  [Arguments]  ${get_type}  ${country}
    ${list_length}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get Length  ${IDlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get Length  ${MYlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get Length  ${PHlink}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get Length  ${IDSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get Length  ${MYSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get Length  ${PHSKU}
    :For  ${index}  In Range  0  ${list_length}
    \  ${list_value}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get From List  ${IDlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get From List  ${MYlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get From List  ${PHlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get From List  ${IDSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get From List  ${MYSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get From List  ${PHSKU}  ${INDEX}
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/expert-reviews?product_url=${list_value}&cc=${country}&only_local=true
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/expert-reviews?product_id=${list_value}&cc=${country}&only_local=true
    \  Run Keyword If  "${resp.status_code}"=="404"  Expert Reviews With Only Local Response 404 Error  ${list_value}  ${resp}
    \  ...  ELSE IF  "${resp.status_code}"=="429"  Retry Expert Reviews With Only Local Response  ${list_value}  ${get_type}  ${country}
    \  ...  ELSE IF  "${resp.status_code}"=="200"   Expert Reviews With Only Local Response 200  ${resp}  ${country}

Expert Reviews With Only Local Response 404 Error  [Arguments]  ${list_value}  ${resp}
    Should Be Equal As Strings  ${resp.status_code}  404
    ${jsondata}  To Json  ${resp.content}
    ${status}  Run Keyword And Return Status  Should Be Equal  ${jsondata['message']}  No review found
    Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to ${list_value} failed
    ...  ELSE IF  "${status}"=="True"  Run Keyword And Continue On Failure  Fail  No expert reviews with only local found for ${list_value}
    # Log  Request to ${list_value} failed  level=ERROR

Retry Expert Reviews With Only Local Response  [Arguments]  ${list_value}  ${get_type}  ${country}
    :FOR  ${index}  In Range  0  500
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/expert-reviews?product_url=${list_value}&cc=${country}&only_local=true
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/expert-reviews?product_id=${listvalue}&cc=${country}&only_local=true
    \  Run Keyword If  "${resp.status_code}"=="404"  Expert Reviews With Only Local Response 404 Error  ${list_value}  ${resp}
    \  Run Keyword If  "${resp.status_code}"=="404"  Exit For Loop
    \  Run Keyword If  "${resp.status_code}"=="200"  Expert Reviews With Only Local Response 200  ${resp}  ${country}
    \  Run Keyword If  "${resp.status_code}"=="200"  Exit For Loop

Expert Reviews With Only Local Response 200  [Arguments]  ${resp}  ${country}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}  To Json  ${resp.content}
    ${review}  Get Length  ${jsondata['data']['expertReviews']}
    :FOR  ${INDEX}  In Range  0  ${review}
    \  ${string}  Get Variable Value  ${jsondata['data']['expertReviews'][${INDEX}]['snippet']}
    \  ${locale}  detect locale  ${string}
    \  Run Keyword If  "${locale}"!="${country}"  Run Keyword And Continue On Failure  Fail  Locale returned not local.

Get Expert Reviews Response With Max Review And Local Only  [Arguments]  ${get_type}  ${country}  ${maxReview}
    ${list_length}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get Length  ${IDlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get Length  ${MYlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get Length  ${PHlink}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get Length  ${IDSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get Length  ${MYSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get Length  ${PHSKU}
    :For  ${index}  In Range  0  ${list_length}
    \  ${list_value}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get From List  ${IDlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get From List  ${MYlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get From List  ${PHlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get From List  ${IDSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get From List  ${MYSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get From List  ${PHSKU}  ${INDEX}
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/expert-reviews?product_url=${list_value}&cc=${country}&max_reviews=${maxReview}&only_local=true
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/expert-reviews?product_id=${list_value}&cc=${country}&max_reviews=${maxReview}&only_local=true
    \  Run Keyword If  "${resp.status_code}"=="404"  Expert Reviews With Max Review And Only Local Response 404 Error  ${list_value}  ${resp}
    \  ...  ELSE IF  "${resp.status_code}"=="429"  Retry Expert Reviews With Max Review And Only Local Response  ${list_value}  ${get_type}  ${country}  ${maxReview}
    \  ...  ELSE IF  "${resp.status_code}"=="200"   Expert Reviews With Max Review And Local Only Response 200  ${resp}  ${country}  ${maxReview}

Expert Reviews With Max Review And Only Local Response 404 Error  [Arguments]  ${list_value}  ${resp}
    Should Be Equal As Strings  ${resp.status_code}  404
    ${jsondata}  To Json  ${resp.content}
    ${status}  Run Keyword And Return Status  Should Be Equal  ${jsondata['message']}  No review found
    Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  Request to ${list_value} failed
    ...  ELSE IF  "${status}"=="True"  Run Keyword And Continue On Failure  Fail  No expert reviews with only local found for ${list_value}

Retry Expert Reviews With Max Review And Only Local Response  [Arguments]  ${list_value}  ${get_type}  ${country}  ${maxReview}
    :FOR  ${index}  In Range  0  500
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/expert-reviews?product_url=${list_value}&cc=${country}&max_reviews=${maxReview}&only_local=true
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/expert-reviews?product_id=${listvalue}&cc=${country}&max_reviews=${maxReview}&only_local=true
    \  Run Keyword If  "${resp.status_code}"=="404"  Expert Reviews With Max Review And Only Local Response 404 Error  ${list_value}  ${resp}
    \  Run Keyword If  "${resp.status_code}"=="404"  Exit For Loop
    \  Run Keyword If  "${resp.status_code}"=="200"  Expert Reviews With Max Review And Local Only Response 200  ${resp}  ${country}  ${maxReview}
    \  Run Keyword If  "${resp.status_code}"=="200"  Exit For Loop

Expert Reviews With Max Review And Local Only Response 200  [Arguments]  ${resp}  ${country}  ${maxReview}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}  To Json  ${resp.content}
    ${review}  Get Length  ${jsondata['data']['expertReviews']}
    :FOR  ${INDEX}  In Range  0  ${review}
    \  ${string}  Get Variable Value  ${jsondata['data']['expertReviews'][${INDEX}]['snippet']}
    \  ${locale}  detect locale  ${string}
    \  Run Keyword If  "${locale}"!="${country}"  Run Keyword And Continue On Failure  Fail  Locale returned not local.
    \  Run Keyword If  ${review}>${maxReview}  Run Keyword And Continue On Failure  Fail  Max review exceed expectation.

Get Expert Reviews Response With Max Review And Local Only Without Identifier  [Arguments]  ${country}  ${maxReview}
    ${resp}  Get Request  iprice  /v1/expert-reviews?&cc=${country}&max_reviews=${maxReview}&only_local=true
    Run Keyword If  "${resp.status_code}"=="400"  Correct Expert Reviews Response With Max Review And Local Only Without Identifier  ${resp}
    ...  ELSE IF  "${resp.status_code}"=="429"  Retry Expert Reviews Response With Max Review And Local Only Without Identifier  ${country}  ${maxReview}

Correct Expert Reviews Response With Max Review And Local Only Without Identifier  [Arguments]  ${resp}
    Should Be Equal As Strings  ${resp.status_code}  400
    ${jsondata}  To Json  ${resp.content}
    Should Be Equal  ${jsondata['message']}  Neither 'product_url' nor 'product_id' is specified

Retry Expert Reviews Response With Max Review And Local Only Without Identifier  [Arguments]  ${country}  ${maxReview}
    :FOR  ${index}  In Range  0  500
    \  ${resp}  Get Request  iprice  /v1/expert-reviews?&cc=${country}&max_reviews=${maxReview}&only_local=true
    \  Run Keyword If  "${resp.status_code}"=="400"  Correct Expert Rating Response Without Identifier  ${resp}
    \  Run Keyword If  "${resp.status_code}"=="400"  Exit For Loop

Get Expert Reviews Response With Max Review And Local Only Without Country  [Arguments]  ${get_type}  ${country}  ${maxReview}
    ${list_length}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get Length  ${IDlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get Length  ${MYlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get Length  ${PHlink}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get Length  ${IDSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get Length  ${MYSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get Length  ${PHSKU}
    :For  ${index}  In Range  0  ${list_length}
    \  ${list_value}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get From List  ${IDlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get From List  ${MYlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get From List  ${PHlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get From List  ${IDSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get From List  ${MYSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get From List  ${PHSKU}  ${INDEX}
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/expert-rating?product_url=${list_value}&max_reviews=${maxReview}&only_local=true
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/expert-rating?product_id=${list_value}&max_reviews=${maxReview}&only_local=true
    \  Run Keyword If  "${resp.status_code}"=="400"  Correct Expert Reviews Response With Max Review And Local Only Without Country  ${resp}
    \  ...  ELSE IF  "${resp.status_code}"=="429"  Retry Expert Reviews Response With Max Review And Local Only Without Country  ${list_value}  ${get_type}    ${maxReview}

Correct Expert Reviews Response With Max Review And Local Only Without Country  [Arguments]  ${resp}
    Should Be Equal As Strings  ${resp.status_code}  400
    ${jsondata}  To Json  ${resp.content}
    Should Be Equal  ${jsondata['message']}  Missing required request parameters: [cc]

Retry Expert Reviews Response With Max Review And Local Only Without Country  [Arguments]  ${list_value}  ${get_type}    ${maxReview}
    :FOR  ${index}  In Range  0  500
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/expert-rating?product_url=${list_value}
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/expert-rating?product_id=${listvalue}&max_reviews=${maxReview}&only_local=true
    \  Run Keyword If  "${resp.status_code}"=="400"  Correct Expert Reviews Response With Max Review And Local Only Without Country  ${resp}
    \  Run Keyword If  "${resp.status_code}"=="400"  Exit For Loop

Get Price List Response  [Arguments]  ${get_type}  ${country}
    ${list_length}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get Length  ${IDlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get Length  ${MYlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get Length  ${PHlink}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get Length  ${IDSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get Length  ${MYSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get Length  ${PHSKU}
    :For  ${index}  In Range  0  ${list_length}
    \  ${list_value}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get From List  ${IDlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get From List  ${MYlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get From List  ${PHlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get From List  ${IDSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get From List  ${MYSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get From List  ${PHSKU}  ${INDEX}
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/price-list?product_url=${list_value}&cc=${country}
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/price-list?product_id=${list_value}&cc=${country}
    \  Run Keyword If  "${resp.status_code}"=="404"  Price List Response 404 Error  ${list_value}
    \  ...  ELSE IF  "${resp.status_code}"=="429"  Retry Price List Response  ${list_value}  ${get_type}  ${country}
    \  ...  ELSE IF  "${resp.status_code}"=="200"   Price List Response 200  ${resp}

Retry Price List Response  [Arguments]  ${list_value}  ${get_type}  ${country}
    :FOR  ${index}  In Range  0  500
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/price-list?product_url=${list_value}&cc=${country}
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/price-list?product_id=${listvalue}&cc=${country}
    \  Run Keyword If  "${resp.status_code}"=="404"  Price List Response 404 Error  ${list_value}
    \  Run Keyword If  "${resp.status_code}"=="404"  Exit For Loop
    \  Run Keyword If  "${resp.status_code}"=="200"  Price List Response 200  ${resp}
    \  Run Keyword If  "${resp.status_code}"=="200"  Exit For Loop

Price List Response 404 Error  [Arguments]  ${list_value}
    Run Keyword And Continue On Failure  Fail  Request to ${list_value} failed
    # Log  Request to ${list_value} failed  level=ERROR

Price List Response 200  [Arguments]  ${resp}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}  To Json  ${resp.content}
    # Should Not Be Empty  ${jsondata['data'][4]['rating']}
    ${storeLength}  Get Length  ${jsondata['data']['stores']}
    :FOR  ${INDEX}  In Range  0  ${storeLength}
    \  ${price1}  Get Variable Value  ${jsondata['data']['stores'][${INDEX}]['sale_price']}
    \  ${price2}  Get Variable Value  ${jsondata['data']['stores'][${INDEX}]['original_price']}
    \  Run Keyword If  ${price1}<0 and ${price2}<0  Run Keyword And Continue On Failure  Fail  Price less than 0.

Get Price List Response With Max Merchant  [Arguments]  ${get_type}  ${country}  ${maxMerchant}
    ${list_length}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get Length  ${IDlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get Length  ${MYlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get Length  ${PHlink}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get Length  ${IDSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get Length  ${MYSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get Length  ${PHSKU}
    :For  ${index}  In Range  0  ${list_length}
    \  ${list_value}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get From List  ${IDlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get From List  ${MYlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get From List  ${PHlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get From List  ${IDSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get From List  ${MYSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get From List  ${PHSKU}  ${INDEX}
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/price-list?product_url=${list_value}&cc=${country}&max_merchants=${maxMerchant}
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/price-list?product_id=${list_value}&cc=${country}&max_merchants=${maxMerchant}
    \  Run Keyword If  "${resp.status_code}"=="404"  Price List With Max Merchant Response 404 Error  ${list_value}  ${resp}
    \  ...  ELSE IF  "${resp.status_code}"=="429"  Retry Price List With Max Merchant Response  ${list_value}  ${get_type}  ${country}  ${maxMerchant}
    \  ...  ELSE IF  "${resp.status_code}"=="200"   Price List With Max Merchant Response 200  ${resp}  ${maxMerchant}

Price List With Max Merchant Response 404 Error  [Arguments]  ${list_value}  ${resp}
    Should Be Equal As Strings  ${resp.status_code}  404
    ${jsondata}  To Json  ${resp.content}
    ${status}  Run Keyword And Return Status  Should Be Equal  ${jsondata['message']}  Product not found
    Run Keyword If  "${status}"=="True"  Run Keyword And Continue On Failure  Fail  Request to ${list_value} failed
    ...  ELSE IF  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  No price list found for ${list_value}
    # Log  Request to ${list_value} failed  level=ERROR

Retry Price List With Max Merchant Response  [Arguments]  ${list_value}  ${get_type}  ${country}  ${maxMerchant}
    :FOR  ${index}  In Range  0  500
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/price-list?product_url=${list_value}&cc=${country}&max_merchants=${maxMerchant}
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/price-list?product_id=${listvalue}&cc=${country}&max_merchants=${maxMerchant}
    \  Run Keyword If  "${resp.status_code}"=="404"  Price List With Max Merchant Response 404 Error  ${list_value}  ${resp}
    \  Run Keyword If  "${resp.status_code}"=="404"  Exit For Loop
    \  Run Keyword If  "${resp.status_code}"=="200"  Price List With Max Merchant Response 200  ${resp}  ${maxMerchant}
    \  Run Keyword If  "${resp.status_code}"=="200"  Exit For Loop

Price List With Max Merchant Response 200  [Arguments]  ${resp}  ${maxMerchant}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}  To Json  ${resp.content}
    # Should Not Be Empty  ${jsondata['data'][4]['rating']}
    ${stores}  Get Length  ${jsondata['data']['stores']}
    # ${review}  Get Variable Value  ${jsondata['data']['expertReviews']}
    Run Keyword If  ${stores}>${maxMerchant}  Run Keyword And Continue On Failure  Fail  Max review exceed expectation.

Get Price List Response With Pref Merchant  [Arguments]  ${get_type}  ${country}
    ${list_length}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get Length  ${IDlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get Length  ${MYlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get Length  ${PHlink}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get Length  ${IDSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get Length  ${MYSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get Length  ${PHSKU}
    :For  ${index}  In Range  0  ${list_length}
    \  ${list_value}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get From List  ${IDlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get From List  ${MYlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get From List  ${PHlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get From List  ${IDSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get From List  ${MYSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get From List  ${PHSKU}  ${INDEX}
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/price-list?product_url=${list_value}&cc=${country}&pref_merchant=true
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/price-list?product_id=${list_value}&cc=${country}&pref_merchant=true
    \  Run Keyword If  "${resp.status_code}"=="404"  Price List With Pref Merchant Response 404 Error  ${list_value}  ${resp}
    \  ...  ELSE IF  "${resp.status_code}"=="429"  Retry Price List With Pref Merchant Response  ${list_value}  ${get_type}  ${country}
    \  ...  ELSE IF  "${resp.status_code}"=="200"   Price List With Pref Merchant Response 200  ${resp}

Price List With Pref Merchant Response 404 Error  [Arguments]  ${list_value}  ${resp}
    Should Be Equal As Strings  ${resp.status_code}  404
    ${jsondata}  To Json  ${resp.content}
    ${status}  Run Keyword And Return Status  Should Be Equal  ${jsondata['message']}  Product not found
    Run Keyword If  "${status}"=="True"  Run Keyword And Continue On Failure  Fail  Request to ${list_value} failed
    ...  ELSE IF  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  No price list found for ${list_value}
    # Log  Request to ${list_value} failed  level=ERROR

Retry Price List With Pref Merchant Response  [Arguments]  ${list_value}  ${get_type}  ${country}
    :FOR  ${index}  In Range  0  500
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/price-list?product_url=${list_value}&cc=${country}&pref_merchant=true
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/price-list?product_id=${listvalue}&cc=${country}&pref_merchant=true
    \  Run Keyword If  "${resp.status_code}"=="404"  Price List With Pref Merchant Response 404 Error  ${list_value}  ${resp}
    \  Run Keyword If  "${resp.status_code}"=="404"  Exit For Loop
    \  Run Keyword If  "${resp.status_code}"=="200"  Price List With Pref Merchant Response 200  ${resp}
    \  Run Keyword If  "${resp.status_code}"=="200"  Exit For Loop

Price List With Pref Merchant Response 200  [Arguments]  ${resp}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}  To Json  ${resp.content}
    # Should Not Be Empty  ${jsondata['data'][4]['rating']}
    ${stores}  Get Length  ${jsondata['data']['stores']}
    # ${review}  Get Variable Value  ${jsondata['data']['expertReviews']}
    Run Keyword If  ${stores}<0  Run Keyword And Continue On Failure  Fail  No pref merchant returned.

Get Price List Response With RRP And Pref Merchant  [Arguments]  ${get_type}  ${country}
    # ${list_length}  Run Keyword If  "${get_type}"=="url"  Get Length  ${url_list}
    # ...  ELSE IF  "${get_type}"=="sku"  Get Length  ${sku_list}
    ${list_length}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get Length  ${IDlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get Length  ${MYlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get Length  ${PHlink}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get Length  ${IDSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get Length  ${MYSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get Length  ${PHSKU}
    :For  ${index}  In Range  0  ${list_length}
    \  ${list_value}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get From List  ${IDlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get From List  ${MYlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get From List  ${PHlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get From List  ${IDSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get From List  ${MYSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get From List  ${PHSKU}  ${INDEX}
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/price-list?product_url=${list_value}&cc=${country}&pref_merchant=true&rrp=true
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/price-list?product_id=${list_value}&cc=${country}&pref_merchant=true&rrp=true
    \  Run Keyword If  "${resp.status_code}"=="404"  Price List With RRP And Pref Merchant Response 404 Error  ${list_value}  ${resp}
    \  ...  ELSE IF  "${resp.status_code}"=="429"  Retry Price List With RRP And Pref Merchant Response  ${list_value}  ${get_type}  ${country}
    \  ...  ELSE IF  "${resp.status_code}"=="200"   Price List With RRP And Pref Merchant Response 200  ${resp}

Price List With RRP And Pref Merchant Response 404 Error  [Arguments]  ${list_value}  ${resp}
    Should Be Equal As Strings  ${resp.status_code}  404
    ${jsondata}  To Json  ${resp.content}
    ${status}  Run Keyword And Return Status  Should Be Equal  ${jsondata['message']}  Product not found
    Run Keyword If  "${status}"=="True"  Run Keyword And Continue On Failure  Fail  Request to ${list_value} failed
    ...  ELSE IF  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  No price list found for ${list_value}
    # Log  Request to ${list_value} failed  level=ERROR

Retry Price List With RRP And Pref Merchant Response  [Arguments]  ${list_value}  ${get_type}  ${country}
    :FOR  ${index}  In Range  0  500
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/price-list?product_url=${list_value}&cc=${country}&pref_merchant=true&rrp=true
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/price-list?product_id=${listvalue}&cc=${country}&pref_merchant=true&rrp=true
    \  Run Keyword If  "${resp.status_code}"=="404"  Price List With RRP And Pref Merchant Response 404 Error  ${list_value}  ${resp}
    \  Run Keyword If  "${resp.status_code}"=="404"  Exit For Loop
    \  Run Keyword If  "${resp.status_code}"=="200"  Price List With RRP And Pref Merchant Response 200  ${resp}
    \  Run Keyword If  "${resp.status_code}"=="200"  Exit For Loop

Price List With RRP And Pref Merchant Response 200  [Arguments]  ${resp}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}  To Json  ${resp.content}
    # Should Not Be Empty  ${jsondata['data'][4]['rating']}
    ${stores}  Get Length  ${jsondata['data']['stores']}
    # ${review}  Get Variable Value  ${jsondata['data']['expertReviews']}
    Run Keyword If  ${stores}<0  Run Keyword And Continue On Failure  Fail  No rrp and pref merchant returned.

Get Price List With Aff Custom Response  [Arguments]  ${get_type}  ${country}  ${affCustom}
    ${list_length}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get Length  ${IDlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get Length  ${MYlink}
    ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get Length  ${PHlink}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get Length  ${IDSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get Length  ${MYSKU}
    ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get Length  ${PHSKU}
    :For  ${index}  In Range  0  ${list_length}
    \  ${list_value}  Run Keyword If  "${get_type}" == "url" and "${country}" == "id"  Get From List  ${IDlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "my"  Get From List  ${MYlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "url" and "${country}" == "ph"  Get From List  ${PHlink}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "id"  Get From List  ${IDSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "my"  Get From List  ${MYSKU}  ${INDEX}
    \  ...  ELSE IF  "${get_type}" == "sku" and "${country}" == "ph"  Get From List  ${PHSKU}  ${INDEX}
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/price-list?product_url=${list_value}&cc=${country}&aff_custom=${affCustom}
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/price-list?product_id=${list_value}&cc=${country}&aff_custom=${affCustom}
    \  Run Keyword If  "${resp.status_code}"=="404"  Price List With Aff Custom Response 404 Error  ${list_value}
    \  ...  ELSE IF  "${resp.status_code}"=="429"  Retry Price List With Aff Custom Response  ${list_value}  ${get_type}  ${country}  ${affCustom}
    \  ...  ELSE IF  "${resp.status_code}"=="200"   Price List With Aff Custom Response 200  ${resp}  ${affCustom}

Retry Price List With Aff Custom Response  [Arguments]  ${list_value}  ${get_type}  ${country}  ${affCustom}
    :FOR  ${index}  In Range  0  500
    \  ${resp}  Run Keyword If  "${get_type}"=="url"  Get Request  iprice  /v1/price-list?product_url=${list_value}&cc=${country}&aff_custom=${affCustom}
    \  ...  ELSE IF  "${get_type}"=="sku"  Get Request  iprice  /v1/price-list?product_id=${listvalue}&cc=${country}&aff_custom=${affCustom}
    \  Run Keyword If  "${resp.status_code}"=="404"  Price List With Aff Custom Response 404 Error  ${list_value}
    \  Run Keyword If  "${resp.status_code}"=="404"  Exit For Loop
    \  Run Keyword If  "${resp.status_code}"=="200"  Price List With Aff Custom Response 200  ${resp}  ${affCustom}
    \  Run Keyword If  "${resp.status_code}"=="200"  Exit For Loop

Price List With Aff Custom Response 404 Error  [Arguments]  ${list_value}
    Run Keyword And Continue On Failure  Fail  Request to ${list_value} failed
    # Log  Request to ${list_value} failed  level=ERROR

Price List With Aff Custom Response 200  [Arguments]  ${resp}  ${affCustom}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}  To Json  ${resp.content}
    # Should Not Be Empty  ${jsondata['data'][4]['rating']}
    ${storeLength}  Get Length  ${jsondata['data']['stores']}
    :FOR  ${INDEX}  In Range  0  ${storeLength}
    \  ${custom}  Run Keyword And Continue On Failure  Should Contain  ${jsondata['data']['stores'][${INDEX}]['url']}  aff_custom=${affCustom}
