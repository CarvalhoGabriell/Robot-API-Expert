*** Settings ***
Documentation        Método GET no endpoint /admin da API buger-eats

Resource            ../resources/base.robot

Library            ../resources/factories/partner.py

*** Test Cases ***
Deve retornar a Lista de Partners

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

    ${response}    GET PARTNERS
    ## pegar o tamanho do response, retornando os dados cadastrados no banco
    ${length}      Get Length     ${response.json()}

    Should Be True    ${length} > 0
    Status Should Be    200    ${response}