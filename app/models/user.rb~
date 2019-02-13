class User < ApplicationRecord
  has_many :user_roles
  has_many :roles, through: :user_roles, :dependent => :destroy
  
  validates :first_name,  presence: true, length: { maximum: 50 }
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, length: { maximum: 255 },
                     format: { with: VALID_EMAIL_REGEX },
                     uniqueness: true
  belongs_to :team,optional: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo, PhotoUploader
  def admin?
    roles.find_by_name('admin').present?
  end


  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end


end
