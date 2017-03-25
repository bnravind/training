*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library
Library     OperatingSystem


*** Variables ***
${BROWSER}        Chrome
${DELAY}          0
${empid}    31608
${WELCOME TITLE}    Spoors Effort

*** Keywords ***
Load env
    ${TestUserName}=    Get Environment Variable    TEST_USERNAME
    ${TestUserEmail}=    Get Environment Variable    TEST_USEREMAIL
    ${TestUserPass}=    Get Environment Variable    TEST_PASSWORD
    ${SERVER}=  Get Environment Variable    TEST_ENV
    Set Global Variable     ${TestUserName}
    Set Global Variable     ${TestUserEmail}
    Set Global Variable     ${TestUserPass}
    Set Global Variable     ${SERVER}
#    ${ERROR URL}      http://${SERVER}/error.html
    Set Global Variable     ${LOGIN URL}    http://${SERVER}/j_spring_security_check
    Set Global Variable     ${WELCOME URL}  http://${SERVER}/web/customer/search/page/new?fill=true&
    Log     ${LOGIN URL}
    Log     ${WELCOME URL}


Valid Login
    Load env
    Log     ${TestUserName}
    Log     ${TestUserEmail}
    Log     ${TestUserPass}
    Open Browser To Login Page
    Input Username    ${TestUserEmail}
    Input Password    ${TestUserPass}
    Wait Until Page Contains        Sign In
    Submit Credentials
    Wait Until Page Contains        ${TestUserName}

Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}

Input Username
    [Arguments]    ${username}
    Input Text    j_username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    j_password    ${password}

Submit Credentials
    Click Button    submit

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}loginEmpName=${TestUserName}&loginEmpId=${empid}
    Title Should Be     ${WELCOME TITLE}
