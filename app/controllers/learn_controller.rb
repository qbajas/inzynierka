class LearnController < ApplicationController


  # GET start
  def index
    @expression = Expression.first
    @collections = Collection.all

    @prev_active = false
    @next_active = true
  end

  # GET/js next expression
  def next
  end

  # POST settings change
  def settings
  end

end
