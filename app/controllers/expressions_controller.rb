class ExpressionsController < ApplicationController

  require 'open-uri'

  active_scaffold :expression do |conf|
    #conf.actions.exclude :delete
    conf.columns = [:image, :name, :definition, :collection]
    # open links in new pages and as popups
    conf.create.link.page = true
    conf.create.link.popup = true
    conf.create.link.label = "Create new expression "

    conf.update.link.page = true
    conf.update.link.popup = true
    #conf.delete.link.inline = false

    # without this, delete does not work in production, another wtf
    conf.delete.link.page = true
  end

  # active scaffold action
  # GET /expressions
  # GET /expressions.json
  #def index
  #  @expressions = Expression.all
  #
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.json { render json: @expressions }
  #    #format.js{
  #    #  collection = Collection.find(params[:assoc_id])
  #    #  @expressions = collection.expressions
  #    #}
  #  end
  #end

  # GET /expressions/1
  # GET /expressions/1.json
  def show
    @expression = Expression.find(params[:id])
    @extended = true #if !request.xhr?
  end

  # GET /expressions/new
  # GET /expressions/new.json
  def new
    @expression = Expression.new
    # set collection id from active scaffold params
    if !params[:eid].nil?
      @collection_id = params[:eid].gsub("collections_", "").gsub("_expressions", "").to_i
      collection = Collection.find_by_id(@collection_id)
      @expression.collection = collection
    end
  end

  # GET /expressions/1/edit
  def edit
    @expression = Expression.find(params[:id])
  end

  # POST /expressions
  # POST /expressions.json
  def create
    @expression = Expression.new(params[:expression])
    set_image_from_params

    if @expression.save
      redirect_to @expression, :notice => 'Expression was successfully created.'
    else
      render :action => "new"
    end
  end

  # PUT /expressions/1
  # PUT /expressions/1.json
  def update
    @expression = Expression.find(params[:id])
    set_image_from_params

    respond_to do |format|
      if @expression.update_attributes(params[:expression])
        format.html { redirect_to @expression, :notice => 'Expression was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # active scaffold action
  # DELETE /expressions/1
  # DELETE /expressions/1.json
  #def destroy
  #  @expression = Expression.find(params[:id])
  #  @expression.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to expressions_url, :notice => 'Expression was successfully deleted.' }
  #    format.json { head :ok }
  #  end
  #end


  # POST /expressions/load_data
  # loads data for expression from external sources
  def load_data
    @query = params[:expression][:name].strip
    #@images = GoogleImage.search(query)

    @definitions = Wordnik.word.get_definitions(@query, :useCanonical => 'true').map { |d| d["text"] }

    begin
      examples = Wordnik.word.get_examples(@query, :useCanonical => 'true')["examples"]
      @examples = examples.map { |e| e["text"] }
    rescue
      @examples = []
    end

    begin
      synonym_response = Wordnik.word.get_related_words(@query, :type => 'synonym', :useCanonical => 'true')
      @synonyms = synonym_response.first["words"]
    rescue
      @synonyms = []
    end

    begin
      # audio expires after a few seconds, so it would have to save it as a file right after a query
      @audios = Wordnik.word.get_audio(@query).select { |a| a["audioType"]=="pronunciation" }.map { |a| a["fileUrl"] }
    rescue #ServerError
      p 'Error fetching audio '
      @audios = []
    end
  end


  private

  # saves paperclip image from external source
  def set_image_from_params
    @expression.image = open(params[:image_url]) unless params[:image_url].empty?
  rescue #OpenURI::HTTPError => error
         #open error
  end

end
