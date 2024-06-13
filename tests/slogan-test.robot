*** Settings ***
Documentation        Teste para verificar o Slogan na SmartBit WebApp

Library        Browser

*** Variables ***
${BASE_URL}       http://localhost:3000/

*** Test Cases ***
Deve exibir o Slogan na Landing Page
    New Browser    browser=chromium    headless=False 
    New Page        ${BASE_URL}
    Get Text    css=.headline h2    equal    Sua Jornada Fitness Começa aqui!

    sleep    5
    