*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Resource    ../resources/base.resource

*** Test Cases ***
Deve iniciar o cadastro do cliente

    ${account}    Get Fake Account

    Start session
   

    Submit signup form    ${account}

    # verificação
    wait For Elements State
    ...     text=Falta pouco para fazer parte da família Smartbit!
    ...     visible    5


Campo nome deve ser obrigatório
    [Tags]    required

    ${account}        Create Dictionary
    ...    name=${EMPTY}
    ...    email=papito@teste.com
    ...    cpf=53986172149

    Start session

    Submit signup form    ${account}

    wait For Elements State
    ...     css=form .notice
    ...     visible    5

    Notice should be    Por favor informe o seu nome completo


Campo email deve ser obrigatório
    [Tags]    required

    ${account}        Create Dictionary
    ...    name=Francilene Silva
    ...    email=${EMPTY}
    ...    cpf=53986172149

    Start session

    Submit signup form    ${account}

    wait For Elements State
    ...     css=form .notice
    ...     visible    5

    Notice should be    Por favor, informe o seu melhor e-mail

Campo cpf deve ser obrigatório
    [Tags]    required

    ${account}        Create Dictionary
    ...    name=Francilene Silva
    ...    email=fran@teste.com
    ...    cpf=${EMPTY}

    Start session

    Submit signup form    ${account}

    wait For Elements State
    ...     css=form .notice
    ...     visible    5

    Notice should be    Por favor, informe o seu CPF

Email no formato inválido
    [Tags]    invalid

    ${account}        Create Dictionary
    ...    name=Francilene Silva
    ...    email=fran*teste.com
    ...    cpf=53986172149

    Start session

    Submit signup form    ${account}

    Notice should be   Oops! O email informado é inválido

CPF no formato inválido
    [Tags]    invalid
    ${account}        Create Dictionary
    ...    name=Francilene Silva
    ...    email=fran@teste.com
    ...    cpf=5398617214aa

    Start session

    Submit signup form    ${account}
    
    Notice should be    Oops! O CPF informado é inválido


