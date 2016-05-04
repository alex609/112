class NewsPost < ActiveRecord::Base

  belongs_to :user
  has_many :image_posts

  validates :title, presence: true
  validates :post_text, presence: true

  def self.edit_by?(u)
    u.try(:admin?)
  end

end
