*** Settings ***
Library  Selenium2Library
Documentation     Login Tests
Suite Setup         Valid Login
Suite Teardown     Close All Browsers
Resource    resource.robot


*** Variables ***
${BROWSER}        Chrome
${DELAY}          0

*** Test Cases ***
Check Route Plan
    click Link  xpath=//a[@href='/effort5-2016/web?ifd=0']
    Wait Until Page contains    Route Plan

Route Plan Value Test
    Wait Until Page Contains    diggi work1
    Wait Until Page Contains    110     timeout=60s
    Wait Until Page Contains    280     timeout=60s
    Wait Until Page Contains    813     timeout=60s
    Wait Until Page Contains    24     timeout=60s
    Element should Contain   xpath=//a[@id="emp_without_routeplans"]/span  110

IC Shifting Survey Test
    Wait Until Page Contains    1165     timeout=60s
    Element should Contain   xpath=//div[@id="overdue_2478_circle"]/span  1165
    Element should Contain   xpath=//div[@id="pending2478circle"]/span  1173


*** Keywords ***

#    Welcome Page Should Be Open
#    Welcome Page Should Be Open
#    Page should contain     Madhulika New Company

