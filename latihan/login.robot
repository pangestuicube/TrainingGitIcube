*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://pwa.getswift.asia/
#tambahkan variable lain jika diperlukan

*** Keywords ***
Input Login Form

*** Test Cases ***
Login with Valid Credential
    Open Browser                        ${URL}       ${Browser}
    Maximize Browser Window
    # lengkapi code berikut
    Close Browser

Login with Invalid Credential
    Open Browser                        ${URL}       ${Browser}
    Maximize Browser Window
    # lengkapi code berikut
    Close Browser