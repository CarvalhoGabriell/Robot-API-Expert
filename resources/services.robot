*** Settings ***
Documentation      Camada de services para os Testes
Library            RequestsLibrary


*** Variables ***
${BASE_URL}        http://localhost:3333/partners
&{HEADERS}         Content-Type=application/json      auth_user=qa           auth_password=ninja


*** Keywords ***
POST PARTNER
    [Arguments]    ${PAYLOAD}
    ${response}    POST        
    ...            ${BASE_URL}     
    ...            json=${PAYLOAD}    
    ...            headers=${HEADERS}
    ...            expected_status=any
    [Return]       ${response}

GET PARTNERS
    ${response}    GET        
    ...            ${BASE_URL}        
    ...            headers=${HEADERS}
    ...            expected_status=any
    [Return]       ${response}

GET Search Partners
    [Arguments]    ${NAME}
    ${response}    GET        
    ...            ${BASE_URL}        
    ...            params=${NAME}
    ...            headers=${HEADERS}
    ...            expected_status=any
    [Return]       ${response}

PUT Enable Partner
    [Arguments]    ${PARTNER_ID}
    ${response}    PUT        
    ...            ${BASE_URL}/${PARTNER_ID}/enable
    ...            headers=${HEADERS}
    ...            expected_status=any
    [Return]       ${response}

PUT Disable Partner 
    [Arguments]    ${PARTNER_ID}
    ${response}    PUT        
    ...            ${BASE_URL}/${PARTNER_ID}/disable
    ...            headers=${HEADERS}
    ...            expected_status=any
    [Return]       ${response}

DELETE PARTNER
    [Arguments]    ${PARTNER_ID}
    ${response}    DELETE        
    ...            ${BASE_URL}/${PARTNER_ID}
    ...            headers=${HEADERS}
    ...            expected_status=any
    [Return]       ${response}