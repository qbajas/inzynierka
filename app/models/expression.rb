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

#  before save:
#  check if collection for this expression belongs to user (or nil - an universal collection )


  def next
    Expression.where('id > ?', self.id).order('id ASC').limit(1).first
  end

  def previous
    Expression.where('id < ?', self.id).order('id DESC').limit(1).first
  end

end
