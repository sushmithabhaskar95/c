class PlayersController < ApplicationController
        def new
            @player= Player.new
            @team = Team.find(params[:team_id])
            @players=User.includes(:roles).where(roles:{name:'Player'})
            @user = @players.all.paginate(page: params[:page], per_page:5)
        end

        def index
        end

        def create
            @team = Team.find(params[:player][:team_id]) 
            params[:users].each do |user|
              @team.players.create(user_id: user)
            end
            flash[:success] = "Added Players!"
        end
        
        def destroy
           
            @player=Player.find(params[:id])
            @player.destroy
           
        end
      
        def show
          @team = Team.find(params[:team_id])
          @players = @team.players
          # @player=User.includes(:players).where(team_id: params[:team_id])
        end

        

private

  def player_params
    params.require(:player).permit( :team_id,:user_id
                                 )
  end

end
