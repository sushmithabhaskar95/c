class TeamsController < ApplicationController
          def new
            @team=Team.new
          end

          def show
            @team=Team.all
          end

            def create 
              @team = Team.new(team_params)
                if @team.save
                  render @team
                else 
                  render 'new'
                end
            end

            def edit
            end
 
            def index

            end
               

    def load_users
      @player= User.includes(:roles).where(roles:{name:'Player'})
      respond_to do |format|
      format.html
      format.js
      format.json
      end
      @player = @player.where(["first_name LIKE?","%#{params[:search]}%"])
    end

    def destroy
      @team = Team.find(params[:id])
     @team.destroy
     render 'show'
    end


  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:team_name,:ground_name,:captain_id
                                   )
    end



end
