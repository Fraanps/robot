*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Resource    ../resources/base.resource

Test Setup    Start session
Test Teardown    Take Screenshot



*** Test Cases ***
Deve iniciar o cadastro do cliente

    ${account}    Get Fake Account

    Submit signup form    ${account}
    # verificação
    Verify welcome message
    # criando evidência de teste com screenshot


Campo nome deve ser obrigatório
    [Tags]    required

    ${account}        Create Dictionary
    ...    name=${EMPTY}
    ...    email=papito@teste.com
    ...    cpf=53986172149



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


    Submit signup form    ${account}
    Notice should be   Oops! O email informado é inválido


CPF no formato inválido
    [Tags]    invalid
    ${account}        Create Dictionary
    ...    name=Francilene Silva
    ...    email=fran@teste.com
    ...    cpf=5398617214aa


    Submit signup form    ${account}
    Notice should be    Oops! O CPF informado é inválido



