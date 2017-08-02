class User < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  ROLE_LIST = [["Admin", 1],["Waiter", 2]]
  ROLE_LIST_HASH = {admin: 1, waiter: 2}

  validates :name, presence: true
  scope :admins, -> { where(role_id: 1) }
  before_destroy :check_if_last_admin


  #use
  def admin?
    role_id == ROLE_LIST_HASH[:admin]
  end

  def waiter?
    role_id == ROLE_LIST_HASH[:waiter]
  end
  
  def check_if_last_admin
    if User.admins.count == 1
      errors.add(:base, "You cannot delete yourself. You are the last admin")
      return false
    end
  end

end
