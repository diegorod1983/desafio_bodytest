***Settings***
Documentation       Ações do menu superior de navegação do dashboard

***Keywords***
User should be logged in
    [Arguments]    ${user_name} 
    Get Text       css=aside strong       Should Be    ${user_name}

Go to Students
    Click                         css=li a[href$=alunos]
    Wait for Elements State       css=h1 >> text=Gestão de Alunos     visible     5

Go To Plans
    Click                         css=li a[href$=planos]
    Wait For Elements State       css=h1 >> text="Gestão de Planos"         visible     5