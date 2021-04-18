class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  varidates :shop_name, presence: true
  varidates :image, presence: true
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
