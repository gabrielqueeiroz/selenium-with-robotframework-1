*** Settings ***
Resource    ../resource/resource.robot

*** Variable ***
${URL}  https://www.grocerycrud.com/v1.x/demo/my_boss_is_in_a_hurry/bootstrap
${BROWSER}  chrome

*** Test Case ***
Caso de Teste 01: Desafio 1
    Acessar a página
    Mudar o valor da combo Select para "Bootstrap V4 Theme"
    Clicar no botão Add Customer
    Preencher os campos do formulário
    Clicar no botão Save
    Validar a mensagem "Your data has been successfully stored into the database. Edit Record or Go back to list" através de uma asserção
    Fechar o browser

Caso de Teste 02: Desafio 2
    Acessar a página
    Mudar o valor da combo Select para "Bootstrap V4 Theme"
    Clicar no botão Add Customer
    Preencher os campos do formulário
    Clicar no link Go Back to list
    Clicar na coluna "Search Name" e digitar o conteúdo do nome
    Clicar no checkbox abaixo da palavra Actions
    Clicar no botão Delete
    Validar o texto "Are you sure that you want to delete those 2 items?" através de uma asserção para o popup
    Clicar no botão Delete da popup
    Adicionar asserção na mensagem "Your data has been successfully deleted from the database."
    Fechar o browser