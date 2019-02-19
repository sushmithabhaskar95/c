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
                  redirect_to @team
                else 
                  render 'new'
                end
            end

            def edit
            end

            
    

    def load_users
      @query= User.includes(:roles).where(roles:{name:'Player'})
      respond_to do |format|
      format.html
      format.js
      format.json
      end
      @query = @query.where(["first_name LIKE?","%#{params[:search]}%"])
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
