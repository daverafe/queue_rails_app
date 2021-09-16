class RecommendationsController < ApplicationController
    before_action :set_recommendation_receiver, except: [:destroy]
    
    def index
        if params[:user_id]
            @recommendations = @user.received_recommendations
        else
            @recommendations = current_user.made_recommendations
        end
        if params[:media_asset_id]
           @media_asset = MediaAsset.find_by_id(params[:media_asset_id])
            @recommendations = @media_asset.recommendations 
        end
    end

    def new
        if params[:user_id]
            @recommendation = @user.received_recommendations.build 
        else
            redirect_to user_path(current_user)
        end
    end

    def create
        if params[:user_id]
            @recommendation = Recommendation.new(recommendation_params)
            @recommendation.recommendation_receiver = @user 
            @recommendation.recommendation_maker = current_user
            if @recommendation.save 
                redirect_to user_path(@user)
            else
                render :new 
            end
        else
            redirect_to user_path(current_user)        
        end
    end

    def destroy
        @recommendation = Recommendation.find_by_id(params[:id]) 
        @recommendation.destroy 
        redirect_to user_path(current_user)
    end


    private

    def recommendation_params
        params.require(:recommendation).permit(:rating, :recommendation_maker_id, :recommendation_receiver_id, :media_asset_id, media_asset_attributes:[:title, :media_type])
    end

    def set_recommendation_receiver
        @user = User.find_by_id(params[:user_id])
    end

end





