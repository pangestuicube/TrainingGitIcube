*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource         ../latihan/data/base.robot
Variables        ../latihan/data/testdata.py
Variables        ../latihan/locator.py

*** Test Cases ***
Login with Valid Credential
    Start Test
    Sleep                                                                              5
    Click Element                    ${TombolLogin} 
    Press Keys                          None                                           ESC
    Input text                       ${LoginEmail}                ${EmailAddress}
    Input text                       ${LoginPassword}             ${Password}
    Click element                    ${LoginButton}
    Wait Until Element Is Visible    ${MyAccount}
    Element Should Be Visible        ${MyAccount}
    Close Browser


Login with invalid Credential
    Start Test
    Sleep    5
    Click Element                    ${TombolLogin}  
    Press Keys                          None                                           ESC
    Input text                       ${LoginEmail}                ${EmailAddress}
    Input text                       ${LoginPassword}             ${FailedPassword}
    Click element                    ${LoginButton}
    Wait Until Element Is Visible    ${FailedLoginAlert}
    Element Should Be Visible        ${FailedLoginAlert}
    Sleep                                                                              5
    Close Browser