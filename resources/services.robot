*** Settings ***
Documentation      Camada de services para os Testes
Library            RequestsLibrary


*** Variables ***
${BASE_URL}        http://localhost:3333/partners
&{HEADERS}         Content-Type=application/json      auth_user=qa           auth_password=ninja


*** Keywords ***
POST PARTNER
    [Arguments]    ${payload}
    ${response}    POST        
    ...            ${BASE_URL}     
    ...            json=${PAYLOAD}    
    ...            headers=${HEADERS}
    ...            expected_status=any
    [Return]       ${response}