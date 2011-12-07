require 'spec_helper'

describe Advert do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :title   }
  it { should validate_presence_of :content }

  it { should belong_to :user               }

  specify "it should be created succesfully" do
    Factory(:advert).persisted?.should be_true 
  end

end