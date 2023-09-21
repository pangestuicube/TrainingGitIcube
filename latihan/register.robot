*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}            https://pwa.getswift.asia/
${WebDriverPath}  C:/WebDrivers/chromedriver.exe
#tambahkan keyword lain jika diperlukan

*** Keywords ***
Start Test
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Create WebDriver    Chrome      chrome_options=${options}  executable_path=${WebDriverPath}
    Go to                               ${URL}
    Maximize Browser Window
    Set selenium speed                  0.2

Input Register Form
    # lengkapi code berikut

*** Test Cases ***
Register Valid 
    Start Test
    # lengkapi code berikut
    Close Browser

Register With Email Field Is Empty
    Start Test
    # lengkapi code berikut
    Close Browser