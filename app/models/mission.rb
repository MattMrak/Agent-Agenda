class Mission < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :feedbacks
  has_many :users, through: :feedbacks

  def category_attributes=(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:name].blank?
  end
end
