*** Settings ***
Documentation        Arquivo principal do projeto Robot

Library        JSONLibrary
Library        Browser
Library        libs/Account.py
Library        libs/Database.py
Resource       pages/LandingPage.resource
Resource       pages/WelcomePage.resource
Resource       pages/Login.resource
Resource       pages/Accounts.resource
Resource       pages/components/Toast.resource
Resource       pages/components/BoxNotice.resource
Resource       pages/components/navbar.resource
Resource       pages/memberships.resource
   
*** Variables ***
${BASE_URL}       http://localhost:3000/

${ADMIN_EMAIL}    sac@smartbit.com
${ADMIN_PASS}     pwd123


*** Keywords ***
Start session
     New Browser    browser=chromium    headless=False
     New Page        ${BASE_URL}

# Helpers
Get Json fixture
    [Arguments]        ${file_name}    ${scenario}
    
    ${data}    Load Json From File    
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    ...    encoding=utf-8
    
    RETURN    ${data}[${scenario}]
   
SignIn admin
    Go To Login Page
    Submit Login Form    ${ADMIN_EMAIL}    ${ADMIN_PASS}
    User Is Logged In    ${ADMIN_EMAIL}