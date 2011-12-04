# coding: utf-8
require 'spec_helper'

describe "Register" do

  before { visit new_user_registration_path }

  it "validate form" do
    within("#user_new") do
      click_button "Зарегистрироваться"
    end

    page.should have_content "может быть пустым"
  end

  it "send confirmation mail" do
    signup_as("Миша", "dpsk@test.ru")
    page.should have_content "Добро пожаловать! Вы успешно зарегистрировались."
  end

  it "register after confirm" do
    signup_as("Миша", "dpsk@test.ru")
    visit "/users/confirmation?confirmation_token=#{User.last.confirmation_token}"
    page.should have_content "учётная запись подтверждена"
  end

end