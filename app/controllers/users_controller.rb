class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  

  def index
    @user = User.all.paginate(page: params[:page], per_page:5)
  end

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  
  def edit
  end

    def create
       @user = User.new(user_params)
       if @user.save 
        redirect_to @user 
       else
        render 'new'
      end
    end


  def update  
    if @user.update(user_params)
    redirect_to @user
    else
    render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to '/'
    
  end

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

   private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :photo 
                                   )
    end

  
  
  





end
