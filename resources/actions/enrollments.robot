***Settings***
Documentation           Suite de ações da feature de gestão de matriculas

***Keywords***
### FORMS ###
Select Student Difficult To Inspect
    [Arguments]                  ${name}

    Fill Text                     css=input[aria-label=student_id]        ${name}
    # sleep                         5
    # ${html_code}                  Get Page Source
    # Log                           ${html_code}
    Click                         css=div[id*=option] >> text=${name}

Select Plan Difficult To Inspect
    [Arguments]                  ${title}

    Fill Text                     css=input[aria-label=plan_id]        ${title}
    # sleep                         5
    # ${html_code}                  Get Page Source
    # Log                           ${html_code}
    Click                         css=div[id*=option] >> text=${title}

### CLICKS AND BUTTONS
Go To Enrollment Form
    Click                         css=a[href$="matriculas/new"]
    Wait For Elements State       css=h1 >> text="Nova matrícula"

Submit Enrollment Form
    Click                         css=button[form=formEnrollment][type=submit]    

### VALIDATIONS ###
Start Date Should Be Today
    ${start_date}                                 Get Current Date                result_format=%d/%m/%Y
    ${start_date_value}       Get Attribute       css=input[name=start_date]      value     equal      ${start_date}      

End Date Added Should Be
    [Arguments]               ${days}

    ${current_date}           Get Current Date
    ${end_date}               Add Time To Date                ${current_date}      ${days} days     result_format=%d/%m/%Y  
    Log                       ${end_date}
    
    Get Attribute             css=input[name=end_date]        value     equal      ${end_date}
    