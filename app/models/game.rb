class Game < ApplicationRecord
  has_many :purchases
  validates :title ,{
            presence: true,
            length: {minimum: 10, maximum: 50}
  }

  validates :description, presence: true, length: {minimum: 30}
  validates :image_url, presence: true
  def user_purchased?(user_id)
    purchase = Purchase.where(:game_id => self.id, :user_id => user_id).first
    user_purchase = false
    if purchase
      user_purchase = true
    end
    user_purchase
  end

  def reverse_like(user_id)
    purchase = Purchase.where(:game_id => self.id, :user_id => user_id).first
    if purchase
      purchase.delete
    else
      purchase = Purchase.new(:game_id => self.id, :user_id => user_id)
      purchase.save
    end
  end
end

