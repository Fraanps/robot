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

    Get Text
    ...     css=#signup h2
    ...     equal
    ...     Faça seu cadastro e venha para a Smartbit!

    # ato
    Fill Text    id=name             ${account}[name]
    Fill Text    id=email            ${account}[email]
    Fill Text    id=document         ${account}[document]

    # Click        xpath=//button[text()="Cadastrar"]
    Click        css=button >> text=Cadastrar

    # verificação
    wait For Elements State
    ...     text=Falta pouco para fazer parte da família Smartbit!
    ...     visible    5


Campo nome deve ser obrigatório
    [Tags]    required
    # Preparação
    New Browser    browser=chromium    headless=False
    New Page        ${BASE_URL}

    Get Text
    ...     css=#signup h2
    ...     equal
    ...     Faça seu cadastro e venha para a Smartbit!


    Fill Text    id=email            fran@email.com
    Fill Text    id=document         53986172149

    Click        css=button >> text=Cadastrar


    wait For Elements State
    ...     css=form .notice
    ...     visible    5
     
    Get Text    css=form .notice    equal    Por favor informe o seu nome completo


Campo email deve ser obrigatório
    [Tags]    required
    # Preparação
    New Browser    browser=chromium    headless=False
    New Page        ${BASE_URL}

    Get Text
    ...     css=#signup h2
    ...     equal
    ...     Faça seu cadastro e venha para a Smartbit!


    Fill Text    id=name            Francilene Silva
    Fill Text    id=document         53986172149

    Click        css=button >> text=Cadastrar


    wait For Elements State
    ...     css=form .notice
    ...     visible    5

    Get Text    css=form .notice    equal    Por favor, informe o seu melhor e-mail

Campo cpf deve ser obrigatório
    [Tags]    required
    # Preparação
    New Browser    browser=chromium    headless=False
    New Page        ${BASE_URL}

    Get Text
    ...     css=#signup h2
    ...     equal
    ...     Faça seu cadastro e venha para a Smartbit!


    Fill Text    id=name            Francilene Silva
    Fill Text    id=email            fran@email.com

    Click        css=button >> text=Cadastrar

    wait For Elements State
    ...     css=form .notice
    ...     visible    5

    Get Text    css=form .notice    equal    Por favor, informe o seu CPF

Email no formato inválido
    [Tags]    invalid
    # Preparação
    New Browser    browser=chromium    headless=False
    New Page        ${BASE_URL}

    Get Text
    ...     css=#signup h2
    ...     equal
    ...     Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name            Francilene Silva
    Fill Text    id=email            fran*email.com
    Fill Text    id=document         53986172149

    Click        css=button >> text=Cadastrar

    wait For Elements State
    ...     css=form .notice
    ...     visible    5

    Get Text    css=form .notice    equal   Oops! O email informado é inválido
    
Email no formato inválido
    [Tags]    invalid
    # Preparação
    New Browser    browser=chromium    headless=False
    New Page        ${BASE_URL}

    Get Text
    ...     css=#signup h2
    ...     equal
    ...     Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name            Francilene Silva
    Fill Text    id=email            teste@gmail.com
    Fill Text    id=document         5398617214aa

    Click        css=button >> text=Cadastrar

    wait For Elements State
    ...     css=form .notice
    ...     visible    5

    Get Text    css=form .notice    equal   Oops! O CPF informado é inválido
