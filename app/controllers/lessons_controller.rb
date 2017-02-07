class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lessons_params)
    if @lesson.save
      redirect_to lessons_path
    else
      render :new
    end
  end

private
  def lessons_params
    params.require(:lesson).permit(:title, :content, :number)
  end
end
