class UsersController < ApplicationController
    before_action :set_user, except: [:index, :new, :create]
    skip_before_action :authenticate_user, only: [:new, :create]
    
    def index
        if params[:query] 
            @users = User.search(params[:query])
          else
            @users = User.all
        end
    end

    def new 
        if logged_in?
            redirect_to home_path
        else
            @user = User.new
        end
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to home_path
        else
            render :new 
        end
    end

    def show
    end

    def edit 
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit 
        end
    end

    def destroy
        @user.destroy 
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find_by_id(params[:id])
    end
end
