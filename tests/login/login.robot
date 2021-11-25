***Settings***
Documentation   Suite de testes de Login do Administrador

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         base.Start Browser Section
Test Teardown       Take Screenshot

***Test Cases***
Cenário: Login do Administrador
    [Tags]         admin
    auth.Go to Login Page
    auth.Login With               admin@bodytest.com      pwd123

    sleep                         3
    Get Url                       Should Be               https://bodytest-web-diego.herokuapp.com/dashboard

    nav.User should be logged in  Administrador
    
    [Teardown]                    base.Clear LocalStorage and Take Screenshot

Cenário: Senha Incorreta
    [Tags]         temp
    auth.Go to Login Page
    auth.Login With               admin@bodytest.com        abc

    # Wait for Elements State     css=.Toastify__toast-body       visible     5
    # Get Text                    css=.Toastify__toast-body       Should Be   Usuário ou senha inválido     

    components.Toaster Text Should Be   Usuário e/ou senha inválidos.

    [Teardown]                    base.Loading Toaster and Take Screenshot     2

Cenário: Email não cadastrado
    [Tags]         temp
    auth.Go to Login Page
    auth.Login With               diego@gmail.com        abc

    # Wait for Elements State     css=.Toastify__toast-body       visible     5
    # Get Text                    css=.Toastify__toast-body       Should Be   Usuário ou senha inválido     

    components.Toaster Text Should Be   Usuário e/ou senha inválidos.

    [Teardown]                    base.Loading Toaster and Take Screenshot     2

Cenário: Email Incorreto
    [Tags]         temp
    auth.Go to Login Page
    auth.Login With             admin&bodytest.com          abc123
    components.Alert Text Should Be   Informe um e-mail válido

Cenário: Senha não informada
    [Tags]         temp
    auth.Go to Login Page
    auth.Login With             admin@bodytest.com          ${EMPTY}
    components.Alert Text Should Be   A senha é obrigatória

Cenário: Email não informado
    [Tags]         temp
    auth.Go to Login Page
    auth.Login With             ${EMPTY}                    abc123
    components.Alert Text Should Be   O e-mail é obrigatório

Cenário: Email e Senha não informados
    [Tags]         temp
    auth.Go to Login Page
    auth.Login With             ${EMPTY}                    ${EMPTY}
    components.Alert Text Should Be   O e-mail é obrigatório
    components.Alert Text Should Be   A senha é obrigatória