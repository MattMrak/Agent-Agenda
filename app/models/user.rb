class User < ApplicationRecord
    has_many :missions
    # has_many :categories, through :missions
    has_many :feedbacks
    has_many :feedbacked_missions, through: :feedbacks, source: :mission
    has_secure_password #authenticate, validate password
    
end
