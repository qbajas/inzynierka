require 'spec_helper'

describe LearnController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'next'" do
    it "should be successful" do
      get 'next'
      response.should be_success
    end
  end

  describe "GET 'settings'" do
    it "should be successful" do
      get 'settings'
      response.should be_success
    end
  end

end
