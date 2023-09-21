*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${Url}            https://pwa.getswift.asia/
${WebDriverPath}  C:/WebDrivers/chromedriver.exe
${EmailAddress}   demo@icube.us
${Password}       Password123
${InputEmail}     //input[@id='login-email-textfield']
${InputPassword}  //input[@id='login-password-passfield']
#tambahkan variable lain jika diperlukan

*** Keywords ***
Start Test
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Create WebDriver    Chrome      chrome_options=${options}  executable_path=${WebDriverPath}  
    Go to                               ${Url}
    Maximize Browser Window
    Set selenium speed                  0.2
    
Input Login Form
    [Arguments]                        ${Email}              ${Password}
    Input text                         ${InputEmail}         ${Email}
    Input text                         ${InputPassword}      ${Password}
*** Test Cases ***
Login with Valid Credential
    Start Test
    Sleep                                                                              5
    Click element                       //a[@id='header-menu-btnsign']
    Press Keys                          None                                           ESC
    Input Login Form                    ${EmailAddress}                                ${Password}      
    Click Element                       //button[@id='login-signin-button']
    Wait Until Element Is Visible       //h2[normalize-space()='Account information']
    Element Should Be Visible           //h2[normalize-space()='Account information']
    Close Browser

Login with Invalid Credential
    Start Test
    #tambahkan code mu disini
    Close Browser