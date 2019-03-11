class UserRolesController < ApplicationController
 
  def index
    @user_id = params[:user_id]
    @user_role = UserRole.all
  end

  def new
    @user_id = params[:user_id]
    @user_role = UserRole.find_by id: params["id"]
  end

  
  def create
    @user = User.find(params[:user_role][:user_id])   
    params[:user_role][:role_id].each do |role_id|
      @user.user_roles.create(role_id: role_id)
      flash[:success] = "User Role is Created !"
    end
    
  end
  
  
     
  def edit
  end

  def destroy
  end

  def show
    @user_role = UserRole.find(params[:id])
  end

private
  def user_role_params
    params.require(:user_role).permit( :role_id,:user_id
                                 )
  end

  
end
