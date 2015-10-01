class Article < ActiveRecord::Base
	belongs_to :user
	belongs_to :city
	has_many :comments, as: :commentable
	validates :title, presence: true, length: { maximum: 200 }
	validates :content, presence: true

end
