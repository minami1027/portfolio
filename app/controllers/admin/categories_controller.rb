class Admin::CategoriesController < ApplicationController
    def index
        @category = category.all
      end

      def new
        @category = category.new
      end

      def create
        @category = category.new(genre_params)
        if @category.save
          redirect_to admin_categories_path
        else
          render 'new'
        end
      end

      def edit
        @category = category.find(params[:id])
      end

      def update
        @category = category.find(params[:id])
        if @category.update_attributes(category_params)
          redirect_to admin_categories_path
        else
          render 'edit'
        end
      end

      def destroy
        @category = category.find(params[:id])
        @category.destroy
        redirect_to admin_categories_path
      end

      private

        def category_params
          params.require(:category).permit(:category_name)
        end
    end
end
