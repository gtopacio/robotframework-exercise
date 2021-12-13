*** Settings ***
Documentation       Test File for testing User Logins
Resource            resources.robot

*** Test Cases ***
Successful Login
    Open To Login Page
    Input Username          ${VALID USER}
    Input User Password     ${PASSWORD}
    Attempt Login
    Verify Product Page
    Close Browser
    [Teardown]  Close Browser

Wrong Password
    Open To Login Page
    Input Username          ${VALID USER}
    Input User Password     wrongpass
    Attempt Login
    Element Text Should Be  css=*[data-test="error"]     Epic sadface: Username and password do not match any user in this service
    [Teardown]  Close Browser

Problem User
    Open To Login Page
    Input Username  ${PROB USER}
    Input User Password  ${PASSWORD}
    Attempt Login
    Page Should Contain Image       css=img[src="/static/media/sl-404.168b1cce.jpg"]
    [Teardown]  Close Browser

Locked Out User
    Open To Login Page
    Input Username  ${LOCKED USER}
    Input User Password  ${PASSWORD}
    Attempt Login
    Element Text Should Be      css=*[data-test="error"]    Epic sadface: Sorry, this user has been locked out.
    [Teardown]  Close Browser