class Feedback < ApplicationRecord
    belongs_to :user
    belongs_to :mission
    validates :notes, presence: true
end
