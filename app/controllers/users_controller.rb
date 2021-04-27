class UsersController < ApplicationController
    
    def index
        if params[:query] 
            @users_search = TvMovie.search(params[:query])
            @users = User.all
          else
            @users = User.all
        end
    end

    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            render :new 
        end
    end

    def show
        @user = User.find_by_id(params[:id])
    end

    def edit 
        @user = User.find_by_id(params[:id])
    end

    def update
        @user = User.find_by_id(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit 
        end

    end

    def destroy
        @user = User.find_by_id(params[:id]) 
        @user.destroy 
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    # def set_user
    #     @user = User.find_by_id(params[:id])
    # end
end
