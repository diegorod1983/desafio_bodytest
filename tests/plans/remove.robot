***Settings***
Documentation       Suite de exclusão de planos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         base.Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenário: Remover Plano
    &{plan}       Create Dictionary       title=Adulto     duration=12       price=50.00

    insert_plan                           ${plan}

    Go To Plans
    Search Plan By Title                  ${plan.title}
    Request Removal Plan By Title         ${plan.title}  
    Confirm Removal
    Toaster Text Should Be                Plano removido com sucesso   
    Plan Should Not Be visible            ${plan.title}

    [Teardown]                            Loading Toaster and Take Screenshot     2

