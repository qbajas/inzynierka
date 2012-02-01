require 'spec_helper'

describe Collection do


  fixtures :collections

  describe 'for learning' do

    before(:each) do
      @c0 = Collection.common
      @c0.expressions << Factory.create(:expression)
      @user1 = FactoryGirl.create(:user, :id => 1)
      @user2 = FactoryGirl.create(:user, :id => 2)
    end

    it 'should load collections for logged user' do
      @c1 = FactoryGirl.create(:collection, :user => @user1)
      @c1.expressions << Factory.create(:expression)
      @c2 = FactoryGirl.create(:collection, :user => @user2)      
      @c2.expressions << Factory.create(:expression)
      Collection.for_learning(@user1).should == [@c1,@c0, @c2]
    end

    it 'should load common collection for not logged user' do
      Collection.for_learning(nil).should == [@c0]
    end

    it 'should not load empty collections for a user' do
      @c1 = FactoryGirl.create(:collection, :user => @user1)
      @c2 = FactoryGirl.create(:collection, :user => @user2)      
      @c2.expressions << Factory.create(:expression)
      Collection.for_learning(@user1).should == [@c0, @c2]
    end

    it 'should not load empty common collection' do
      @c0.expressions.delete_all
      Collection.for_learning(nil).should == []
    end


  end

end
