class Item < ApplicationRecord
    has_many :cocktail_materials, inverse_of: :item, dependent: :destroy
    accepts_nested_attributes_for :cocktail_materials,
                    reject_if: :all_blank, allow_destroy: true

    has_many :users, through: :favorites
    has_many :favorites
    belongs_to :category



    validates :item_name, presence: true, length: { maximum: 200, minimum: 1 }
    validates :category_id, presence: true
    validates :category, length: { maximum: 50 }

    enum listing_stop: { default: 0, stop: 1 }

    attachment :cocktail_image
end
