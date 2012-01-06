class LearnController < ApplicationController


  # GET start
  def index
    @expression = Expression.first
    @collections = Collection.all
  end

  # GET/js next expression
  def next
    @expression = Expression.find params[:id]
  end

  # POST settings change
  def settings
  end



end
