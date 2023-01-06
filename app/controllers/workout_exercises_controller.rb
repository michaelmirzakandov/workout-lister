class WorkoutExercisesController < ApplicationController
    before_action :set_workout
    before_action :set_exercise, only: [:create]
  
    # POST /workouts/:workout_id/workout_exercises
    def create
      @workout_exercise = @workout.workout_exercises.build(workout_exercise_params)
  
      if @workout_exercise.save
        redirect_to @workout, notice: 'Workout exercise was successfully created.'
      else
        render :new
      end
    end


    def index 
        @workout_exercises = @workout.workout_exercies.all
    end
  
    private
      def set_workout
        @workout = Workout.find(params[:workout_id])
      end

      def set_exercise
        @exercise = Exercise.find(workout_exercise_params[:exercise_id])
      end
  
  
      def workout_exercise_params
        params.require(:workout_exercise).permit(:reps, :exercise_id, :workout_id)
      end
  end
  