class Item < ApplicationRecord
    has_many :materials, inverse_of: :item, dependent: :destroy
    has_many :howtomakes, inverse_of: :item, dependent: :destroy
    accepts_nested_attributes_for :materials, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :howtomakes, reject_if: :all_blank, allow_destroy: true

    has_many :users, through: :favorites
    has_many :favorites
    belongs_to :category



    validates :cocktail_name, presence: true, length: { maximum: 200, minimum: 1 }
    validates :category_id, presence: true

    enum listing_stop: { default: 0, stop: 1 }

    attachment :cocktail_image
end
