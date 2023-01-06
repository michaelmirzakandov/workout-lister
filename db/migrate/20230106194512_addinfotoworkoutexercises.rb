class Addinfotoworkoutexercises < ActiveRecord::Migration[5.2]
  def change
    add_column :workout_exercises, :exercise_id, :integer
    add_column :workout_exercises, :workout_id, :integer
  end
end
