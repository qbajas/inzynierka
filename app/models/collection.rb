class Collection < ActiveRecord::Base

  has_many :expressions

  validates :name, :presence => true, :length => {:maximum => 255}
  validates :user, :presence => true
  # TODO add a message to log in to create collections

  belongs_to :user


  # collections available for learning
  def self.for_learning(user)
    collections = self.find_all_by_user_id(nil)
    if !user.nil?
      collections << user.collections
    end
    collections.flatten
  end

end
