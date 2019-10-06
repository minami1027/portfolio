class CocktailMaterial < ApplicationRecord
    belongs_to :item
    has_many :materials, inverse_of: :cocktail_materials, dependent: :destroy
    accepts_nested_attributes_for :materials,
          reject_if: :all_blank, allow_destroy: true

    #validates :item_id, presence: true
    validates :name, presence: true, length: { maximum: 50, minimum: 1 }

end
