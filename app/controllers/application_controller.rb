class ApplicationController < ActionController::Base
    include ApplicationHelper
    before_action :authenticate_user, except: [:welcome]

    def welcome 
        if logged_in?
            redirect_to home_path
        end
    end

    def home 
        @recommendations = Recommendation.most_recent 
    end

    private 
    
    def authenticate_user 
        if !logged_in?
            redirect_to root_path
        end
    end
end
