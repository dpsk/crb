# coding: utf-8
require 'spec_helper'

describe "adverts as guest" do
  
  specify "it should redirect user to login form" do
    visit "/"
    click_link "Подать объявление"
    page.should have_content "Вам необходимо войти в систему, чтобы дать объявление"
  end
end

describe "adverts as user" do
  before { login_as Factory(:user) }

  specify "it should have link for adding advert" do
    visit "/"
    page.should have_content "Подать объявление"
  end

  specify "i should be able to post advert as user" do
    visit "/"
    click_link "Подать объявление"
    fill_in "Заголовок", with: "Равшанама"
    fill_in "Содержание", with: "Строй-Арендуй!"
    click_button "Подать объявление"
    page.should have_content "Равшанама"
    page.should have_content "Строй-Арендуй!"
  end

end
