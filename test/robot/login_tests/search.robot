*** Settings ***
Library  Selenium2Library
Documentation     Search string
Suite Setup  Open Browser To Login Page
Suite Teardown     Close All Browsers
*** Variables ***
${SERVER}         google.in
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     demo
${VALID PASSWORD}    mode
${LOGIN URL}      http://${SERVER}/
${WELCOME URL}    http://${SERVER}/welcome.html
${ERROR URL}      http://${SERVER}/error.html

*** Keywords ***

*** Test Cases ***
Valid Login
    User Searches and Check results     demo

Search Ravi
    User Searches and Check results     buddharaju

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}

User Searches and Check results
    [Arguments]  ${key}
    Input Text  id=lst-ib   ${key}
    Click Button    id=_fZl
    wait Until Page Contains    ${key}
