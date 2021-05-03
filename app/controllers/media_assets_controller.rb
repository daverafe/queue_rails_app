class MediaAssetsController < ApplicationController
    before_action :set_media_asset, except: [:index, :create, :new]
    
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
    end

    def edit
    end

    def update
        if @media_asset.update(media_asset_params)
            redirect_to media_asset_path(@media_asset) 
        else
            render :edit 
        end
    end

    def destroy
        @media_asset.destroy 
        redirect_to media_assets_path 
    end
    
    private
    
    def media_asset_params 
        params.require(:media_asset).permit(:title, :media_type)
    end

    def set_media_asset
        @media_asset = MediaAsset.find_by_id(params[:id])
    end
end
