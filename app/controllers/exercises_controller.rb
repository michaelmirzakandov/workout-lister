class ExercisesController < ApplicationController
    def new
        if params[:workout_id] && !Workout.exists?(params[:workout_id])
            redirect_to workouts_path, alert: "workout not found."
          else
            @exercise = Exercise.new(workout_id: params[:workout_id])
          end
    end

    def update
        @exercise = Exercise.find(params[:id])
        @exercise.update(exercise_params)
        redirect_to exercise_path(@exercise)
    end

    def edit
        if params[:workout_id]
          workout = Workout.find_by(id: params[:workout_id])
          if workout.nil?
            redirect_to workouts_path, alert: "workout not found."
          else
            @exercise = workout.exercises.find_by(id: params[:id])
            redirect_to workout_exercises_path(workout), alert: "exercise not found." if @exercise.nil?
          end
        else
          @exercise = Exercise.find(params[:id])
        end
      end
  
    def create
      @exercise = Exercise.new(exercise_params)
      if @exercise.save
        redirect_to @exercise
      else
        render :new
      end
    end

    def show
      @exercise = Exercise.find(params[:id])
    end
    
    private

    def exercise_params
        params.require(:exercise).permit(:name, :workout_id)
      end
end
