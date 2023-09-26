*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${Url}            https://pwa.getswift.asia/
${WebDriverPath}  C:/WebDrivers/chromedriver.exe
${Email}          carlo.wardhana@gmail.com
${Password}       Password123
${Newsletter}     //input[@id='newsletter']
${InputEmail}     //input[@id='login-email-textfield']
${InputPassword}  //input[@id='login-password-passfield']
${InvalidEmail}   carlo.wardhana
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
    Wait Until Element Is Visible       ${Newsletter}
    Press Keys                          None                                           ESC
    Input Login Form                    ${Email}                                ${Password}      
    Click Element                       //button[@id='login-signin-button']
    Wait Until Element Is Visible       //h2[normalize-space()='Account information']
    Element Should Be Visible           //h2[normalize-space()='Account information']

    #Wait Until Element Is Visible       //div[@role='alert']
    #Element Should Be Visible           //div[@role='alert']
Login with Invalid Credential
    Start Test
    Sleep                                                                              5
    Click element                       //a[@id='header-menu-btnsign']
    Sleep    10
    #Page Should Contain    ${Newsletter}
    #Wait Until Element Is Visible    ${Newsletter}    30
    Press Keys                          None                                           ESC
    Input Login Form                    ${InvalidEmail}                                ${Password}      
    Click Element                       //button[@id='login-signin-button']
    Wait Until Element Is Visible       //p[normalize-space()='Email is not valid']    
    Element Should Be Visible           //p[normalize-space()='Email is not valid']
    #tambahkan code mu disini
    Close Browser