class Collection < ActiveRecord::Base

  has_many :expressions

  validates :name, :presence => true, :length => {:maximum => 255}
  validates :user, :presence => { :message => 'You have to be logged in to create collections' }
  # TODO add a message to log in to create collections

  belongs_to :user


  # common collection for not registered users
  def self.common
    self.where(:user_id => nil).first
  end


  # collections available for learning
  def self.for_learning(user)
    # collections = []
    # if !user.nil?
    #   collections << user.collections
    # end
    # collections << self.find_all_by_user_id(nil)
    # collections.flatten
    if user
      self.where("user_id = #{user.id}").order('id DESC').joins(:expressions) | self.where("user_id IS NULL").joins(:expressions)\
      | self.where("user_id != #{user.id}").order('id DESC').joins(:expressions)
    else
      self.where("user_id IS NULL").joins(:expressions) |  self.where("user_id IS NOT NULL").order('id DESC').joins(:expressions)
    end
  end

end
