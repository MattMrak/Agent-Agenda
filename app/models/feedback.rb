class Feedback < ApplicationRecord
    belongs_to :user
    belongs_to :mission
    validates :notes, presence: true
    validates :notes, uniqueness: {scope: :user_id, message: "already exists"}

end
