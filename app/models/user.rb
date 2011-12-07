class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  has_many :adverts, dependent: :nullify

  validates :name, :presence => true, :uniqueness => true

  def to_s
    name
  end

end
