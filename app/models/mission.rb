class Mission < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :feedbacks
  has_many :users, through: :feedbacks

  scope :alpha, -> { order(:operation) }
  scope :most_feedbacks, -> { joins(:feedbacks).group('missions.id').order('count(missions.id) desc') }

  def category_attributes=(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:urgency_level].blank?
  end

end
