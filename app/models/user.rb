class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :collections

  after_save :create_collection


  # extract login from email
  def login_from_email
    self.email =~ /(.*)@(.*)/
    $1
  end

  private

  # create first collection for a user
  def create_collection
    self.collections.create(:name => "#{self.login_from_email}'s collection")
  end

end
