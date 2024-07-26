*** Settings ***
Library    SeleniumLibrary



*** Variables ***
${browser}    chrome
${url}    https://www.google.com
${CHROME.OPTIONS}    --window-size=1200*800    --disable-notifications

*** Test Cases ***
Open Browser With Chrome Options
    Open Browser    ${url}    ${browser}    chrome.options=${CHROME.OPTIONS}
    Maximize Browser Window
    Go To    ${url}
    Title Should Be    Google