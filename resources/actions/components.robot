***Settings***
Documentation           Suite de ações de componentes genéricos

***Keywords***

### VALIDATIONS ###
Toaster Text Should Be
    [Arguments]     ${expected_text}

    Wait for Elements State       css=.Toastify__toast-body >> text=${expected_text}    visible    5    

Alert Text Should Be
    [Arguments]     ${expected_text}

    Wait for Elements State       css=form span >> text=${expected_text}    visible    5    

Field Should Be as Type
    [Arguments]     ${element}          ${type}

    ${attr}                     Get Attribute           ${element}        type     
    Should Be Equal             ${attr}                 ${type}        

Register Should Not Be Found
    Wait For Elements State            css=div >> text=Nenhum registro encontrado.
    Wait For Elements State            css=table          detached        5
    
Total Items Should Be
    [Arguments]     ${number}

    ${element}      Set Variable       css=#pagination .total

    Wait For Elements State            ${element}           visible           5
    Get Text                           ${element}           ==                Total: ${number}            

### RETURNING ELEMENTS & TEXTS ###
Get Required Alerts
    [Arguments]     ${index}

    ${alert}            Get Text       xpath=(//form//span)[${index}]

    [Return]        ${alert}        