class ItemsController < ApplicationController
    PER = 5

    def index
        #@items = Item.all.
        @item_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(5).pluck(:item_id))
    end

    def show
        @item = Item.find(params[:id])
    end

    def category
        @category = params[:category_id]
        @category = Item.where(category_id: params[:category_id]).where(listing_stop: 0).page(params[:page]).per(PER)
    end

  def check_login
    redirect_to logout_path if current_user && current_user.active_flag != 'active'
  end
end
