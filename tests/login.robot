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
Não deve logar com email incorreto
    [Tags]    inv_email
    Go To Login Page
    Submit Login Form    saac@smartbiit.com    pwd123
    Toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Não deve logar com senha incorreta
    [Tags]    inv_pass
    Go To login page
    Submit Login Form    sac@smartbit.com    abc123
    Toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Não deve logar com usuário não cadastrado
    [Tags]    inv_user
    Go To login page
    Submit Login Form    teste@smartbit.com    abc123
    Toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

# estrutura de template é para casos de muitos testes com o mesmo cenário
