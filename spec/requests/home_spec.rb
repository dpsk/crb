# coding: utf-8
require 'spec_helper'

describe 'Home' do
  before { visit '/' }

  it "should display CRB" do
    page.should have_content "CRB"
  end

  it "should render registration link" do
    page.should have_content "Зарегистрироваться"
  end
end