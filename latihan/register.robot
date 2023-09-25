*** Settings ***
Library     SeleniumLibrary
Resource    ../base/base.robot
Variables   ../resources/data/testdata.py
Variables   ../resources/locators/register_locator.py

*** Keywords ***
Input Register Form
    Input text                         ${InputFirstname}                        ${Firstname}
    Input text                         ${InputLastname}                         ${Lastname}
    Input text                         ${InputEmail}                            ${EmailAddressRegister}
    Input text                         ${InputPassword}                         ${PasswordRegister}
    Input text                         ${InputPasswordConfirmation}             ${ConfirmPasswordRegister}
    Input text                         ${InputPhoneNumber}                      ${PhoneNumber}
    Select Checkbox                    ${RegisterWACheckbox}

Input Register Exclude Email
    Input text                         ${InputFirstname}                        ${Firstname}
    Input text                         ${InputLastname}                         ${Lastname}
    Input text                         ${InputPassword}                         ${PasswordRegister}
    Input text                         ${InputPasswordConfirmation}             ${ConfirmPasswordRegister}
    Input text                         ${InputPhoneNumber}                      ${PhoneNumber}
    Select Checkbox                    ${RegisterWACheckbox}

Send and Verify OTP
    Click element                       //button[@id='plugin-sendotp-btn']
    Sleep                               30
    Click element                       //button[@id='plugin-verifyotp-btn']
    
    
*** Test Cases ***
Register Valid 
    Start Test
    Sleep                                                                              5
    Click element                       //a[@id='header-menu-btnregister']
    Press Keys                          None                                           ESC
    Input Register Form
    Send and Verify OTP
    Click element                       //button[@id='register-btnRegister']
    Wait Until Element Is Visible       //h2[normalize-space()='Account information']
    Element Should Be Visible           //h2[normalize-space()='Account information']
    Close Browser

Register With Email Field Is Empty
    Start Test
    Sleep                                                                              5
    Click element                       //a[@id='header-menu-btnregister']
    Press Keys                          None                                           ESC
    Input Register Exclude Email
    Send and Verify OTP
    Click element                       //button[@id='register-btnRegister']
    Wait Until Element Is Visible       //p[normalize-space()='Email is required']
    Element Should Be Visible           //p[normalize-space()='Email is required']
    Close Browser