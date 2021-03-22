class Mission < ApplicationRecord
  belongs_to :user
  has_many :feedbacks
  has_many :users, through: :feedbacks
  # belongs_to :category
end
