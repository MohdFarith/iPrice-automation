*** Settings ***

Library  RequestsLibrary

*** Variables ***

${valid_url}  iprice.my/trends
${invalid_url}  iprice.my

*** Keywords ***

*** Test Cases ***

Test One
    Create Session  amp  https://amp.cloudflare.com/q/  disable_warnings=0
    ${resp}  Get Request  amp  ${valid_url}
    ${jsondata}=  To Json  ${resp.content}
    Delete All Sessions

Test Two
    Create Session  amp  https://amp.cloudflare.com/q/  disable_warnings=0
    ${resp}  Get Request  amp  ${invalid_url}
    ${jsondata}=  To Json  ${resp.content}
    Delete All Sessions
