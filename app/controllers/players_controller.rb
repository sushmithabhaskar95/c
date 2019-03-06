class PlayersController < ApplicationController
        def new
            @player= Player.new
            @team = Team.find(params[:team_id])
            @user = User.all.paginate(page: params[:page], per_page:2)
        end

        def index

        end


        def create
            logger.info "SSSSSSSSSSSS"
            @team = Team.find(params[:player][:team_id])
            logger.info params[:users]
            params[:users].each do |user|
              logger.info "AAAAAAAAAAAAAAAAAAAAAA"
              logger.info user
              @team.players.create(user_id: user)
            end
        end
        
        def destroy

        end
      

        def show


        end


private

  def player_params
    params.require(:player).permit( :team_id,:user_id
                                 )
  end

end
