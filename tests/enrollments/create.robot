***Settings***
Documentation       Suite de gestão de matrículas
Resource            ${EXECDIR}/resources/base.robot

Suite Setup         base.Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenário: Deve exibir a data inicial e final conforme o plano escolhido
    ${fixture}                                    Get JSON from File    enrollments-dates.json
    ${student}                                    Set Variable          ${fixture['student']}                   
    ${plan}                                       Set Variable          ${fixture['plan']}               
    ${days}                                       Set Variable          ${fixture['days']}               

    insert_student                                ${student}
    insert_plan                                   ${plan}

    Go To Enrollments
    Go To Enrollment Form

    Select Student Difficult To Inspect           ${student['name']}
    Select Plan Difficult To Inspect              ${plan['title']}
    Start Date Should Be Today
    End Date Added Should Be                      ${days}

Cenário: Deve matricular um aluno em um plano
    ${fixture}                                    Get JSON from File    enrollments-create.json
    ${student}                                    Set Variable          ${fixture['student']}                   
    ${plan}                                       Set Variable          ${fixture['plan']}               
    ${days}                                       Set Variable          ${fixture['days']}               

    insert_student                                ${student}
    insert_plan                                   ${plan}

    Go To Enrollments
    Go To Enrollment Form

    Select Student Difficult To Inspect           ${student['name']}
    Select Plan Difficult To Inspect              ${plan['title']}

    Submit Enrollment Form

    Toaster Text Should Be                        Matrícula cadastrada com sucesso

    [Teardown]                                    Loading Toaster and Take Screenshot    2