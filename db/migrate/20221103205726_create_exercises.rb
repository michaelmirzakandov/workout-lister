class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :workout_id

      t.timestamps
    end
  end
end
