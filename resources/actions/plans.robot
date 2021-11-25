***Settings***
Documentation       Suite de ações da feature de gestão de planos

***Variables***
${TITLE_FIELD}            css=input[id=title]
${DURATION_FIELD}         css=input[id=duration]
${PRICE_FIELD}            css=input[name=price]
${TOTAL_FIELD}            css=input[name=total]

***Keywords***

### FORMS ###
Submit Plan Form    
    Click                         xpath=//button[contains(text(),"Salvar")]

Fill Plan Form
    [Arguments]     ${plan}

    Fill Text                     ${TITLE_FIELD}                ${plan.title}
    Fill Text                     ${DURATION_FIELD}             ${plan.duration}
    Fill Text                     ${PRICE_FIELD}                ${plan.price}

Update Plan
    [Arguments]     ${plan}

    Fill Text                     ${TITLE_FIELD}                ${plan['title']}
    Fill Text                     ${DURATION_FIELD}             ${plan['duration']}
    Fill Text                     ${PRICE_FIELD}                ${plan['price']}

    Submit Plan Form      

Search Plan By Title
    [Arguments]     ${title}

    Fill Text       css=input[placeholder="Buscar plano"]       ${title}           

### LINKS AND BUTTONS ###
Go To Form Plan
    Click                         css=a[href$="planos/new"]
    Wait For Elements State       css=h1 >> text="Novo plano"         visible     5

Go To Plan Update Form By Title
    [Arguments]     ${title}

    Click           xpath=//td[./text()="${title}"]/..//td/a[@class="edit"]
    Wait For Elements State             css= h1 >> text="Edição de plano"     visible      5    

### VALIDATIONS ###
Total Plan Should Be Equal
    [Arguments]                   ${total}

    Get Attribute                 ${TOTAL_FIELD}        value       ==        ${total}

Plan Should Be visible
    [Arguments]                   ${title}

    Wait For Elements State       xpath=//td[./text()="${title}"]      visible       5        

Plan Should Not Be visible
    [Arguments]                   ${title}

    Wait For Elements State       xpath=//td[./text()="${title}"]      detached       5            

Request Removal Plan By Title
    [Arguments]                   ${title}

    Click                         xpath=//td[./text()="${title}"]/../td//button[@id="trash"]    
