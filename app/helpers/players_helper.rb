module PlayersHelper
    def checked(team,user)    
        team.captain_id == user.id || (team.players.pluck(:user_id).include? user.id)  
    end
    
end
