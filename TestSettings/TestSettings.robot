*** Settings ***
Documentation    This file will store the configuration.

Library  Selenium2Library
Library  Collections
Library  HttpLibrary.HTTP
Library  String
Library  RequestsLibrary
Library  XvfbRobot
Library  DateTime

*** Variables ***

${delay}  1
${baseURL}  about:blank
${platform}  linux
${remote_url}  None

*** Keywords ***

TestCase Setup  [Arguments]  ${browser}
    Set Selenium Speed  ${DELAY}
    Run Keyword If  "${platform}"=="linux"  Start Virtual Display  1366  768
    Run Keyword If  "${browser}"=="chrome"  Setup Chrome Browser
    ...  ELSE IF  "${browser}"=="ie"  Setup IE Browser
    ...  ELSE IF  "${browser}"=="chromeMobile"  Setup Chrome Emulation
    ...  ELSE  Open Browser  ${baseURL}  ${browser}
    # Maximize Browser Window
    # ${width}  ${height}  Get Window Size
    Set Window Size  1366  768

Setup Chrome Browser
    Run Keyword If  "${remote_url}"=="None"  Run In Local
    ...  ELSE  Run In Remote

Run In Local
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${options}  add_argument  disable-infobars
    Create WebDriver  Chrome  chrome_options=${options}

    # Open Browser  about:blank  Chrome  remote_url=http://localhost:4444/wd/hub

Run In Remote
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${options}  add_argument  disable-infobars
    ${options}  Call Method  ${options}  to_capabilities
    ${executor}  Evaluate  str("http://localhost:4444/wd/hub")
    Create Webdriver  Remote  command_executor=${executor}  desired_capabilities=${options}

Setup IE Browser
    Open Browser  ${baseURL}  IE
    Set Selenium Implicit Wait  30

Setup Chrome Emulation
    ${mobile emulation}  Create Dictionary  deviceName=Apple iPhone 6
    ${chrome options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${chrome options}  add_experimental_option  mobileEmulation  ${mobile emulation}
    Call Method  ${chrome options}  add_argument  disable-infobars
    Create Webdriver  Chrome  chrome_options=${chrome options}
