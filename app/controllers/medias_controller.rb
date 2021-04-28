class MediasController < ApplicationController

    def index
        if params[:query] 
            @medias = Media.search(params[:query])
          else
            @medias = Media.all
        end
    end
    
    def new
        @media = Media.new 
    end

    def create
        media = Media.new(media_params)
        if media.save
            redirect_to media_path(media)
        else
            render :new 
        end
    end

    def show
        @media = Media.find_by_id(params[:id])
    end

    private
    
    def media_params 
        params.require(:media).permit(:title, :media_type)
    end

end
