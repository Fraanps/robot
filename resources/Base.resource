*** Settings ***

Documentation        Arquivo principal do projeto Robot

Library        Browser
Library        libs/Account.py
Resource       pages/LandingPage.resource

*** Variables ***
${BASE_URL}       http://localhost:3000/

*** Keywords ***
Start session
     New Browser    browser=chromium    headless=False
     New Page        ${BASE_URL}