class TvMoviesController < ApplicationController

    def index
        @tv_movies = TvMovie.all 
    end
    
    def new
        @tv_movie = TvMovie.new  
    end

    def create
        tv_movie = TvMovie.new(tv_movie_params)
        if tv_movie.save
            redirect_to tv_movie_path(tv_movie)
        else
            render :new 
        end
    end

    def show
        @tv_movie = TvMovie.find_by_id(params[:id])
    end

    private
    
    def tv_movie_params 
        params.require(:tv_movie).permit(:title)
    end

end
