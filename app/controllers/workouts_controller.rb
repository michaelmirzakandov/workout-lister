class WorkoutsController < ApplicationController
    def index
        @workouts = current_user.workouts.all
    end

    def show
        @workout = Workout.find(params[:id])
    end

    def new
        @workout = Workout.new
    end


        def create
            @workout = Workout.new(workout_params)
            @workout[:user_id] = current_user.id
            if @workout.save
              redirect workout_path(@workout)
            else
              render :new
            end
          end



    def destroy
        @workout = Workout.find(params[:id])
        @workout.destroy
          redirect_to root_path
    end

    private
    
    def workout_params
        params.require(:workout).permit(:name)
      end
end
