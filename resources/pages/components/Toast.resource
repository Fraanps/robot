*** Settings ***
Documentation    Ações e elementos do Componente Toast

Library    Browser

*** Keywords ***

# testando um toast
Toast should be

    # pegando o html da página no momento em que o botão de login é clicado e salvando em uma variável
        # para pegar o toast. Deve ser colocado no teste de login
    #    Sleep    3
    #    ${temp}    Get Page Source
    #    Log    ${temp}

    [Arguments]    ${expected_text}
    
    ${selector}    Set variable    .Toastify__toast-body

    Wait For Elements State    css=${selector}
    ...    visible    5

    Get Text    css=${selector}
    ...    equal
    ...    ${expected_text}
    
    Take Screenshot    selector=${selector}


