class Workout < ApplicationRecord
    belongs_to :user
    has_many :workout_exercises
    has_many :exercises, through: :workout_exercises
    validates :name, presence: { message: "must be provided" }

    scope :newest_first, -> { order(created_at: :desc) }
end
