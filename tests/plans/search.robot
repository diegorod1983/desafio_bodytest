***Settings***
Documentation       Suite de busca de planos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         base.Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenário: Registro não encontrado
    ${title}                           Set Variable       pass
    remove_plan_by_title               ${title}
    Go to Plans
    Search Plan By Title               ${title}
    Register Should Not Be Found

Cenário: Busca Exata
    &{plan}    Create Dictionary    title=Year Plan    duration=12    price=45.00

    remove_plan_by_title               ${plan.title}
    insert_plan                        ${plan}
    Go to plans
    Search Plan By Title               ${plan.title}      
    Plan Should Be visible             ${plan.title}
    Total Items Should Be              1    

Cenário: Busca resulta em mais de 1 plano
    [Tags]                  json

    ${fixtures}             Get JSON from File          plans-search.json
    ${plans}                Set Variable                ${fixtures['plans']}

    ${word}                 Set Variable                ${fixtures['word']}
    ${total}                Set Variable                ${fixtures['total']}

    remove_plan_by_title               ${word}

    FOR         ${item}        IN      @{plans}
        # Log to Console                 ${item['name']}
        insert_plan                    ${item}
    END

    Go to Plans
    Search Plan By Title               ${word}

    FOR         ${item}        IN      @{plans}
        Plan Should Be visible         ${item['title']}    
    END

    Total Items Should Be              ${total}