module ExercisesHelper
    def workout_id_field(exercise)
        if exercise.workout.nil?
          select_tag "exercise[workout_id]", options_from_collection_for_select(workout.all, :id, :name)
        else
          hidden_field_tag "exercise[workout_id]", exercise.workout_id
        end
      end
end
