*** Settings ***
Documentation    Cenários de testes do Login SAC

Resource    ../resources/Base.resource
Test Setup    Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve logar como Gestor de Academia
    Go To login page
    Submit Login Form    sac@smartbit.com    pwd123
    User Is Logged In    sac@smartbit.com


# testando um toast
Não deve logar com email inválido
    [Tags]    inv_email
    Go To Login Page
    Submit Login Form    sac@smatbiat.com   pwd123
    Toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Não deve logar com usuário não cadastrado
    [Tags]    inv_user
    Go To login page
    Submit Login Form    teste@smartbit.com    abc123
    Toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Tentativa de login com dados incorretos
    [Template]    Login With Verify Notice   
    
    ${EMPTY}            ${EMPTY}      Os campos email e senha são obrigatórios.
    ${EMPTY}            pwd123        Os campos email e senha são obrigatórios.
    sac@smartbit.com    ${EMPTY}      Os campos email e senha são obrigatórios.

    # variação de email incorretos
    www.teste.com.br    pwd123      Oops! O email informado é inválido
    123fasdsdfdsad.c    pwd123      Oops! O email informado é inválido
    sac$email.com    pwd123      Oops! O email informado é inválido
    yahoo.com@&*   pwd123      Oops! O email informado é inválido
            

# estrutura de template é para casos de muitos testes com o mesmo cenário

*** Keywords ***
Login with verify notice
    [Arguments]    ${email}    ${password}    ${output_message}

    Go To Login Page
    Submit Login Form    ${email}    ${password}
    Notice Should Be    ${output_message}