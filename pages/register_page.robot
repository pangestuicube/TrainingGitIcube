*** Settings ***
Library      SeleniumLibrary
Resource     ../base/base.robot
Variables    ../resources/locators/register_locator.py

*** Keywords ***
Input Register Form
    [Arguments]                        ${Firstname}    ${Lastname}    ${EmailAddress}    ${Password}    ${ConfirmPassword}    ${PhoneNumber}
    Input text                         ${InputFirstname}                        ${Firstname}
    Input text                         ${InputLastname}                         ${Lastname}
    Input text                         ${InputEmail}                            ${EmailAddress}
    Input text                         ${InputPassword}                         ${Password}
    Input text                         ${InputPasswordConfirmation}             ${ConfirmPassword}
    Input text                         ${InputPhoneNumber}                      ${PhoneNumber}
    Select Checkbox                    ${RegisterWACheckbox}

Send OTP and Verify
    Click element                      ${ButtonSendOTP}
    Sleep                              40
    Click element                      ${ButtonVerivy}