class Expression < ActiveRecord::Base

  validates :name, :presence => true, :length => {:maximum => 255}

  has_attached_file :image,
                    :styles => {
                        :tiny => "32x32",
                        :small => "64x64",
                        :medium => "200x200",
                        :original => "500x500"
                    }

  belongs_to :collection

end
