Quando( /^eu entro na página de cadastro de usuário$/ ) do
  @new_customer = FactoryGirl.build( :customer )

  visit new_user_registration_path
end

E( /^eu preencho o campo nome do usuário com (.*)$/ ) do |name|
  page.fill_in( "user-name", with: name )
end

E( /^eu preencho o campo endereço com (.*)$/ ) do |address|
  page.fill_in( "user-address", with: address )
end

E( /^eu preencho o campo email com (.*)$/ ) do |email|
  page.fill_in( "user-email", with: email )
end

E( /^eu preencho o campo senha com (.*)$/ ) do |password|
  page.fill_in( "user-password", with: password )
end

E( /^eu preencho o campo de confirmação de senha com (.*)$/ ) do 
  |confirm_password|
  page.fill_in( "user-confirm-password", with: confirm_password )
end

E( /^eu clico no botão Cadastrar$/ ) do
  click_button( "Cadastrar" )
end

Então(/^o sistema deve retornar para a página inicial da aplicação$/) do
  visit home_page_index_path
end