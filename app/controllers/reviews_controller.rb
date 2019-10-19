class ReviewsController < ApplicationController
    before_action :logical_delete_user

    def index
        @review = Review.where(user_id: current_user.id)
        #@item = Item.where(:item_id)
        @test = []

        @review.each do |row|
            #@test.push(row.item_id)
            aaa = [
                row,
                Item.find(row.item_id)
            ]

            @test.push(aaa)
        end
    end

    def new
        @review = Review.new
        @item_id = params[:item_id]
        @current_user = current_user
    end

    def create
      @review = Review.new(user_id: current_user.id, review: params[:review][:review], item_id: params[:review][:item_id])
      if @review.save!
          redirect_to reviews_url
      else
          render 'new'
      end

    end

    def edit
      @review = Review.find(params[:id])
    end

    def update
      @review = Review.find(params[:id])
      if @review.update_attributes(review_params)
          redirect_to reviews_path
      else
          render 'edit'
      end
    end

    def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to reviews_url
    end

    private

    def review_params
        params.require(:review).permit(:review, :item_id).merge(item_id: 1)
        #         reviews_attributes: [:id, :review]
    end

end
