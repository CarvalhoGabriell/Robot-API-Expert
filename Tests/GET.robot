*** Settings ***
Documentation        Método GET no endpoint /admin da API buger-eats

Resource            ../resources/base.robot
Library            ../resources/factories/partner.py
Suite Setup        Create Partner List


#TODO Testar os cenarios na minha máquina, verificar se estão passando.

*** Test Cases ***
Deve retornar a Lista de Parceiros

    ${response}    GET PARTNERS
    ## pegar o tamanho do response, retornando os dados cadastrados no banco
    ${length}      Get Length     ${response.json()}

    Should Be True    ${length} > 0
    Status Should Be    200    ${response}

Deve Pesquisar pelo Nome do Parceiro Cadastrado
    
    ${response}    GET Search Partners    Gabiru
    
    ${size}    Get Length    ${response.json()}
    Should Be True    ${length} == 1

    Status Should Be    200    ${response}
    Should Be Equal    ${response.json()}[0][name]   Gabiru


*** Keywords ***
Create Partner List
     ## GARANTINDO QUE VAO EXISTIR MAIS DE UM PARCEIRO CADASTRADO NO BANCO    
    ${LIST_PARTNERS}    Factory List Partners

    FOR    ${P}    IN    @{LIST_PARTNERS}
        ${reponse}    POST PARTNER    ${P}
        IF  '${reponse.json()}[message]' == 'Duplicate company name'
            Log To Console     Partner ja cadastrado!
        ELSE
            Log To Console     ${reponse.json()}

        END
    END