class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
    @next_lesson = Lesson.find_by_number(@lesson.number + 1)
    @previous_lesson = Lesson.find_by_number(@lesson.number - 1)
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      flash[:notice] = "Your lesson has been successfully added!"
      redirect_to lesson_path(@lesson)
    else
      render :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      flash[:notice] = "The selected lesson has been updated!"
      redirect_to lesson_path(@lesson)
    else
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    flash[:notice] = "The selected lesson has been successfully deleted!"
    redirect_to lessons_path
  end

private
  def lesson_params
    params.require(:lesson).permit(:title, :content, :number)
  end
end
