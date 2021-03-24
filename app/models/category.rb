class Category < ApplicationRecord
    has_many :missions
    validates :urgency_level, presence: true
end
