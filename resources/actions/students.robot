***Settings***
Documentation       Suite de ações da feature de gestão de alunos

***Variables***
${NAME_FIELD}            css=input[name=name]
${EMAIL_FIELD}           css=input[name=email]
${AGE_FIELD}             css=input[name=age]
${WEIGHT_FIELD}          css=input[name=weight]
${FEET_TALL_FIELD}       css=input[name=feet_tall]

***Keywords***

### FORMS ###
Submit student form    
    Click                         xpath=//button[contains(text(),"Salvar")]

New Student
    [Arguments]     ${student}

    Fill Text                     ${NAME_FIELD}                ${student.name}
    Fill Text                     ${EMAIL_FIELD}               ${student.email}
    Fill Text                     ${AGE_FIELD}                 ${student.age}
    Fill Text                     ${WEIGHT_FIELD}              ${student.weight}
    Fill Text                     ${FEET_TALL_FIELD}           ${student.feet_tall}

    Submit student form    

Update Student
    [Arguments]     ${student}

    Fill Text                     ${NAME_FIELD}                ${student['name']}
    Fill Text                     ${EMAIL_FIELD}               ${student['email']}
    Fill Text                     ${AGE_FIELD}                 ${student['age']}
    Fill Text                     ${WEIGHT_FIELD}              ${student['weight']}
    Fill Text                     ${FEET_TALL_FIELD}           ${student['feet_tall']}

    Submit student form        

Search Student By name
    [Arguments]     ${name}

    Fill Text       css=input[placeholder="Buscar aluno"]       ${name}    

### LINKS AND BUTTONS ###
Go to Form Student
    Click                         css=a[href$="alunos/new"]
    Wait for Elements State       css=h1 >> text=Novo aluno           visible     5

Request Removal by Email
    [Arguments]                   ${email}
    Click                         xpath=//td[contains(text(),"${email}")]/../td//button[@id="trash"]    

Go To Student Update Form By Email
    [Arguments]     ${email}

    Click           xpath=//td[contains(text(), "${email}")]/..//td/a[@class="edit"]
    Wait For Elements State             css= h1 >> text="Edição de aluno"     visible      5                            

Confirm Removal
    Click                         text=SIM, pode apagar!

Cancel Removal
    Click                         text=Não

### ELEMENTS VALIDATIONS ###

Student Should Not Be visible
    [Arguments]                   ${email}

    Wait For Elements State       xpath=//td[contains(text(), "${email}")]      detached      5    

Student Should Be visible
    [Arguments]                   ${email}

    Wait For Elements State       xpath=//td[contains(text(), "${email}")]      visible       5    

Student Name Should Be visible
    [Arguments]     ${name}

    Wait For Elements State            css=table tbody tr >> text=${name}     visible     5        

