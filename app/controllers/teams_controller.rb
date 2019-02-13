class TeamsController < ApplicationController
          def new
            @team=Team.new
          end

          def show

            @team=Team.all
            redirected_to @team

          end


            def create 
                if @team.save
                  redirect_to @team
                else 
                  render 'new'
                end

            end

            def edit
            end

            def load_users
              @user = User.all
                respond_to do |format|
                  format.html
                  format.js
                  format.json
                end

            
            end


  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:user).permit(:team_name,:ground_name,:captain_id 
                                   )
    end



end
