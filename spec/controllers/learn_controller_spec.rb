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
  end


end
