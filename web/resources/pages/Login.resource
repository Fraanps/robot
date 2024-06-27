*** Settings ***
Documentation    Ações e elementos da página de Login

Library    Browser

*** Keywords ***
Go to login page

    Go To    http://localhost:3000/login
    
Submit login form
    [Arguments]    ${email}    ${senha}
    
    Fill Text    css=input[name=email]        ${email}
    Fill Text    css=input[type=password]     ${senha}
    Click        css=button[type=submit]

