*** Settings ***
Documentation    Ações e elementos da página de Login

Library    Browser

*** Keywords ***
Go to login page

    Go To    http://localhost:3000/login
    
Submit login form
    [Arguments]    ${email}    ${senha}
    
    Fill Text    css=input[name=email]        ${email}
    Fill Text    css=input[type=password]     ${senha}
    Click        css=button[type=submit]

# testando um toast
Toast should be

    # pegando o html da página no momento em que o botão de login é clicado e salvando em uma variável
        # para pegar o toast. Deve ser colocado no teste de login
    #    Sleep    3
    #    ${temp}    Get Page Source
    #    Log    ${temp}

    [Arguments]    ${expected_text}

    Wait For Elements State    css=.Toastify__toast-body
    ...    visible    5

    Get Text    css=.Toastify__toast-body
    ...    equal
    ...    ${expected_text}


