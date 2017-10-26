*** Settings ***
Library  Selenium2Library

*** Variables ***


*** Keywords ***


*** Test Cases ***

Crazy Tzu Test
    Open Browser  http://www.samsung.com/id/smartphones/galaxy-s7-edge-g935/SM-G935FZBUXID/  chrome
    Maximize Browser Window
    Wait Until Element Is Visible  //a[text()='Beli Sekarang']
    Click Element  //a[text()='Beli Sekarang']
    Sleep  3
    Capture Page Screenshot
    Wait Until Element Is Visible  //span[@id='s-layer-close-span']
    Click Element  //span[@id='s-layer-close-span']
    Wait Until Element Is Not Visible  //span[@id='s-layer-close-span']
    Click Element  //span[@title='GOLD']
    Sleep  3
    Click Element  //a[text()='Beli Sekarang']
    Sleep  3
    Capture Page Screenshot
    Close Browser

Crazy Tzu Test
    Open Browser  http://www.samsung.com/id/smartphones/galaxy-j3-pro/SM-J330GZDDXID/  chrome
    Maximize Browser Window
    Wait Until Element Is Visible  //a[text()='Beli Sekarang']
    Click Element  //a[text()='Beli Sekarang']
    Sleep  3
    Capture Page Screenshot
    Wait Until Element Is Visible  //span[@id='s-layer-close-span']
    Click Element  //span[@id='s-layer-close-span']
    Wait Until Element Is Not Visible  //span[@id='s-layer-close-span']
    Click Element  //span[@title='Hitam']
    Sleep  3
    Click Element  //a[text()='Beli Sekarang']
    Sleep  3
    Capture Page Screenshot
    Wait Until Element Is Visible  //span[@id='s-layer-close-span']
    Click Element  //span[@id='s-layer-close-span']
    Wait Until Element Is Not Visible  //span[@id='s-layer-close-span']
    Click Element  //span[@title='Blue Silver']
    Sleep  3
    Click Element  //a[text()='Beli Sekarang']
    Sleep  3
    Capture Page Screenshot
    Wait Until Element Is Visible  //span[@id='s-layer-close-span']
    Click Element  //span[@id='s-layer-close-span']
    Wait Until Element Is Not Visible  //span[@id='s-layer-close-span']
    Click Element  //span[@title='Merah Muda']
    Sleep  3
    Click Element  //a[text()='Beli Sekarang']
    Sleep  3
    Capture Page Screenshot
    Close Browser