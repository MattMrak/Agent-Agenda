class Mission < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :feedbacks
  has_many :users, through :feedbacks
end
