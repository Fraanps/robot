*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Resource    ../resources/base.resource

Test Setup        Start session    # executa uma ou mais keyword antes de cada teste
Test Teardown        Take Screenshot    # executa uma ou mais keyword depois de cada teste

*** Test Cases ***
Deve iniciar o cadastro do cliente
    [Tags]    smoke

    ${account}    Create Dictionary
    ...    name=Renato Augusto
    ...    email=renato@msn.com
    ...    cpf=44461751066

    # deletando o email caso ele exista
    delete_account_by_email    ${account}[email]

    Submit signup form    ${account}
    Verify welcome message


Tentativa de pre-cadastro
    [Template]    Attempt Signup    
    ${EMPTY}            fran@teste.com      53986172149     Por favor informe o seu nome completo
    Francilene Silva    ${EMPTY}            53986172149     Por favor, informe o seu melhor e-mail
    Pedro Europeu       pedro@teste.com     ${EMPTY}        Por favor, informe o seu CPF
    Thomas Silva        thomas**teste.com   09752979025     Oops! O email informado é inválido
    Cecilia Europeu     ceci@email.com      515*            Oops! O CPF informado é inválido


*** Keywords ***
Attempt signup
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}

    ${account}        Create Dictionary
        ...    name=${name}
        ...    email=${email}
        ...    cpf=${cpf}


        Submit signup form    ${account}
        Notice should be     ${output_message}