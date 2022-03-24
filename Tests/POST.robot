*** Settings ***
Documentation        Método POST no endpoint /partner da API buger-eats

Resource    ../resources/base.robot
Library    ../resources/factories/partner.py

#TODO Testar os cenarios na minha máquina, verificar se estão passando.

*** Test Cases ***
Deve criar um novo Partner
    DELETE Purge Messages

    ${partner}    Factory New Partner
    REMOVER PARTNER BY NAME    ${partner}[name]
    
    ## ações de POST
    ${response}    POST PARTNER    ${partner}
    
    ## validações 
    Status Should Be    201    ${response}
    Log To Console             ${response.json()}[partner_id]

    ${results_id}              FIND PARTNER BY NAME              ${partner}[name]
    Should Be Equal            ${response.json()}[partner_id]    ${results_id}[_id]
    
    ${messages}        GET Messages Queue
    Log To Console     ${messages}[payload]

    Should Contain    ${messages}[payload]    ${partner}[email]
    Should Contain    ${messages}[payload]    ${partner}[name]

Não deve criar um Partner Duplicado
    ${partner_duplicate}    Factory Duplicate Partner

    REMOVER PARTNER BY NAME    ${partner_duplicate}[name]
    POST PARTNER    ${partner_duplicate}
    
    ## ações de POST
    ${response}    POST PARTNER    ${partner_duplicate}

    ## validações 
    Status Should Be    409    ${response}
    Should Be Equal     ${response.json()}[message]   Duplicate company name
