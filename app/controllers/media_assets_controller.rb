class MediaAssetsController < ApplicationController
    def index
        if params[:query] 
            @media_assets = MediaAsset.search(params[:query])
          else
            @media_assets = MediaAsset.all
        end
    end
    
    def new
        @media_asset = MediaAsset.new 
    end
    
    def create
        media_asset = MediaAsset.new(media_asset_params)
        if media_asset.save
            redirect_to media_asset_path(media_asset)
        else
            render :new 
        end
    end
    
    def show
        @media_asset = MediaAsset.find_by_id(params[:id])
    end

    def edit
        @media_asset = MediaAsset.find_by_id(params[:id])
    end

    def update
        @media_asset = MediaAsset.find_by_id(params[:id])
        if @media_asset.update(media_asset_params)
            redirect_to media_asset_path(@media_asset) 
        else
            render :edit 
        end
    end

    def destroy
        @media_asset = MediaAsset.find_by_id(params[:id])
        @media_asset.destroy 
        redirect_to media_assets_path 
    end
    
    private
    
    def media_asset_params 
        params.require(:media_asset).permit(:title, :media_type)
    end
end
