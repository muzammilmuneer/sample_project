class User < ActiveRecord::Base
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  ROLE_LIST = [["Admin", 1],["Waiter", 2]]
  ROLE_LIST_HASH = {1 => "Admin", 2 => "Waiter"}
  

  validates :name, :email, :password, :password_confirmation, presence: true

end
