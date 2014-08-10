class Article < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 5 }
  has_many :taggings
  has_many :tags, :through => :taggings
end
