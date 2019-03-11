class Team < ApplicationRecord
    # has_one   :captain, class_name: 'User' , foreign_key: 'captain_id'
    # has_many  :users, dependent: :destroy
    belongs_to :captain, class_name: 'User'

    
    has_many  :players,dependent: :destroy
    

    # validates :ground_name,presence:true 
    # validates :team_name, presence:true 
    # svalidates :captain_id,presence:true,uniqueness:true
  

end
