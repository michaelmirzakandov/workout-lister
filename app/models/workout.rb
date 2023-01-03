class Workout < ApplicationRecord
    belongs_to :user
    has_many :exercises

    scope :newest_first, -> { order(created_at: :desc) }
end
