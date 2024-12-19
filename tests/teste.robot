*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}             https://pgw-stg.timwetech.com/landing-page-fe
${TELEFONE}        61992919314
${BROWSER}         firefox

*** Test Cases ***
Preencher e Enviar Numero de Telefone

    [Documentation]    Abre a página, insere o número de telefone e clica no botão "ir".


    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    css=input[type=text]    10
    Input Text    css=input[type=text]    ${TELEFONE}
    Click Button    css=button[type=submit]
    Wait Until Element Is Visible    xpath=//iframe[contains(@title, 'desktop')]    20
    Select Frame    xpath=//iframe[contains(@title, 'desktop')]
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'option')]//div[2]    10
    Click Element    xpath=//div[contains(@class, 'option')]//div[2]
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'action-list-container')]//div[1]    10
    Click Element    xpath=//div[contains(@class, 'action-list-container')]//div[1]

    Wait Until Element Is Visible    xpath=//div[contains(@class, 'box')][2]    10
    Click Element    xpath=//div[contains(@class, 'box')][2]
    Click Element

    #Close Browser