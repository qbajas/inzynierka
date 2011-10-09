module ExpressionsHelper

  def expression_image_column(record)
    image_tag record.image(:small)
  end

end
