class RolesController < ApplicationController
  before_action :find_role, only: [ :show,:edit,:update,:destroy]
    
  def index
    @role=Role.all
  end

  def new
    @role = Role.new
  end
  
  def edit
  end
  
  def create
      @role = Role.new(role_params)
      if @role.save
      redirect_to @role
      end
  end

  def update
    
    if @role.update(role_params)
    redirect_to @role
    else
    render :edit
    end
  end
  
  def destroy
    @role.destroy
    redirect_to '/'
  end
    
  def show
    @role=Role.all
  end
  
  
  private
  
    def role_params
    params.require(:role).permit(:name,:active)
    end

    def find_role
     @role = Role.find(params[:id])
    end
    
end
