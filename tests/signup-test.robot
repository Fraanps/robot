*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes
Library        Browser
Resource    ../resources/base.resource

*** Variables ***
${BASE_URL}       http://localhost:3000/

*** Test Cases ***
Deve iniciar o cadastro do cliente

    ${account}    Get Fake Account

    # Preparação
    New Browser    browser=chromium    headless=False 
    New Page        ${BASE_URL}

    Get Text    css=#signup h2    equal    Faça seu cadastro e venha para a Smartbit!

    # ato
    Fill Text    id=name             ${account}[name]
    Fill Text    id=email            ${account}[email]
    Fill Text    id=document         ${account}[document]

    # Click        xpath=//button[text()="Cadastrar"]
    Click        css=button >> text=Cadastrar

    # verificação
    wait For Elements State    text=Falta pouco para fazer parte da família Smartbit!    visible    5

    