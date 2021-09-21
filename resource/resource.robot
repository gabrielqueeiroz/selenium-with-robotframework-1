*** Settings ***
Library     SeleniumLibrary

*** Variable ***
${URL}  https://www.grocerycrud.com/v1.x/demo/my_boss_is_in_a_hurry/bootstrap
${BROWSER}  chrome
&{PESSOA}   name=Teste Sicredi  last_name=Teste    contact_first_name=Gabriel     phone=51 9999-9999    address_line_1=Av Assis Brasil, 3970    address_line_2=Torre D   city=Porto Alegre   state=RS    postal_code=91000-000    country=Brasil    from_employeer=coé mano   credit_limit=200

*** Keywords ***
Acessar a página
    Open Browser  ${URL}  ${BROWSER}

Mudar o valor da combo Select para "Bootstrap V4 Theme"
    Click Element  xpath=/html/body/div[1]/select/option[4]

Clicar no botão Add Customer
    Click Element  xpath=/html/body/div[2]/div[2]/div[1]/div[2]/form/div[1]/div[1]/a

Preencher os campos do formulário
    Input Text  xpath=//*[@id="field-customerName"]  ${PESSOA.name}
    Input Text  xpath=//*[@id="field-contactLastName"]  ${PESSOA.last_name}
    Input Text  xpath=//*[@id="field-contactFirstName"]  ${PESSOA.contact_first_name}
    Input Text  xpath=//*[@id="field-phone"]  ${PESSOA.phone}
    Input Text  xpath=//*[@id="field-addressLine1"]  ${PESSOA.address_line_1}
    Input Text  xpath=//*[@id="field-addressLine2"]  ${PESSOA.address_line_2}
    Input Text  xpath=//*[@id="field-city"]  ${PESSOA.city}
    Input Text  xpath=//*[@id="field-state"]  ${PESSOA.state}
    Input Text  xpath=//*[@id="field-postalCode"]  ${PESSOA.postal_code}
    Input Text  xpath=//*[@id="field-country"]  ${PESSOA.country}
    Input Text  xpath=//*[@id="field-salesRepEmployeeNumber"]   coé mano
    Input Text  xpath=//*[@id="field-creditLimit"]  ${PESSOA.credit_limit}

Clicar no botão Save
    Click Element  xpath=//*[@id="form-button-save"]

Validar a mensagem "${MENSAGEM}" através de uma asserção
    Wait Until Element Is Visible  xpath=//*[@id="report-success"]/p
    Page Should Contain  ${MENSAGEM}

Fechar o browser
    Close Browser

Clicar no link Go Back to list
    Click Button  xpath=//*[@id="save-and-go-back-button"]

Clicar na coluna "Search Name" e digitar o conteúdo do nome
    Wait Until Element Is Visible  xpath=/html/body/div[2]/div[2]/div[1]/div[2]/form/div[2]/table/thead/tr[2]/td[3]/input
    Input Text  xpath=/html/body/div[2]/div[2]/div[1]/div[2]/form/div[2]/table/thead/tr[2]/td[3]/input  ${PESSOA.name}
    Click Element  xpath=/html/body/div[2]/div[2]/div[1]/div[2]/form/div[2]/table/thead/tr[2]/td[2]/div[2]/a

Clicar no checkbox abaixo da palavra Actions
    Click Button  xpath=/html/body/div[2]/div[2]/div[1]/div[2]/form/div[2]/table/thead/tr[2]/td[1]/div/input

Clicar no botão Delete
    Wait Until Element Is Visible  xpath=//*[@id="gcrud-search-form"]/div[2]/table/thead/tr[2]/td[2]/div[1]/a
    Click Element  xpath=//*[@id="gcrud-search-form"]/div[2]/table/thead/tr[2]/td[2]/div[1]/a

Validar o texto "${MENSAGEM}" através de uma asserção para o popup
    Wait Until Element Is Visible  xpath=/html/body/div[2]/div[2]/div[3]/div/div/div[1]
    Element Text Should Be  xpath=/html/body/div[2]/div[2]/div[3]/div/div/div[2]/p[1]   expected=${MENSAGEM}

Clicar no botão Delete da popup
    Click Element  xpath=/html/body/div[2]/div[2]/div[3]/div/div/div[3]/button[2]
    
Adicionar asserção na mensagem "${MENSAGEM}"
    Wait Until Element Is Visible  xpath=/html/body/div[4]/span[3]/p
    Element Text Should Be  xpath=/html/body/div[4]/span[3]/p  expected=${MENSAGEM}

