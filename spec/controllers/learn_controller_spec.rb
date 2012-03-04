require 'spec_helper'

describe LearnController do

  fixtures :collections # include common collection

  render_views

  describe "GET 'index'" do
    it "should be successful when no expressions" do
      get 'index'
      Expression.delete_all
      response.should be_success
    end

    it 'should go to last expression when the one in url was deleted' do
     3.times{|i| FactoryGirl.create(:expression)}
     expressions = Expression.all
     id = expressions[1].id
     expressions[1].destroy
     get 'index', :id => id
     response.should be_success
    end 
  end


end
