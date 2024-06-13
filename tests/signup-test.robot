*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes
Library        Browser

*** Variables ***
${BASE_URL}       http://localhost:3000/

*** Test Cases ***
Deve iniciar o cadastro do cliente

    # Preparação
    New Browser    browser=chromium    headless=False 
    New Page        ${BASE_URL}

    Get Text    css=#signup h2    equal    Faça seu cadastro e venha para a Smartbit!

    # ato
    Fill Text    id=name             Francilene Silva
    Fill Text    id=email            fran@gmail.com
    Fill Text    id=document         68785238180

    # Click        xpath=//button[text()="Cadastrar"]
    Click        css=button >> text=Cadastrar

    # verificação
    wait For Elements State    text=Falta pouco para fazer parte da família Smartbit!    visible    5

    