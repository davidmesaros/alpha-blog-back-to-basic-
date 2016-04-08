class Category < ActiveRecord::Base
  has_many :article_categories
  has_many :articles, through: :article_categories
  validates :name, presence: true, length: {minimum: 3, maximum: 25}
  #validates :name, uniqueness: true --same as the line below
  validates_uniqueness_of :name
end