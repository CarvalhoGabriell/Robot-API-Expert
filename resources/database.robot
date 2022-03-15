*** Settings ***
Documentation      Informações e Keywords para o Banco de dados
Library            RobotMongoDBLibrary.Delete
Library            RobotMongoDBLibrary.Find


*** Variables ***
&{MONGODB_URI}     connection=mongodb+srv://bugereates:buger123@cluster0.kuf1g.mongodb.net/PartnerDB?retryWrites=true&w=majority    database=PartnerDB   collection=partner


*** Keywords ***
REMOVER PARTNER BY NAME
    [Arguments]        ${partner_name}
    ${FILTER}    Create Dictionary
    ...          name=${partner_name}

    Delete One    ${MONGODB_URI}     ${FILTER}

FIND PARTNER BY NAME 
    [Arguments]      ${partner_name}  
    ${FILTER}    Create Dictionary
    ...          name=${partner_name}

    ## PESQUISAR NO BANCO PELO REGISTRO NO BANCO ESPECIFICADO PELO FILTER
    ${RESULTS_BD}     Find    ${MONGODB_URI}   ${FILTER}
    [Return]         ${RESULTS_BD}[0]