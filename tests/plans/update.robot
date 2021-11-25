***Settings***
Documentation       Suite de alteração de planos

Resource            ${EXECDIR}/resources/base.robot

Test Setup          base.Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenário: Atualizar um plano já cadastrado
    ${fixture}         Get JSON from File          plans-update.json

    ${before}       Set Variable                 ${fixture['before']} 
    ${after}        Set Variable                 ${fixture['after']}

    remove_plan_by_title                         ${before['title']}
    remove_plan_by_title                         ${after['title']}

    insert_plan                                  ${before}

    Go to Plans
    Search Plan By Title                         ${before['title']}

    Go To Plan Update Form By Title              ${before['title']}    

    Update Plan                                  ${after}

    Toaster Text Should Be                       Plano Atualizado com sucesso

    [Teardown]                                   Loading Toaster and Take Screenshot       2       