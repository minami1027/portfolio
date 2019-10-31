class Admin::ItemsController < ApplicationController
    before_action :authenticate_administrator!

    PER = 9

    def index
        # @items = Item.where(listing_stop: 0).page(params[:page]).per(PER)
        # @items = Item.all
        @item_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(5).pluck(:item_id))

    end

    def category
        @category_items = Item.where(category_id: params[:category_id])
        @category = Item.where(category_id: params[:category_id]).where(listing_stop: 0).page(params[:page]).per(PER)
    end

    def show
        @item = Item.find(params[:id])
        @categories = Category.all
        # render 'items/show'
    end

    def new
        @item = Item.new
        @material = @item.materials.build
        @howtomake = @item.howtomakes.build
        @categories = Category.all
    end

    def create
        @item = Item.new(item_params)
        if @item.save
            redirect_to admin_item_url(@item)
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
                :category_id, :cocktail_name, :cocktail_taste, :cocktail_color,:cocktail_introduction,
                :alcohol_content, :cocktail_image, :manufacturing_method,
                    materials_attributes: [:id, :material, :_destroy],
                     howtomakes_attributes: [:id, :howtomake, :_destroy]
                )
    end
end