class CollectionsController < ApplicationController
  active_scaffold :collection do |conf|
    #conf.columns.exclude :expressions
    conf.columns[:expressions].form_ui = :select
    conf.create.columns.exclude :expressions

    conf.columns.exclude :created_at, :updated_at


    # DOESN'T WORK WITH JQUERY :((
    #conf.columns[:expressions].options = {:draggable_lists => true}
    #conf.theme = :blue
  end

end