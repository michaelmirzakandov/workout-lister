class Exercise < ApplicationRecord
    belongs_to :workout
    has_many :users, :through => :workouts
    validates :name, presence: { message: "must be provided" }
end
