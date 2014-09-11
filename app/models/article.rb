class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  validates :title, presence: true,
                    length: { minimum: 1 }
  validates :text, presence: true,
                    length: { minimum: 1 }
  has_many :taggings
  has_many :tags, :through => :taggings

  scope :publish, -> { where(status: "publish") }
  scope :page, -> { where(article_type: "page") }
  scope :article, -> { where(article_type: "article") }
  mount_uploader :image, ImageUploader

  def tags_list(need_blank=false)
    content = self.tags.collect { |tag| tag.name }.join(", ")
    content = '' if content.blank? and !need_blank
    content
  end

end
