# coding: utf-8
def login_with(email, password)
  visit "/"
  within("#sign-in") do
    fill_in "user_email", :with => email
    fill_in "user_password", :with => password
    click_button "Войти"
  end
end

def login_as(user)
  login_with user.email, 'password'
end

def signup_as(name, email)
  within(:xpath, "//form[@id='user_new']") do
    fill_in "Email", with: email
    fill_in "Имя", with: name
    fill_in "Пароль", with: "password"
    fill_in "Подтвердите пароль", with: "password"
    click_button "Зарегистрироваться"
  end
end