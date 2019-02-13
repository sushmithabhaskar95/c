class Team < ApplicationRecord
    has_one   :captain, class_name: 'User' , foreign_key: 'captain_id'
    has_many  :users, dependent: :destroy
end
