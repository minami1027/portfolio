class Admin::ItemsController < ApplicationController
    before_action :authenticate_administrator!

    PER = 20

    def index
        # @items = Item.where(listing_stop: 0).page(params[:page]).per(PER)
        @items = Item.all
    end

    def Category
        @item = Item.find(params[:id])
    end

    def show
        @item = Item.find(params[:id])
    end

    def new
        @item = Item.new
        @material = @item.materials.build
        @categories = Category.all
    end

    def create
        @item = Item.new(item_params)
        if @item.save
            redirect_to admin_items_url
        else
            render 'new'
        end
    end

    def edit
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])
        if @item.update_attributes(item_params)
            redirect_to admin_item_url
        else
            render 'edit'
        end
    end

    def stop
        @item = Item.find(params[:id])
        @item.update_attributes(listing_stop: 1)
        redirect_to admin_items_url
    end


    private

    def item_params
        params.require(:item).permit(
                :category_id, :cocktail_name, :cocktail_taste, :cocktail_color, :category_id, :alcohol_content, :cocktail_image_id, :alcohol_content, :manufacturing_method,
                    materials_attributes: [:id, :_destroy]
                )
    end
end