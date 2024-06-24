*** Settings ***
Documentation    Suite de testes de adesões de planos

Resource    ../resources/Base.resource

Test Setup    Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder realizar uma nova adesão
    
#    ${account}    Create Dictionary
#    ...    name=Stefania Moraes
#    ...    email=fanny@msn.com
#    ...    cpf=05099284043
#
#    ${plan}    Set Variable    Plano Black
#
#    ${credit_card}    Create Dictionary
#    ...     number=4242424242424242
#    ...     holder=Stefania Morais
#    ...     month=06
#    ...     year=2028
#    ...     cvv=231

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


Usuário já possui matrícula
    ${data}    Get Json fixture    memberships    create

    SignIn admin

    Go to memberships page
    Go to memberships form

    # Tornar esse teste independente, pois depende do teste acima para passar
    
    Select Account     ${data}[account][name]    ${data}[account][cpf]
    Select plan        ${data}[plan]

    Fill Payment    ${data}[credit_card]

    Click        css=button[type=submit] >> text=Cadastrar

    Toast should be    O usuário já possui matrícula.


