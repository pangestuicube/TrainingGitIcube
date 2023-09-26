*** Settings ***
Library     SeleniumLibrary
#Resource    login.robot

*** Variables ***
${URL}            https://pwa.getswift.asia/
${WebDriverPath}  C:/WebDrivers/chromedriver.exe
${WebDriverPath}  C:/WebDrivers/chromedriver.exe
${EmailAddress}   carlo.wardhana@gmail.com
${FirstName}      carlo
${LastName}       wardhana
${Email}          yosaphat.carlo@sirclo.com
${Password}       Password123
${ConfirmPassword}  Password123
${Telepon}        081802688386
${Whatsapp}       081802688386
${InputFirstName}  //input[@id='register-firstname-textfield']
${InputLastName}   //input[@id='register-lastname-textfield']
${InputEmail}     //input[@id='register-email-textfield']
${InputPassword}  //input[@id='register-password-passfield']
${InputConfirmPassword}  //input[@id='register-passwordConfirm-textfield']
${InputPhone}  //input[@type="tel"]
${Newsletter}    //input[@id='newsletter']
${CheckboxWA}    //input[@id='register-waRegitered-checkbox']
${InputOTP}  //input[@id='register-otp-textfield']
#${InputWhatsapp}  //body/div[@id='__next']/main[@id='maincontent']/form[@class='col-md-6 jss456']/div[@class='MuiFormControl-root jss474 MuiFormControl-fullWidth']/div[@class='PhoneInput']/input[1]

#tambahkan keyword lain jika diperlukan

*** Keywords ***
Start Test
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Create WebDriver    Chrome      chrome_options=${options}  executable_path=${WebDriverPath}
    Go to                               ${URL}
    Maximize Browser Window
    Set selenium speed                  0.2

Input Register Form
    [Arguments]                        ${FirstName}    ${LastName}    ${Email}    ${Password}    ${ConfirmPassword}    ${Telepon}    ${Whatsapp}
    Input Text    ${InputFirstName}    ${FirstName}
    Input Text    ${InputLastName}     ${LastName}
    Input Text    ${InputEmail}        ${Email}
    Input Text    ${InputPassword}     ${Password}
    Input Text    ${InputConfirmPassword}    ${ConfirmPassword}
    Input Text    ${InputPhone}    ${Telepon}
    Click Element    //main[@id='maincontent']//div[1]//div[2]//div[1]//div[1]
    Sleep    20
    Click Element  //main[@id='maincontent']//div[1]//div[2]//div[1]//div[1]
    Click Element    ${CheckboxWA}
    #Input Text    ${InputWhatsapp}     ${Whatsapp} 
    Click Element  //span[@class='MuiTypography-root jss130 jss138 jss144 jss149 jss124 jss140 MuiTypography-caption MuiTypography-alignLeft']

    # lengkapi code berikut

Input Register Form Empty Email
    [Arguments]                        ${FirstName}    ${LastName}    ${Password}    ${ConfirmPassword}    ${Telepon}    ${Whatsapp}
    Input Text    ${InputFirstName}    ${FirstName}
    Input Text    ${InputLastName}     ${LastName}

    Input Text    ${InputPassword}     ${Password}
    Input Text    ${InputConfirmPassword}    ${ConfirmPassword}
    Input Text    ${InputPhone}    ${Telepon}
    #Click Element    //button[@id='plugin-sendotp-btn']
    Sleep    20
    #Click Element  //button[@id='plugin-verifyotp-btn']
    Click Element    ${CheckboxWA}
    #Input Text    ${InputWhatsapp}     ${Whatsapp} 
    Click Element  //button[@id='register-btnRegister']


*** Test Cases ***
Register Valid 
    Start Test
    Sleep                                                                              5
    Click element                       //a[@id='header-menu-btnregister']
    Sleep    5
    Wait Until Element Is Visible      ${Newsletter}
    Press Keys                          None                                           ESC
    Input Register Form                 ${FirstName}  ${LastName}  ${Email}  ${Password}  ${ConfirmPassword}  ${Telepon}  ${Whatsapp}      
    # lengkapi code berikut
    Close Browser

Register With Email Field Is Empty
    Start Test
    Sleep                                                                              5
    Click element                      //a[@id='header-menu-btnregister']  
    Wait Until Element Is Visible      ${Newsletter}
    Press Keys                         None                                           ESC
    Input Register Form Empty Email    ${FirstName}    ${LastName}    ${Password}    ${ConfirmPassword}    ${Telepon}    ${Whatsapp}
    Element Should Be Visible          //p[normalize-space()='Email is required']
    # lengkapi code berikut
    Close Browser