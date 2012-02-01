require 'spec_helper'

describe Collection do


  describe 'for learning' do

    before(:each) do
      @c0 = FactoryGirl.create(:collection, :user_id => nil)
      @user1 = FactoryGirl.create(:user, :id => 1)
    end

    it 'should load collections for logged user' do
      @c1 = FactoryGirl.create(:collection, :user_id => 1)
      @c2 = FactoryGirl.create(:collection, :user_id => 2)      
      Collection.for_learning(@user1).should == [@c0,@c1]
    end

    it 'should load common collection for not logged user' do
      Collection.for_learning(nil).should == [@c0]
    end


  end

end
