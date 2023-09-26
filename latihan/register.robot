*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource         ../latihan/data/base.robot
Variables        ../latihan/data/testdata.py
Variables        ../latihan/locator.py


*** Test Cases ***
Input Register Form
    Start Test
    Sleep                                                                              5
    Click element                    ${TombolSignIn}
    Press Keys                          None                                           ESC
    Input text                       ${RgsFirstName}                   ${Name}
    Input text                       ${RgsLastName}                    ${Lastname}
    Input text                       ${RgsEmail}                       ${EmailAddress}
    Input text                       ${RgsPassword}                    ${Password}
    Input text                       ${RgsPasswordConfirm}             ${PasswordConfirm}
    Input text                       ${NomorHP}                        ${NoHP}
    Click element                    ${SendOTP}
    Sleep                                                                20
    Click Element                    ${ChecklistBox}
    Sleep                                                                 3
    Click Element                    ${CreateAccount}
    Wait Until Element Is Visible    ${MyAccount}
    Element Should Be Visible        ${MyAccount}
    Sleep                                                                              5
    Close Browser

Register With Email Field Is Empty
    Start Test
    Sleep    5
    Click element                    ${TombolSignIn}
    Press Keys                          None                                           ESC
    # Input text                       ${RgsFirstName}                   ${Name}
    # Input text                       ${RgsLastName}                    ${Lastname}
    # Input text                       ${RgsEmail}                       ${FailedEmail}
    # Input textfield                  ${RgsPassword}                    ${Password}
    # Input text                       ${RgsPasswordConfirm}             ${passwordConfirm}
    # Input text                       ${NomorHP}                        ${NoHP}
    # Click element                    ${SendOTP}
    # Sleep                                                               20
    # Click Element                    ${ChecklistBox}
    # Sleep                                                                3
    Click Element                    ${CreateAccount}
    Wait Until Element Is Visible    ${MyAccount}
    Element Should Be Visible        ${MyAccount}
    Sleep                                                                              5
    Close Browser

