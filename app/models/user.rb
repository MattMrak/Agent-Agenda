class User < ApplicationRecord
    has_many :missions
    has_many :feedbacks
    has_many :feedbacked_missions, through :feedbacks
    has_many :categories, through :mission
end
