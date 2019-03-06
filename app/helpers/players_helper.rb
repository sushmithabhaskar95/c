module PlayersHelper
    def checked(area)
        @players.user_id.nil? ? false : @player.user_id.match(area)
    end
end
