*** Settings ***
Documentation    Suite de testes de adesões de planos

Resource    ../resources/Base.resource

Test Setup    Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder realizar uma nova adesão
# externalizar masssa de teste quando for mais de 3 itens

    ${data}    Get Json fixture    memberships    create

    # deleta a conta caso existir e cria novamente
    Delete Account By Email    ${data}[account][email]
    Insert Account             ${data}[account]

    # tem que estar logado
    SignIn admin
    Go to memberships page
    Create new membership    ${data}
    Toast should be    Matrícula cadastrada com sucesso.


Não deve realizar adesão duplicada
    [Tags]    dup

    ${data}    Get Json fixture    memberships    duplicate

     Delete Account By Email    ${data}[account][email]
     Insert Account             ${data}[account]

    SignIn admin
    Go to memberships page
    Create New Membership    ${data}
    Sleep    8
    Create New Membership    ${data}
    Toast should be    O usuário já possui matrícula.



