*** Settings ***
Documentation    Ações e elementos do componente de caixa de notificação

Library    Browser

*** Keywords ***
Notice should be
    [Arguments]    ${target}

    ${element}    Set Variable    css=form .notice
    #Set Browser Timeout    10000ms

    wait For Elements State
    ...      ${element}
    ...     visible    5

     Get Text     ${element}    equal    ${target}
     Take Screenshot
