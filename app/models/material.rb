class Material < ApplicationRecord
    belongs_to :cocktail_materials

    #validates :cocktail_materials, presence: true
    validates :name, presence: true, length: { maximum: 200, minimum: 1 }
end
