class WorkoutsController < ApplicationController
    def index
        @workouts = current_user.workouts.all
    end

    def show
        @workout = Workout.find(params[:id])
    end

    def new
    end

    def create
        @workout = Workout.create(name: params[:workout][:name]) 
        @workout[:user_id] = current_user.id
        @workout.save
        redirect_to workouts_path
    end
end
