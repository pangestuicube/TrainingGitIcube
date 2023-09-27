*** Settings ***
Library     SeleniumLibrary
Resource    ../base/base.robot
Resource    ../pages/register_page.robot
Variables   ../resources/locators/base_locator.py
Variables   ../resources/locators/my_account_locator.py

*** Test Cases ***
Register Valid 
    [Tags]    Register
    Start Test
    Wait Until Element Is Visible       ${LinkToRegister}
    Click Element                       ${LinkToRegister}
    Wait Until Element Is Visible       ${NewslattetPopup}
    Press Keys                          None            ESC
    Input Register Form                 ${Firstname}    ${Lastname}    ${EmailAddress}    ${Password}    ${Password}    ${PhoneNumber}
    Send OTP and Verify
    Click Element                       ${ButtonRegister}
    Wait Until Element Is Visible       ${AccountInformationTitle}
    Element Should Be Visible           ${AccountInformationTitle}
Register With Email Field Is Empty
    [Tags]    Register
    Start Test
    Wait Until Element Is Visible       ${LinkToRegister}
    Click Element                       ${LinkToRegister}
    Wait Until Element Is Visible       ${NewslattetPopup}
    Press Keys                          None            ESC
    Input Register Form                 ${Firstname}    ${Lastname}    ${EmtyData}    ${Password}    ${Password}    ${PhoneNumber}
    Send OTP and Verify
    Click Element                       ${ButtonRegister}
    Wait Until Element Is Visible       ${ErrorLabelEmailIsRequired}
    Element Should Be Visible           ${ErrorLabelEmailIsRequired} 
    Close Browser