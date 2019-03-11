class Player < ApplicationRecord
  belongs_to :team
  belongs_to :user

  validates :user_id,uniqueness: true
  before_save do
    self.user_id.gsub!(/[\[\]\"]/, "") if attribute_present?("users")
  end
end
