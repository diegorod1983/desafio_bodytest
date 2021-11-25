***Settings***
Documentation       Suite de busca de alunos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         base.Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenário: Busca Exata
    &{student}    Create Dictionary    name=Steve Jobs    email=jobs@apple.com    age=45    weight=80    feet_tall=1.80

    remove_student_by_name             ${student.name}
    insert_student                     ${student}
    Go to Students
    Search Student By name             ${student.name}      
    Student Name Should Be visible     ${student.name}
    Total Items Should Be              1

Cenário: Registro não encontrado
    ${name}                            Set Variable       John Snow
    remove_student_by_name             ${name}
    Go to Students
    Search Student By name             ${name}
    Register Should Not Be Found

Cenário: Busca resulta em mais de 1 aluno
    [Tags]                  json

    ${fixtures}             Get JSON from File          students-search.json
    ${students}             Set Variable                ${fixtures['students']}

    ${word}                 Set Variable                ${fixtures['word']}
    ${total}                Set Variable                ${fixtures['total']}

    remove_student_by_name                              ${word}

    FOR         ${item}        IN      @{students}
        # Log to Console                 ${item['name']}
        insert_student                 ${item}
    END

    Go to Students
    Search Student By name             ${word}

    FOR         ${item}        IN      @{students}
        Student Name Should Be visible          ${item['name']}    
    END

    Total Items Should Be              ${total}
    