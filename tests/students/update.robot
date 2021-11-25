***Settings***
Documentation       Suite update de alunos cadastrados

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         base.Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenário: Atualizar um aluno já cadastrado
    ${fixture}         Get JSON from File          students-update.json

    ${khamalakhan}     Set Variable                ${fixture['before']} 
    ${msmarvel}        Set Variable                ${fixture['after']}

    remove_student_by_name                         ${khamalakhan['name']}
    remove_student_by_name                         ${msmarvel['name']}

    insert_student                                 ${khamalakhan}

    Go to Students
    Search Student By name                         ${khamalakhan['name']}

    Go To Student Update Form By Email             ${khamalakhan['email']}    

    Update Student                                 ${msmarvel}

    Toaster Text Should Be                         Aluno atualizado com sucesso.

    [Teardown]                                     Loading Toaster and Take Screenshot       2       
