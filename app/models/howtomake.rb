class Howtomake < ApplicationRecord
    belongs_to :item

    #validates :cocktail_materials, presence: true
    validates :howtomake, presence: true, length: { maximum: 200, minimum: 1 }
end