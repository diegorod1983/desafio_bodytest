***Settings***
Documentation       Suite de cadastro de alunos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         base.Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenário: Novo aluno
    &{student}    Create Dictionary     name=Diego Rodrigues    email=diego@gmail.com    age=37     weight=62    feet_tall=1.78

    # Remoção do aluno
    DeloreanLibrary.remove_student                      ${student.email}
    # Pre-condição
    nav.Go to Students
    students.Go to Form Student

    # Ações do Cenário
    students.New Student                                 ${student}

    # Validação
    components.Toaster Text Should Be                   Aluno cadastrado com sucesso.

    [Teardown]                                          base.Loading Toaster and Take Screenshot     2

Cenário: Não deve permitir email duplicado
    [Tags]        dup

    &{student}    Create Dictionary     name=João da Silva    email=joao@gmail.com    age=20     weight=60    feet_tall=1.60

    DeloreanLibrary.insert_student                      ${student}

    nav.Go to Students
    students.Go to Form Student
    students.New Student                                 ${student}
    components.Toaster Text Should Be                   Email já existe no sistema.

    [Teardown]                                          base.Loading Toaster and Take Screenshot     2

Cenário: Todos os campos devem ser obrigatórios
    #&{student}    Create Dictionary     name={EMPTY}    email={EMPTY}    age={EMPTY}     weight={EMPTY}    feet_tall={EMPTY}

    @{expected_alerts}     Set Variable     Nome é obrigatório    O e-mail é obrigatório    idade é obrigatória    o peso é obrigatório    a Altura é obrigatória
    @{got_alerts}          Create List

    nav.Go to Students
    students.Go to Form Student
    #New Student                                   ${student}
    students.Submit student form

    # FOR                    ${alert}      IN        @{expected_alerts}
    #     components.Alert Text Should Be            ${alert}
    # END

    FOR                     ${index}       IN RANGE          1    6
        ${span}             Get Required Alerts             ${index}
        Append to List      ${got_alerts}                   ${span}
    END
    
    log                     ${expected_alerts}
    log                     ${got_alerts}

    Lists Should be Equal       ${expected_alerts}     ${got_alerts}


Cenário: Validação dos campos numéricos
    [Tags]              temp
    [Template]          Check Field Type on Student Form
    ${AGE_FIELD}                 number
    ${WEIGHT_FIELD}              number
    ${FEET_TALL_FIELD}           number

Cenário: Validação do campo email
    [Tags]              temp
    [Template]          Check Field Type on Student Form

    ${EMAIL_FIELD}               email    

Cenário: Menor de 14 anos não pode ter cadastro
    &{student}      Create Dictionary    name=guilherme rogers    email=guilherme@gmail.com    age=12     weight=42     feet_tall=1.40
    
    nav.Go to Students
    students.Go to Form Student

    New Student     ${student}
    components.Alert Text Should Be     A idade deve ser maior ou igual 14 anos 

***Keywords***
Check Field Type on Student Form
    [Arguments]         ${element}          ${type}

    nav.Go to Students
    students.Go to Form Student
    components.Field Should Be as Type          ${element}      ${type}
