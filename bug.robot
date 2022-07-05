*** Settings ***
Library         SeleniumLibrary
Resource        ./bug.resource
Test Setup      Abrir o Navegador
Test Teardown   Close Browser


*** Test Case ***
Criação de conta e login na BugBank
    Criar conta e logar

Login
    Logar