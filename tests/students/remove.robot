***Settings***
Documentation       Suite de exclusão de alunos

Resource            ${EXECDIR}/resources/base.robot

Test Setup         base.Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenário: Remover Aluno
    &{student}    Create Dictionary    name=Robert Pattinson    email=batman@dc.com    age=27    weight=70    feet_tall=1.80

    insert_student                    ${student}
    
    Go to Students

    Search Student By name            ${student.name}
    Request Removal by Email          ${student.email}
    Confirm Removal

    Toaster Text Should Be            Aluno removido com sucesso.
    [Teardown]                        Loading Toaster and Take Screenshot       2

    Student Should Not Be visible     ${student.email}


Cenário: Desistir da Exclusão
    [tags]        rem
    &{student}    Create Dictionary    name=Robert Downey Jr    email=ironman@marvel.com    age=39    weight=65    feet_tall=1.75

    insert_student                    ${student}
    
    Go to Students
    # Reload

    Search Student By name            ${student.name}
    Request Removal by Email          ${student.email}
    Cancel Removal

    Student Should Be visible         ${student.email}

