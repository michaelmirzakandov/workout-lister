class Removeinfofromexercises < ActiveRecord::Migration[5.2]
  def change
    remove_column :exercises, :workout_id
  end
end
