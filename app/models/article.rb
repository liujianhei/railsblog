class Article < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 5 }
  has_many :taggings
  has_many :tags, :through => :taggings

<<<<<<< HEAD
  scope :publish, -> { where(status: "publish") }
=======
  mount_uploader :image, ImageUploader
>>>>>>> d2a56be79273af1bf4cd3d905e6d4f359fe34c6c

  def tags_list(need_blank=false)
    content = self.tags.collect { |tag| tag.name }.join(", ")
    content = '' if content.blank? and !need_blank
    content
  end

end
