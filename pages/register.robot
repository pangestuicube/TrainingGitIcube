*** Settings ***
Library     SeleniumLibrary
Resource    ../base/base.robot
Variables   ../resources/data/testdata.py
Variables   ../resources/locators/register_locator.py

*** Keywords ***
Input Register Form
    [Arguments]                        ${Firstname}        ${Lastname}        ${EmailAddressRegister}        ${PasswordRegister}        ${ConfirmPasswordRegister}        ${PhoneNumber} 
    Input text                         ${InputFirstname}                        ${Firstname}
    Input text                         ${InputLastname}                         ${Lastname}
    Input text                         ${InputEmail}                            ${EmailAddressRegister}
    Input text                         ${InputPassword}                         ${PasswordRegister}
    Input text                         ${InputPasswordConfirmation}             ${ConfirmPasswordRegister}
    Input text                         ${InputPhoneNumber}                      ${PhoneNumber}
    Select Checkbox                    ${RegisterWACheckbox}

Send and Verify OTP
    Click element                       ${ButtonSendOTP}
    Sleep                               30
    Click element                       ${ButtonVerifyOTP}