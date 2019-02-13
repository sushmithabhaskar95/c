class UserRole < ApplicationRecord
  belongs_to :role
  belongs_to :user
  validates :user_id, :uniqueness => { :scope => :role_id }
 


end
