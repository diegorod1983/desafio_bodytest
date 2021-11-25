***Settings***
Documentation       Suite de cadastro de planos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         base.Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Calcular preço total do plano

    &{plan}     Create Dictionary       title=Desafio Diego      duration=12     price=19,99     total=R$ 239,88

    Go To Plans
    Go To Form Plan
    Fill Plan Form                      ${plan}
    Total Plan Should Be Equal          ${plan.total}

Cenário: Novo Plano
    [Tags]      new
    &{plan}     Create Dictionary       title=Gympass      duration=12     price=100,00    

    DeloreanLibrary.remove_plan_by_title        ${plan.title}

    Go To Plans
    Go To Form Plan
    Fill Plan Form                              ${plan}
    Submit Plan Form
    Toaster Text Should Be                      Plano cadastrado com sucesso
    Plan Should Be visible                      ${plan.title}       

    [Teardown]                                  Loading Toaster and Take Screenshot         2
