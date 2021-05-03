class RecommendationsController < ApplicationController
    before_action :set_recommendation_receiver, except: [:edit]
    
    def index
        if params[:user_id]
            @recommendations = @user.received_recommendations
        else
            @user = User.find_by_id(session[:user_id])
            @recommendations = @user.made_recommendations
        end
    end

    def new
        if params[:user_id]
            @recommendation = @user.received_recommendations.build 
        else
            @user = current_user 
            redirect_to user_path(@user)
        end
    end

    def create
        if params[:user_id]
            @recommendation = Recommendation.new(recommendation_params)
            @recommendation.recommendation_receiver = @user 
            @recommendation.recommendation_maker = User.find_by_id(session[:user_id])
            if @recommendation.save 
                redirect_to user_recommendations_path(@user)
            else
                render :new 
            end
        else
            @user = current_user 
            redirect_to user_path(@user)        
        end
    end

    def show
        if params[:user_id]
            @recommendation = @user.received_recommendations.find_by_id(params[:id])
        else
            @recommendation = Recommendation.find_by_id(params[:id]) 
        end
    end

    def edit
        @recommendation = Recommendation.recommendation_receiver.find_by_id(params[:id]) 
    end

    def update
        recommendation = Recommendation.find_by_id(params[:id])
        if recommendation.update(recommendation_params)
            redirect_to user_recommendations_path(@user)
        else
            render :edit
        end
    end

    def destroy
        @recommendation = Recommendation.find_by_id(params[:id]) 
        @recommendation.destroy 
        redirect_to user_path(@user)
    end


    private

    def recommendation_params
        params.require(:recommendation).permit(:rating, :recommendation_maker_id, :recommendation_receiver_id, :media_asset_id, media_asset_attributes:[:title, :media_type])
    end

    def set_recommendation_receiver
        @user = User.find_by_id(params[:user_id])
    end
end





