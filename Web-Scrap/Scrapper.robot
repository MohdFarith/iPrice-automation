*** Settings ***

Library  ExcelLibrary
Library  Collections
Library  String
Library  Scrapper.py

*** Variables ***

${url}  https://cellphones.com.vn/mobile.html
${abc}  Apple iPhone X 256GB Chính hãng

*** Keywords ***

Start Scrapper
    ${soup1}  start soup  https://cellphones.com.vn/mobile.html
    Set Test Variable  ${soup1}

Get All Available Page Count
    ${pageCount}  get all pages  ${soup1}
    Set Test Variable  ${pageCount}

Get All Product Link In All Pages
    @{productLinks}  get product link  ${url}  ${pageCount}
    Log  ${productLinks}  level=WARN
    ${productLinksLength}  Get Length  ${productLinks}
    Set Test Variable  @{productLinks}

Get Product Name H1
    @{productNameList}  Create List
    :For  ${ELEMENT}  IN  @{productLinks}
    \  ${productName}  get product name  ${ELEMENT}
    \  Append To List  ${productNameList}  ${productName}
    \  Log  ${productName}  level=WARN

*** Test Cases ***

TestOne
    Start Scrapper
    Get All Available Page Count
    Get All Product Link In All Pages
    Get Product Name H1
