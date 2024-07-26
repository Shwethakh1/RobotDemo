*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${CHROME.OPTIONS}    --disable-infobars
${VALID USER}     Admin
${VALID PASSWORD}    admin123
${LOGIN URL}      https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${WELCOME URL}    https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index
${ERROR URL}      https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Keywords ***
Begin Web Test
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys
    Call Method  ${options}  add_argument  --disable-notifications
    Call Method  ${options}  add_argument  --disable-infobars
    Call Method  ${options}  add_argument  --disable-extensions
    RETURN    ${options}

Open Browser To Login Page
    ${options}=    Begin Web Test
    Open Browser    ${LOGIN URL}    ${BROWSER}    chrome.options=${options}
    Maximize Browser Window
    Sleep    3s
    Wait Until Page Contains    OrangeHRM
    Page Title
Page Title
    Title Should Be    OrangeHRM

Input Username
    [Arguments]    ${username}
    Input Text    //input[@placeholder='Username']    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    //input[@placeholder='Password']    ${password}

Submit Credentials
    Click Button    //button[@type='submit']

User Should Not Login
    Location Should Be    ${LOGIN URL}
    Title Should Be    OrangeHRM