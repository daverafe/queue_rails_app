class RecommendationsController < ApplicationController

    def index
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])
            @recommendations = @user.made_recommendations
        else
            @recommendations = Recommendations.all 
        end
    end

    def new
        @recommendation = Recommendation.new 
    end

    def create
        user = User.find_by_id(params[:user_id])
        recommendation = user.recevied_recommendations.build(recommendation_params)
        if recommendation.save 
            redirect_to user_recommendation_path(user, recommendation)
        else
            render :new  
        end
    end

    def show
        if params[:user_id]
            user = User.find_by_id(params[:user_id])
            @recommendation = user.recommendations.find_by_id(params[:id])
        else
            @recommendation = Recommendations.find_by_id(params[:id]) 
        end
    end

    def edit
            @recommendation = Recommendation.find_by_id(params[:id]) 
    end

    def update
        user = User.find_by_id(session[:user_id])
        recommendation = Recommendation.find_by_id(params[:id])
        if recommendation.update(recommendation_params)
            redirect_to user_recommendation_path(user) 
        else
            render :edit
        end
    end

    def destroy
        user = User.find_by_id(session[:user_id])
        @recommendation = Recommendation.find_by_id(params[:id]) 
        @recommendation.destroy 
        redirect_to user_path(user)
    end


    private

    def recommendation_params
        params.require(:recommendation).permit(:rating)
    end
end





