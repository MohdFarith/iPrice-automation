*** Settings ***

Library  ExcelLibrary
Library  RequestsLibrary
Library  Collections
Library  String

Library  Remote  http://localhost:${PORT}

*** Variables ***

${valid_url}  iprice.my/trends
${invalid_url}  iprice.my

${HOST}    localhost
${PORT}    8270

*** Keywords ***

Open Excel File
    Open Excel  url_list.xls
    Sleep  1

Get URL From Excel File
    ${rowCount}  Get Row Count  Sheet1
    @{url_list}  Create List
    :For  ${INDEX}  IN RANGE  0  ${rowCount}
    \  ${rowValue}  Get Row Values  Sheet1  ${index}
    \  ${rowLink}  Get From List  ${rowValue}  0
    \  ${rowLinkValue}  Get From List  ${rowLink}  1
    \  ${rowLinkValue}  Replace String  ${rowLinkValue}  https://  ${empty}
    \  ${rowLinkValue}  Replace String  ${rowLinkValue}  http://  ${empty}
    \  Append To List  ${url_list}  ${rowLinkValue}
    \  Log  ${url_list}
    Set Suite Variable  ${url_list}

Create New Api Session
    Create Session  amp  https://amp.cloudflare.com/q/  disable_warnings=0

Validate Page For Amp
    ${url_list_length}  Get Length  ${url_list}
    :For  ${INDEX}  IN RANGE  0  ${url_list_length}
    \  ${url}  Get From List  ${url_list}  ${INDEX}
    \  ${resp}  Get Request  amp  ${url}
    \  ${jsondata}  To Json  ${resp.content}
    \  ${status}  Run Keyword And Return Status  Should Be Equal As Strings  ${resp.json()['valid']}  True
    \  Run Keyword If  "${status}"=="False"  Run Keyword And Continue On Failure  Fail  ${url} is not amp valid.

*** Test Cases ***

Test Amp
    Open Excel File
    Get URL From Excel File
    Create New Api Session
    Validate Page For Amp
    Delete All Sessions

Test NodeJS
    [tags]  2
    ${items1} =    Count Items In Directory    ${CURDIR}
    ${items2} =    Count Items In Directory    ${TEMPDIR}
    Log    ${items1} items in '${CURDIR}' and ${items2} items in '${TEMPDIR}'
