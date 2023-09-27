*** Settings ***
Library     SeleniumLibrary
Resource    ../base/base.robot
Resource    ../pages/login_page.robot
Variables    ../resources/locators/base_locator.py
Variables    ../resources/locators/my_account_locator.py

*** Test Cases ***
Login with Valid Credential
    [Tags]    Login
    Start Test
    Wait Until Element Is Visible       ${LinkToSignIn}
    Click element                       ${LinkToSignIn}
    Wait Until Element Is Visible       ${NewslattetPopup}
    Press Keys                          None                                           ESC
    Input Login Form                    ${EmailAddress}                                ${Password}      
    Click Element                       ${ButtonLogin}
    Wait Until Element Is Visible       ${AccountInformationTitle}
    Element Should Be Visible           ${AccountInformationTitle}
    Close Browser

Login with Invalid Credential
    [Tags]    Login
    Start Test
    Wait Until Element Is Visible       ${LinkToSignIn}
    Click element                       ${LinkToSignIn}
    Wait Until Element Is Visible       ${NewslattetPopup}
    Press Keys                          None                                           ESC
    Input Login Form                    ${EmailAddress}                                ${WrongPassword}      
    Click Element                       ${ButtonLogin}
    Wait Until Element Is Visible       ${ErrorPopup}
    Element Should Be Visible           ${ErrorPopup}
    Close Browser