class Question < ActiveRecord::Base
  belongs_to :user
  # has_many :comments, as: commentable
  validates :title, :presence => true
  validates :content, :presence => true
end
