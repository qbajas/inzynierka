class CollectionsController < ApplicationController

  active_scaffold :collection do |conf|
    conf.columns[:expressions].form_ui = :select
    conf.create.columns.exclude :expressions, :user
    conf.columns.exclude :created_at, :updated_at, :user
    # DOESN'T WORK WITH JQUERY :((
    #conf.columns[:expressions].options = {:draggable_lists => true}
    #conf.theme = :blue
    #conf.actions << :nested
    # NOT WORKING - WHY ?!
    conf.nested.add_link 'Show expressions', [:expressions]
  end

  protected

  # active scaffold - save user for a collection
  def before_create_save(record)
    record.user = current_user
  end

end