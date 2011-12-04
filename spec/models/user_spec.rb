require 'spec_helper'

describe User do
  before { @user =  Factory :user }
  it { should validate_presence_of :name   }
  it { should validate_presence_of :email   }
  it { should validate_presence_of :password   }
  it { should validate_uniqueness_of :name }
  it { should validate_uniqueness_of :email }

  describe "#to_s" do
    specify { @user.to_s.should == @user.name }
  end
end
