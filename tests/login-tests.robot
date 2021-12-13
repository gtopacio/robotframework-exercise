*** Settings ***
Documentation       Test File for testing User Logins
Resource            resources.robot

*** Test Cases ***
Successful Login
    Open To Login Page
    Input Username  ${VALID USER}
    Input User Password
    Attempt Login
    Verify Product Page
    Close Browser
    [Teardown]  Close Browser
