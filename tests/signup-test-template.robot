*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Resource    ../resources/base.resource

Test Setup        Start session    # executa uma ou mais keyword antes de cada teste
Test Teardown        Take Screenshot    # executa uma ou mais keyword depois de cada teste

*** Test Cases ***
Deve iniciar o cadastro do cliente

    ${account}    Get Fake Account

    Submit signup form    ${account}
    # verificação
    Verify welcome message
    # criando evidência de teste com screenshot

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