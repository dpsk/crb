# coding: utf-8
require 'spec_helper'

describe "UserSessions" do
  before { @user = Factory :user }
  it "should login user with valid credentials" do
    login_with @user.email, 'password'
    page.should have_content "Вход в систему выполнен"
    page.should have_content @user.name
  end

  it "should logout user" do
    login_with @user.email, 'password'
    click_link 'Выйти'
    page.should have_content "Выход из системы выполнен"
    page.should_not have_content @user.name
  end
end