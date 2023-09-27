*** Settings ***
Library     SeleniumLibrary
Resource    ../base/base.robot
Resource    ../pages/register.robot
Variables   ../resources/data/testdata.py
Variables   ../resources/locators/register_locator.py
    
*** Test Cases ***
Register Valid 
    Start Test
    Wait Until Element Is Visible       ${LinkToRegister}
    Click element                       ${LinkToRegister}
    Press Keys                          None                                           ESC
    Input Register Form                  ${Firstname}        ${Lastname}        ${EmailAddressRegister}        ${PasswordRegister}        ${ConfirmPasswordRegister}        ${PhoneNumber} 
    Send and Verify OTP
    Click element                       ${ButtonRegister}
    Wait Until Element Is Visible       ${MyAccountPage}
    Element Should Be Visible           ${MyAccountPage}
    Close Browser

Register With Email Field Is Empty
    Start Test
    Wait Until Element Is Visible       ${LinkToRegister}
    Click element                       ${LinkToRegister}
    Press Keys                          None                                           ESC
    Input Register Form                  ${Firstname}        ${Lastname}        ${EmptyData}        ${PasswordRegister}        ${ConfirmPasswordRegister}        ${PhoneNumber}
    Send and Verify OTP
    Click element                       ${ButtonRegister}
    Wait Until Element Is Visible       ${LabelEmailRequired}
    Element Should Be Visible           ${LabelEmailRequired}
    Close Browser