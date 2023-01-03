class Workout < ApplicationRecord
    belongs_to :user
    has_many :exercises
    validates :name, presence: { message: "must be provided" }

    scope :newest_first, -> { order(created_at: :desc) }
end
