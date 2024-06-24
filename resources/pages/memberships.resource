*** Settings ***
Documentation    Ações e elementos da página de matrículas

Library    Browser

*** Keywords ***
Create new membership
    [Arguments]    ${data}
    Go to memberships form
    # preenchando o formulário de matricula - que é caixa de seleções
    Select Account     ${data}[account][name]    ${data}[account][cpf]
    Select plan        ${data}[plan]
    Fill Payment       ${data}[credit_card]

     Click        css=button[type=submit] >> text=Cadastrar

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
