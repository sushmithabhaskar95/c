class Team < ApplicationRecord
    has_one   :captain, class_name: 'User' , foreign_key: 'captain_id'
    has_many  :users, dependent: :destroy
    
    validates :ground_name, presence:true 
    validates :team_name, presence:true 
    validates :captain_id, presence:true


end
