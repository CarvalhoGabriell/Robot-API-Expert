*** Settings ***
Documentation        Rabbit Helpers API

Library    RequestsLibrary

*** Variables ***
${BASE_URL_RABBIT}    https://hornet.rmq.cloudamqp.com/api/queues/vahizmsb/email
&{HEADERS}            Content-Type=application/json        Authorization=Basic dmFoaXptc2I6cnBMdERYZml6TUx1eWdURXZ3ejk4X3c4UlBMb1hPRTg=

*** Keywords ***
DELETE Purge Messages

    ${payload}     Create Dictionary
    ...            vhost=vahizmsb
    ...            name=email
    ...            mode=purge

    ${response}    DELETE      ${BASE_URL_RABBIT}/contents    json=${payload}     headers=${HEADERS}
    
    [Return]       ${response.json()}[0]

GET Messages Queue
    
    ${payload}     Create Dictionary
    ...            vhost=vahizmsb
    ...            name=email
    ...            truncate=50000
    ...            ackmode=ack_requeue_true
    ...            encoding=auto
    ...            count=1

    ${response}    POST     ${BASE_URL_RABBIT}/get    json=${payload}    headers=${HEADERS}

    [Return]        ${response.json()}[0]