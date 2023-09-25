*** Settings ***
Library     SeleniumLibrary
Library     String
Variables   ../resources/data/testdata.py

*** Keywords ***
Start Test
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Create WebDriver    Chrome      chrome_options=${options}  executable_path=${WebDriverPath}  
    Go to                               ${Url}
    Maximize Browser Window
    Set selenium speed                  0.2