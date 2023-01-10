class AddColumnWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :catagory_id, :integer
  end
end
