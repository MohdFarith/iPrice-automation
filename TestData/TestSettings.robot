*** Settings ***
Documentation    This file will store the configuration.

Library  Selenium2Library
Library  Collections
Library  HttpLibrary.HTTP
Library  String
Library  RequestsLibrary

*** Variables ***

${delay}  1
${baseURL}  about:blank

*** Keywords ***

TestCase Setup  [Arguments]  ${browser}
    Set Selenium Speed  ${DELAY}
    Run Keyword If  "${browser}"=="chrome"  Setup Chrome Browser
    ...  ELSE IF  "${browser}"=="ie"  Setup IE Browser
    ...  ELSE  Open Browser  ${baseURL}  ${browser}
    # Maximize Browser Window
    Set Window Size  1366  768

Setup Chrome Browser
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${options}  add_argument  disable-infobars
    Create WebDriver  Chrome  chrome_options=${options}

Setup IE Browser
    Open Browser  ${baseURL}  IE
    Set Selenium Implicit Wait  30