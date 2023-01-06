class ExercisesController < ApplicationController

  # GET /users/:user_id/exercises
  def index
    @exercises = @user.exercises
  end

  # GET /users/:user_id/exercises/:id
  def show
    @exercise = Exercise.find(params[:id])
  end

  # GET /users/:user_id/exercises/new
  def new
    @exercise = @user.exercises.build
  end

  # GET /users/:user_id/exercises/:id/edit
  def edit
  end

  # POST /users/:user_id/exercises
  def create
    @exercise = @user.exercises.build(exercise_params)

    if @exercise.save
      redirect_to [@exercise], notice: 'Exercise was successfully created.'
    else
      render :new
    end
  end


  # DELETE /users/:user_id/exercises/:id
  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
    redirect_to user_exercises_url(@user), notice: 'Exercise was successfully destroyed.'
  end

  private

    def exercise_params
      params.require(:exercise).permit(:name)
    end
end
