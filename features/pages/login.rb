class Login < SitePrism::Page
  include RSpec::Matchers
  include Capybara::DSL

  set_url '/login'
  element :mail, 'input[name="email"]'
  element :password, '#password'
  element :button_entrar, '#entrar'
  element :sair, :xpath, '//button[text()="Sair"]'

  def to_fill_in_login(home)
    mail.set 'palagio@palagio.com'
    sleep 5
    password.set 'Ga123@'
  end

  def click_button
    button_entrar.click
    sleep 5
  end

  def validar_url
    expect(page).to have_current_path('https://next.qacoders-academy.com.br/home', url:true)
    expect(sair).to have_content('Sair')
  end

end
