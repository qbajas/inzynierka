class LearnController < ApplicationController

  # GET start
  def index
    if params[:id]
      # id is in url
      @expression = Expression.find params[:id]
    elsif session[:last_expression]
      # id saved in session
      @expression = Expression.find session[:last_expression]
    else
      # first visit
      @expression = Expression.first
    end
    set_correct
    @collections = Collection.all
  end

  # GET/js next expression
  def next
    @expression = Expression.find params[:id]
    set_correct
    # set direction so that we know which side to slide
    if params[:direction] == 'prev'
      @direction = 'left'
    else
      @direction = 'right'
    end
    #  save position
    session[:last_expression] = @expression.id
  end

  # POST settings change
  def settings
    if params[:reset]
      session[:guessed] = nil
    end
    redirect_to :action => :index
  end

  # POST guess a name of an expression
  def guess
    @expression = Expression.find params[:id]
    @correct = params[:guess].strip == @expression.name.strip
    # save in session hash
    session[:guessed] = {} if !session[:guessed]
    session[:guessed].merge!({@expression.id => @correct})
    set_correct
  end


  private

  # sets @correct
  def set_correct
    # if @correct is nil, it means user haven't made a guess
    # otherwise @correct is the result of a guess
    if session[:guessed]
      @correct = session[:guessed][@expression.id]
    #  statistics
      @correct_count = session[:guessed].select{|k,v| v == true}.size
      @incorrect_count = session[:guessed].select{|k,v| v == false}.size
    end
  end


end
