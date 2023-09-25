*** Settings ***
Library     SeleniumLibrary
Resource    ../base/base.robot
Variables   ../resources/data/testdata.py
Variables   ../resources/locators/login_locator.py

*** Keywords ***
Input Login Form
    [Arguments]                        ${EmailAddressLogin}              ${PasswordLogin}
    Input text                         ${InputEmail}         ${EmailAddressLogin}
    Input text                         ${InputPassword}      ${PasswordLogin}

Input Wrong Password
    [Arguments]                        ${EmailAddressLogin}              ${WrongPasswordLogin}
    Input text                         ${InputEmail}         ${EmailAddressLogin}
    Input text                         ${InputPassword}      ${WrongPasswordLogin}


*** Test Cases ***
Login with Valid Credential
    Start Test
    Sleep                                                                              5
    Click element                       //a[@id='header-menu-btnsign']
    Press Keys                          None                                           ESC
    Input Login Form                    ${EmailAddressLogin}                                ${PasswordLogin}      
    Click Element                       //button[@id='login-signin-button']
    Wait Until Element Is Visible       //h2[normalize-space()='Account information']
    Element Should Be Visible           //h2[normalize-space()='Account information']
    Close Browser

Login with Invalid Credential
    Start Test
    Sleep                                                                              5
    Click element                       //a[@id='header-menu-btnsign']
    Press Keys                          None                                           ESC
    Input Wrong Password                ${EmailAddressLogin}                                ${WrongPasswordLogin}      
    Click Element                       //button[@id='login-signin-button']
    Wait Until Element Is Visible       //div[contains(text(),'The account sign-in was incorrect or your account ')]
    Element Should Be Visible           //div[contains(text(),'The account sign-in was incorrect or your account ')]
    Close Browser