*** Variables ***

${SITE}                                      https://bugbank.netlify.app
${NAVEGADOR}                                 Chrome
${REGISTRAR}                                 xpath=//*[@id="__next"]/div/div[2]/div/div[1]/form/div[3]/button[2]
${INPUT_EMAIL}                               xpath=//*[@id="__next"]/div/div[2]/div/div[2]/form/div[2]/input
${EMAIL}                                     teste@hotmail.com
${INPUT_NOME}                                xpath=//*[@id="__next"]/div/div[2]/div/div[2]/form/div[3]/input
${NOME}                                      testing
${INPUT_SENHA}                               xpath=//*[@id="__next"]/div/div[2]/div/div[2]/form/div[4]/div/input
${SENHA}                                     teste456
${INPUT_CONFIRMAR_SENHA}                     xpath=//*[@id="__next"]/div/div[2]/div/div[2]/form/div[5]/div/input
${CONTA_SALDO}                               xpath=//*[@id="toggleAddBalance"]
${CONCLUIR_CADASTRO}                         xpath=//*[@id="__next"]/div/div[2]/div/div[2]/form/button
${FECHAR_POPUP}                              xpath=//*[@id="btnCloseModal"]
${INPUT_EMAIL_LOGIN}                         xpath=//*[@id="__next"]/div/div[2]/div/div[1]/form/div[1]/input
${INPUT_SENHA_LOGIN}                         xpath=//*[@id="__next"]/div/div[2]/div/div[1]/form/div[2]/div/input
${LOGAR}                                     xpath=//*[@id="__next"]/div/div[2]/div/div[1]/form/div[3]/button[1]


*** keywords ***
Abrir o Navegador
  Open Browser   ${SITE}   ${NAVEGADOR}
  Maximize Browser Window

Wait and Click
   [Arguments]                      ${ELEMENTO}
   Wait Until Element is Visible    ${ELEMENTO}  15  
   Click Element                    ${ELEMENTO}

Criar conta e logar
    Wait and Click                  ${REGISTRAR}
    Sleep                           5
    Input Text                      ${INPUT_EMAIL}              ${EMAIL}
    Input Text                      ${INPUT_NOME}               ${NOME}
    Input Text                      ${INPUT_SENHA}              ${SENHA}
    Input Text                      ${INPUT_CONFIRMAR_SENHA}    ${SENHA}
    Click Element                   ${CONTA_SALDO}
    Click Element                   ${CONCLUIR_CADASTRO}
    Wait and Click                  ${FECHAR_POPUP}
    Input Text                      ${INPUT_EMAIL_LOGIN}       ${EMAIL}
    Input Text                      ${INPUT_SENHA_LOGIN}       ${SENHA}
    Click Element                   ${LOGAR}
    Sleep                           5
    Page Should Contain             Olá testing,
    Page Should Contain             Obrigado por escolher o nosso banco
    Page Should Contain             Saldo em conta
    Page Should Contain             1.000,00


Logar
    Input Text                      ${INPUT_EMAIL_LOGIN}       ${EMAIL}
    Input Text                      ${INPUT_SENHA_LOGIN}       ${SENHA}
    Click Element                   ${LOGAR}  
    Sleep                           5                   
    Page Should Contain             Usuário ou senha inválido.
    Page Should Contain             Tente novamente ou verifique suas informações!