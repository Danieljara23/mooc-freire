class CoursesController < ApplicationController
  before_action :find_course, only: [:edit,:show,:update,:destroy]
  before_action :authenticate_user!,only: [:create,:destroy,:update]

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    if @course.save
      flash[:notice] = 'The course have been saved'
      redirect_to course_path(id: @course.id, it_was: 'created')
    else
      render :new
    end
  end

  def edit
    if current_user != @course.user
      flash[:alert] = "I'm sorry, you are not the autor of this course"
      redirect_to root_path
    end
  end

  def index
    @courses = @q.result(distinct: true)
  end

  private

  def course_params
    params.require(:course).permit(:title,:description)
  end

  def find_course
    @course = Course.find(params[:id])
  end

end
