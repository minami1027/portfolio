class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, through: :favorites
  has_many :favorites

  # validates :user_name, presence: true, length: { maximum: 50, minimum: 1 }
  validates :email, presence: true
  validates :encrypted_password, presence: true
  # validates :is_delete, presence: true

  # enum is_delete: {  exist: 0, remove: 1 }

  attachment :profile_image

  #favorites関連

  #いいねする
  def iine(item)
    favorite = favorites.build(item_id: item.id)
    favorite.save
  end

  #いいねを外す
  def uniine(item)
    favorite = favorites.find_by(item_id: item.id)
    favorite.destroy
  end

  #現在のユーザーがそのカクテルに対していいねしているか
  def iine?(item)
    favorites.exists?(item_id: item.id)
  end
end
