class Mission < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :feedbacks
  has_many :users, through: :feedbacks
  validates :operation, :objective, presence: true

  scope :alpha, -> { order(:operation) }
  scope :most_feedbacks, -> { left_joins(:feedbacks).group('missions.id').order('count(feedbacks.mission_id) desc') }

  def category_attributes=(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:urgency_level].blank?
  end

end
