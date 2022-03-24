*** Settings ***
Documentation        Método DELETE para Habilitar/Desabilitar um Parceiro

Resource            ../resources/base.robot
Library            ../resources/factories/partner.py

#TODO Testar os cenarios na minha máquina, verificar se estão passando.

*** Test Cases ***
Deve Remover um Parceiro
    
    ${partner}        Factory Partner Delete
    REMOVER PARTNER BY NAME    ${partner}[name]

    ${response}       POST PARTNER    ${partner}
    ${partner_id}    Set Variable     ${response.json()}[partner_id]

    ${response}    DELETE PARTNER    ${partner_id}
    Status Should Be    204

Deve retornar 404 Parceiro Não Existente
    ${partner}        Factory Partner Delete
    REMOVER PARTNER BY NAME    ${partner}[name]

    ${response}       POST PARTNER    ${partner}
    ${partner_id}     Set Variable     ${response.json()}[partner_id]
    
    REMOVER PARTNER BY NAME    ${partner}[name]

    ${response}    DELETE PARTNER    ${partner_id}
    Status Should Be    204