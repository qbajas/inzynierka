class Collection < ActiveRecord::Base

  has_many :expressions

  validates :name, :presence => true, :length => {:maximum => 255}
  #belongs_to :user

end
