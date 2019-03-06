class Player < ApplicationRecord
  belongs_to :team
  belongs_to :user


  before_save do
    self.user_id.gsub!(/[\[\]\"]/, "") if attribute_present?("users")
  end
end
