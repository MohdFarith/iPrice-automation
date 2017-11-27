*** Settings ***

Documentation  This file will only store keywords for site map.

*** Variables ***

${sessionName}  iprice

*** Keywords ***

Create New Request Session  [Arguments]  ${country}
    Run Keyword If  "${country}"=="my"  Create Session  ${sessionName}  https://iprice.my  disable_warnings=1
    ...  ELSE IF  "${country}"=="id"  Create Session  ${sessionName}  https://iprice.co.id  disable_warnings=1
    ...  ELSE IF  "${country}"=="vn"  Create Session  ${sessionName}  https://iprice.vn  disable_warnings=1
    ...  ELSE IF  "${country}"=="th"  Create Session  ${sessionName}  https://ipricethailand.com  disable_warnings=1
    ...  ELSE IF  "${country}"=="sg"  Create Session  ${sessionName}  https://iprice.sg  disable_warnings=1
    ...  ELSE IF  "${country}"=="ph"  Create Session  ${sessionName}  https://iprice.ph  disable_warnings=1
    ...  ELSE IF  "${country}"=="hk"  Create Session  ${sessionName}  https://iprice.hk  disable_warnings=1

Get Request Response Content
    ${resp}  Get Request  ${sessionName}  /sitemap_index.xml
    Set Suite Variable  ${body}  ${resp.content}

Get All Main Links
    ${count}  Get Element Count  ${body}  sitemap/loc
    ${newCount}  Evaluate  ${count}+1
    @{linkList}  Create List
    :For  ${index}  In Range  1  ${newCount}
    \  ${links}  XML.Get Element Text  ${body}  sitemap[${index}]/loc
    \  Append To List  ${linkList}  ${links}
    Set Suite Variable  @{linkList}

Get All Main Links Request  [Arguments]  ${country}
    :For  ${ELEMENT}  IN  @{linkList}
    \  ${link}  Run Keyword If  "${country}"=="MY"  Replace String  ${ELEMENT}  https://iprice.my  ${empty}
    \  ...  ELSE IF  "${country}"=="ID"  Replace String  ${ELEMENT}  https://iprice.co.id  ${empty}
    \  ...  ELSE IF  "${country}"=="VN"  Replace String  ${ELEMENT}  https://iprice.vn  ${empty}
    \  ...  ELSE IF  "${country}"=="TH"  Replace String  ${ELEMENT}  https://ipricethailand.com  ${empty}
    \  ...  ELSE IF  "${country}"=="SG"  Replace String  ${ELEMENT}  https://iprice.sg  ${empty}
    \  ...  ELSE IF  "${country}"=="PH"  Replace String  ${ELEMENT}  https://iprice.ph  ${empty}
    \  ...  ELSE IF  "${country}"=="HK"  Replace String  ${ELEMENT}  https://iprice.hk  ${empty}
    \  ${resp}  Get Request  ${sessionName}  ${link}
    \  Run Keyword If  "${resp.status_code}" == "400"  Retry Get All Main Links Request  ${link}
    \  ...  ELSE IF  "${resp.status_code}" == "404"  Run Keyword And Continue On Failure  Fail  Request to ${Element} failed.

Retry Get All Main Links Request  [Arguments]  ${link}
    :FOR  ${INDEX}  IN RANGE  0  500
    \  ${resp}  Get Request  ${sessionName}  ${link}
    \  Run Keyword If  "${resp.status_code}" == "200"  Exit For Loop
    \  ...  ELSE IF  "${resp.status_code}" == "404"  Run Keyword And Continue On Failure  Fail  Request to ${Element} failed.

Get All Main Price Comparison Link
    @{priceComparisonList}  Create List
    :For  ${ELEMENT}  IN  @{linkList}
    \  ${status}  Run Keyword And Return Status  Should Contain  ${ELEMENT}  price-comparison
    \  Run Keyword If  "${status}" == "True"  Append To List  ${priceComparisonList}  ${ELEMENT}
    Set Suite Variable  ${priceComparisonList}

Get All Price Comparison Links  [Arguments]  ${country}
    :For  ${ELEMENT}  IN  @{priceComparisonList}
    \  ${link}  Run Keyword If  "${country}"=="MY"  Replace String  ${ELEMENT}  https://iprice.my  ${empty}
    \  ...  ELSE IF  "${country}"=="ID"  Replace String  ${ELEMENT}  https://iprice.co.id  ${empty}
    \  ...  ELSE IF  "${country}"=="VN"  Replace String  ${ELEMENT}  https://iprice.vn  ${empty}
    \  ...  ELSE IF  "${country}"=="TH"  Replace String  ${ELEMENT}  https://ipricethailand.com  ${empty}
    \  ...  ELSE IF  "${country}"=="SG"  Replace String  ${ELEMENT}  https://iprice.sg  ${empty}
    \  ...  ELSE IF  "${country}"=="PH"  Replace String  ${ELEMENT}  https://iprice.ph  ${empty}
    \  ...  ELSE IF  "${country}"=="HK"  Replace String  ${ELEMENT}  https://iprice.hk  ${empty}
    \  ${resp}  Get Request  ${sessionName}  ${link}
    \  Run Keyword If  "${resp.status_code}" != "200"  Price Comparison Failed  ${ELEMENT}
    \  ...  ELSE IF  "${resp.status_code}" == "200"  Price Comparison Success  ${resp.content}

Price Comparison Success  [Arguments]  ${resp.content}
    @{priceComparisonLinks}  Create List
    ${count}  Get Element Count  ${resp.content}  url/loc
    ${newCount}  Evaluate  ${count}+1
    :For  ${index}  In Range  1  ${newCount}
    \  ${pcLinks}  XML.Get Element Text  ${resp.content}  url[${index}]/loc
    \  Append To List  ${priceComparisonLinks}  ${pcLinks}
    Set Suite Variable  ${priceComparisonLinks}

Price Comparison Failed  [Arguments]  ${ELEMENT}
    Run Keyword And Continue On Failure  Fail  Request to ${ELEMENT} failed.
