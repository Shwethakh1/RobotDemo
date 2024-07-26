*** Settings ***
Documentation     A test suite containing tests related to invalid login.

Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Template     Login With valid Credentials Should Pass
Resource          resource.robot

*** Test Cases ***               USER NAME        PASSWORD
Invalid Username                 invalid          ${VALID PASSWORD}
Invalid Password                 ${VALID USER}    invalid
Invalid Username And Password    invalid          invalid
Empty Username                   ${EMPTY}         ${VALID PASSWORD}
Empty Username And Password      ${EMPTY}         ${EMPTY}
#Valid Login                      ${VALID USER}    ${VALID PASSWORD}

*** Keywords ***
Login With valid Credentials Should Pass
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    resource.Input Password    ${password}
    Submit Credentials
    User Should Not Login
    Sleep    3s


    