class RecommendationsController < ApplicationController

    def index
    end

    def new
        if params[:query] 
            @tv_movie = TvMovie.search(params[:query])
            @recommendation = Recommendation.new 
        else
            @recommendation = Recommendation.new 
        end
    end

    def create
        recommendation = 
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end


    private

    def recommendation_params
    end
end
