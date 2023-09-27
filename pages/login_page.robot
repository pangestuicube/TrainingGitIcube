*** Settings ***
Library     SeleniumLibrary
Resource    ../base/base.robot
Variables   ../resources/locators/login_locator.py

*** Keywords ***
Input Login Form
    [Arguments]                        ${EmailAddress}       ${Password}
    Input text                         ${InputEmail}         ${EmailAddress}
    Input text                         ${InputPassword}      ${Password}