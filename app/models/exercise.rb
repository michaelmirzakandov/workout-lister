class Exercise < ApplicationRecord
    belongs_to :workout
    has_many :users, :through => :workouts
end
