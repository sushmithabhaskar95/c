class User < ApplicationRecord
  has_many :user_roles
  has_many :roles, through: :user_roles, :dependent => :destroy

  # has_many  :players, dependent: :destroy
  # has_many  :teams, through: :players

  validates :first_name,  presence: true, length: { maximum: 50 }
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, length: { maximum: 255 },
                     format: { with: VALID_EMAIL_REGEX },
                     uniqueness: true
  # belongs_to :team  ,optional: true, foreign_key: :captain_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo, PhotoUploader
  

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end


  def full_name
    return "#{self.first_name} #{self.last_name}"
  end
  
  
  def admin?
    roles.pluck(:name).include? "Admin"
  end
  
end
