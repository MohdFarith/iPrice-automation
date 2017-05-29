*** Settings ***
Documentation    This file will store the configuration.

Library  Selenium2Library
Library  Collections
Library  HttpLibrary.HTTP
Library  String
Library  RequestsLibrary
Library  XvfbRobot

*** Variables ***

${delay}  1
${baseURL}  about:blank
${platform}  linux

*** Keywords ***

TestCase Setup  [Arguments]  ${browser}
    Set Selenium Speed  ${DELAY}
    Run Keyword If  "${platform}"=="linux"  Start Virtual Display  1366  768
    Run Keyword If  "${browser}"=="chrome"  Setup Chrome Browser
    ...  ELSE IF  "${browser}"=="ie"  Setup IE Browser
    ...  ELSE IF  "${browser}"=="chromeMobile"  Setup Chrome Emulation
    ...  ELSE  Open Browser  ${baseURL}  ${browser}
    # Maximize Browser Window

Setup Chrome Browser
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${options}  add_argument  disable-infobars
    Create WebDriver  Chrome  chrome_options=${options}
    Set Window Size  1366  768

Setup IE Browser
    Open Browser  ${baseURL}  IE
    Set Selenium Implicit Wait  30
    Set Window Size  1366  768

Setup Chrome Emulation
    ${mobile emulation}  Create Dictionary  deviceName=Apple iPhone 6
    ${chrome options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${chrome options}  add_experimental_option  mobileEmulation  ${mobile emulation}
    Call Method  ${chrome options}  add_argument  disable-infobars
    Create Webdriver  Chrome  chrome_options=${chrome options}
