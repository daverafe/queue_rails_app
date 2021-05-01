class ApplicationController < ActionController::Base
    include ApplicationHelper

    def welcome 
        
    end

    def home 
        @recommendations = Recommendation.most_recent 
    end
end
