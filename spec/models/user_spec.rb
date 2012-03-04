require 'spec_helper'

describe User do

  it 'should create a new collection when creating a user' do
    u = FactoryGirl.create(:user)
    Collection.find_by_name("#{u.login_from_email}'s collection").should_not be_nil
  end

  describe 'login from email' do
    it 'returns login 1' do
      u = FactoryGirl.create(:user, :email => 'abc@gmail.com')
      u.login_from_email.should == 'abc'
    end
  end


end
