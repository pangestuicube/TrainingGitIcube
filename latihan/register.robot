*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}              https://pwa.getswift.asia/
${WebDriverPath}    C:/WebDrivers/chromedriver.exe
${firstname}        Ragil
${lastname}         testing
${email}            qaicube@yopmail.com 
${password}         Qaicube2023
${passwordConfirm}  Qaicube2023
${PhoneNumber}      85230255031






#tambahkan keyword lain jika diperlukan

*** Keywords ***
Start Test
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
     Create WebDriver    Chrome      chrome_options=${options}  executable_path=/Users/atmakaragil/Documents/Automation/pwa-swift-automation-test/chromedriver-mac-arm64/chromedriver
    Go to                               ${URL}
    Maximize Browser Window
    Set selenium speed                  0.2

Input Register Form
    click element   //a[@id="header-menu-btnregister"] 
    Press Keys                          None                                           ESC
    input text      //input[@id="register-firstname-textfield"]         ${firstname}
    input text      //input[@id="register-lastname-textfield"]          ${lastname}
    input text      //input[@id="register-email-textfield"]             ${email}
    input text      //input[@id="register-password-passfield"]          ${password}
    input text      //input[@id="register-passwordConfirm-textfield"]   ${passwordConfirm}
    input text      //input[@type="tel"]                                ${PhoneNumber}
    Click element   //input[@id="register-waRegitered-checkbox"]
    Click element   //button[@id="plugin-sendotp-btn"]
    Sleep           10
    Click element   //button[@id="plugin-verifyotp-btn"]
    Sleep           10
    Click element   //button[@id="register-btnRegister"]
    Sleep           10




    

*** Test Cases ***
Register Valid 
    Start Test
    Input Register Form
    Sleep   10
    # lengkapi code berikut
    Close Browser

Register With Email Field Is Empty
    Start Test
    click element                   //a[@id="header-menu-btnregister"] 
    Press Keys                      None                                           ESC
    input text                      //input[@id="register-firstname-textfield"]         ${firstname}
    input text                      //input[@id="register-lastname-textfield"]          ${lastname}
    input text                      //input[@id="register-password-passfield"]          ${password}
    input text                      //input[@id="register-passwordConfirm-textfield"]   ${passwordConfirm}
    input text                      //input[@type="tel"]                                ${PhoneNumber}
    Click element                   //input[@id="register-waRegitered-checkbox"]
    Click element                   //button[@id="plugin-sendotp-btn"]
    Sleep                           10
    Click element                   //button[@id="plugin-verifyotp-btn"]
    Sleep                           10
    Click element                   //button[@id="register-btnRegister"]
    Sleep                           10
    Wait Until Element Is Visible   //p[@class='MuiTypography-root jss130 jss131 jss146 jss149 jss126 jss142 MuiTypography-body1 MuiTypography-alignLeft']
    Close Browser