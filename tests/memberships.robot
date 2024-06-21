*** Settings ***
Documentation    Suite de testes de adesões de planos

Resource    ../resources/Base.resource

Test Setup    Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder realizar uma nova adesão
    
    ${account}    Create Dictionary
    ...    name=Stefania Moraes
    ...    email=fanny@msn.com
    ...    cpf=05099284043
    
    ${plan}    Set Variable    Plano Black
    
    ${credit_card}    Create Dictionary
    ...     number=4242424242424242
    ...     holder=Stefania Morais
    ...     month=06
    ...     year=2028
    ...     cvv=231 

    # deleta a conta caso existir e cria novamente
    Delete Account By Email    ${account}[email]
    Insert Account             ${account}

    # tem que estar logado
    Go To Login Page
    Submit Login Form    sac@smartbit.com    pwd123
    User Is Logged In    sac@smartbit.com

    Go to memberships page
    Go to memberships form

    # preenchando o formulário de matricula - que é caixa de seleções
    Select Account     ${account}[name]    ${account}[cpf]
    Select plan        ${plan}
    
    Fill Payment       ${credit_card}

    Click        css=button[type=submit] >> text=Cadastrar

    Toast should be    Matrícula cadastrada com sucesso.


Usuário já possui matrícula
    ${account}    Create Dictionary
    ...    name=Stefania Moraes
    ...    email=fanny@msn.com
    ...    cpf=05099284043

    ${plan}    Set Variable    Plano Black
    
    ${credit_card}    Create Dictionary
    ...     number=4242424242424242
    ...     holder=Stefania Moraes
    ...     month=06
    ...     year=2028
    ...     cvv=231


    Go To Login Page
    Submit Login Form    sac@smartbit.com    pwd123
    User Is Logged In    sac@smartbit.com

    Go to memberships page
    Go to memberships form

        # preenchando o formulário de matricula - que é caixa de seleções
    Select Account     ${account}[name]    ${account}[cpf]
    Select plan        ${plan}

    Fill Payment    ${credit_card}
      
    Click        css=button[type=submit] >> text=Cadastrar

    Toast should be    O usuário já possui matrícula.


*** Keywords ***
Go to memberships page
    # indo para a página de matricula
        Click    css=a[href="/memberships"]

        Wait For Elements State    css=h1 >> text=Matrículas
        ...    visible    5

Go to memberships form
    # abrindo o formulário de matrícula
        Click    css=a[href="/memberships/new"]
        Wait For Elements State    css=h1 >> text=Nova Matrícula
        ...    visible    5
        
Select account
    [Arguments]    ${name}    ${cpf}

    Fill Text    css=input[aria-label=select_account]    ${name}
    Click        css=[data-testid="${cpf}"]

Select plan
    [Arguments]    ${plan_name}
    Fill Text    css=input[aria-label=select_plan]    ${plan_name}
    Click        css=div[class$=option] >> text=${plan_name}
    
Fill Payment
    [Arguments]    ${card}

    Fill Text    css=input[name=card_number]        ${card}[number]
    Fill Text    css=input[name=card_holder]        ${card}[holder]
    Fill Text    css=input[name=card_month]         ${card}[month]
    Fill Text    css=input[name=card_year]          ${card}[year]
    Fill Text    css=input[name=card_cvv]           ${card}[cvv]
