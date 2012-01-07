class LearnController < ApplicationController

  before_filter :set_attributes_settings

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
    case params[:type]
      when 'reset'
        session[:guessed] = nil
      when 'attributes'
        # saves hidden attributes to a session
        session[:hidden_attributes] = []
        Expression.list_of_attributes_to_learn.each do |attr|
          if !params[attr]
            session[:hidden_attributes] << attr
          end
        end
      when 'collection'
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

  # session[:guessed] holds hash of ids of guessed expressions and boolean results of a guess
  # session[:hidden_attributes] is an array of strings holding attributes not visible in learning

  private

# sets @correct
  def set_correct
    # if @correct is nil, it means user haven't made a guess
    # otherwise @correct is the result of a guess
    if session[:guessed]
      @correct = session[:guessed][@expression.id]
      #  statistics
      @correct_count = session[:guessed].select { |k, v| v == true }.size
      @incorrect_count = session[:guessed].select { |k, v| v == false }.size
    end
  end

  # sets @attr_visible, basing on session
  def set_attributes_settings
    @attr_visible = Hash.new true
    if session[:hidden_attributes]
      session[:hidden_attributes].each do |attr|
        @attr_visible[attr] = false
      end
    end
  end


end
