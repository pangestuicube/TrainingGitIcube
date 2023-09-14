*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://pwa.getswift.asia/
#tambahkan keyword lain jika diperlukan

*** Keywords ***
Input Register Form

*** Test Cases ***
Register Valid 
    Open Browser                        ${URL}       ${Browser}
    Maximize Browser Window
    # lengkapi code berikut
    Close Browser

Register With Email Field Is Empty
    Open Browser                        ${URL}       ${Browser}
    Maximize Browser Window
    # lengkapi code berikut
    Close Browser