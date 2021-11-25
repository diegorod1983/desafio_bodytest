***Settings***
Documentation     Ações de autorização da página de login

***Keywords***
Go to Login Page
    Go to           https://bodytest-web-diego.herokuapp.com/

Login With
    [Arguments]     ${email}    ${pass}

    Fill Text      css=input[name=email]        ${email}
    Fill Text      css=input[placeholder*=senha]     ${pass}
    Click          text=Entrar
