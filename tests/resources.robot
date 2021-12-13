*** Settings ***
Documentation   Variables and Keywords for the Robot Exercise

Library         SeleniumLibrary

*** Variables ***
${URL}       https://www.saucedemo.com/
${BROWSER}      chrome
${DELAY}        0
${PASSWORD}     secret_sauce
${VALID USER}   standard_user
${LOCKED USER}  locked_out_user
${PROB USER}    problem_user
${GLITCH USER}  performance_glitch_user

*** Keywords ***
Open To Login Page
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Verify Login Page

Verify Login Page
    Page Should Contain Element     login-button

Verify Product Page
    Element Text Should Be  class:title     PRODUCTS

Attempt Login
    Click Button    login-button

Input Username
    [Arguments]     ${username}
    Input Text  user-name   ${username}

Input User Password
    [Arguments]     ${password}
    Input Password  password    ${password}
