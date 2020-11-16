class UsersController < ApplicationController
    def index
        @users = User.all 
    end 

    def show
        set_user
    end 

    def new
        @user = User.new 
    end

    def create 
        @user = User.build(user_params)
        @user.save 
        flash[:success] = "You have signed up successfully."
        redirect_to '/'
    end 

    def destroy 
        @user.destroy
        session[:user_id] = nil if @user == current_user || current_user.admin?
        flash[:danger] = "Your account has been permanently deleted. This cannot be undone."
        redirect_to root_path
    end 

    private

    def set_user 
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :encrypted_password)
    end 
end 