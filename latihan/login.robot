*** Settings ***
Library     SeleniumLibrary
Resource    ../base/base.robot
Resource    ../pages/login.robot
Variables   ../resources/data/testdata.py
Variables   ../resources/locators/login_locator.py

*** Test Cases ***
Login with Valid Credential
    Start Test
    Wait Until Element Is Visible       ${LinkToLogin}
    Click element                       ${LinkToLogin}
    Press Keys                          None                                                ESC
    Input Login Form                    ${EmailAddressLogin}                                ${PasswordLogin}      
    Click Element                       ${ButtonLogin}
    Wait Until Element Is Visible       ${MyAccountPage}
    Element Should Be Visible           ${MyAccountPage}
    Close Browser

Login with Invalid Credential
    Start Test
    Wait Until Element Is Visible       ${LinkToLogin}
    Click element                       ${LinkToLogin}
    Press Keys                          None                                                ESC
    Input Login Form                    ${EmailAddressLogin}                                ${WrongPasswordLogin}      
    Click Element                       ${ButtonLogin}
    Wait Until Element Is Visible       ${MessageErrorLogin}
    Element Should Be Visible           ${MessageErrorLogin}
    Close Browser