class WorkoutsController < ApplicationController

  # GET /users/:user_id/workouts
  def index
    @workouts = @user.workouts
  end

  # GET /users/:user_id/workouts/:id
  def show
    @workout = Workout.find(params[:id])
  end

  # GET /users/:user_id/workouts/new
  def new
    @workout = @user.workouts.build
  end

  # GET /users/:user_id/workouts/:id/edit
  def edit
  end

  # POST /users/:user_id/workouts
  def create
    @workout = @user.workouts.build(workout_params)

    if @workout.save
      redirect_to [@user, @workout], notice: 'Workout was successfully created.'
    else
      render :new
    end
  end


  # DELETE /users/:user_id/workouts/:id
  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    redirect_to user_workouts_url(@user), notice: 'Workout was successfully destroyed.'
  end

  private

    def workout_params
      params.require(:workout).permit(:name)
    end
end
