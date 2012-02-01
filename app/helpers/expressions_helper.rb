module ExpressionsHelper

  # override active scaffold default
  def expression_image_column(record)
    image_tag record.image(:small)
  end

  def collections_for_select
    if current_user
      current_user.collections.map { |c| [c.name, c.id] }
    else
      c = Collection.common
      [[c.name, c.id]]
    end
  end


end
