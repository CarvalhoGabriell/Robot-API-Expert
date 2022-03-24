*** Settings ***
Documentation        Método PUT para Habilitar/Desabilitar um Parceiro

Resource            ../resources/base.robot
Library            ../resources/factories/partner.py

#TODO Testar os cenarios na minha máquina, verificar se estão passando.

*** Test Cases ***
Deve Habilitar um Parceiro com sucesso
    ${partner}        Factory Partner Enable
   
    REMOVER PARTNER BY NAME    ${partner}[name]
    ${response}       POST PARTNER    ${partner}

    ${partner_id}     Set Variable    ${response.json()}[partner_id]

    ${response}       PUT Enable Partner     ${partner_id}
    Status Should Be    200    ${response}


Deve Desabilitar um Parceiro com sucesso
    ${partner}        Factory Partner Enable
   
    REMOVER PARTNER BY NAME    ${partner}[name]
    ${response}       POST PARTNER    ${partner}

    ${partner_id}     Set Variable    ${response.json()}[partner_id]

    PUT Enable Partner     ${partner_id}

    ${response}       PUT Disable Partner    ${partner_id}
    Status Should Be    200    ${response}


Deve retornar erro 404 Habilitar Parceiro
    ${partner}        Factory Partner 404
   
    REMOVER PARTNER BY NAME    ${partner}[name]
    ${response}       POST PARTNER    ${partner}

    ${partner_id}     Set Variable    ${response.json()}[partner_id]
    REMOVER PARTNER BY NAME    ${partner}[name]

    ${response}       PUT Enable Partner     ${partner_id}
    Status Should Be    404    ${response}
    
Deve retornar erro 404 Desabilitar Parceiro
    ${partner}        Factory Partner 404
   
    REMOVER PARTNER BY NAME    ${partner}[name]
    ${response}       POST PARTNER    ${partner}

    ${partner_id}     Set Variable    ${response.json()}[partner_id]
    REMOVER PARTNER BY NAME    ${partner}[name]

    ${response}       PUT Disable Partner     ${partner_id}
    Status Should Be    404    ${response}
    