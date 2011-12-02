require 'spec_helper'

describe 'Home' do
  it "should display CRB" do
    visit '/'
    page.should have_content "CRB"
  end
end