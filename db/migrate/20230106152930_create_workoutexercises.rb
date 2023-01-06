class CreateWorkoutexercises < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_exercises do |t|
      t.integer :reps

      t.timestamps
    end
  end
end
