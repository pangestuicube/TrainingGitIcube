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