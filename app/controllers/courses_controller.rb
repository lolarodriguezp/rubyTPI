class CoursesController < ApplicationController
  before_action :set_course, only: [:edit, :update, :destroy, :summary]

  # GET /courses
  def index
    @courses = Course.all
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  def create
    @course = Course.new(course_params)
      if @course.save
        redirect_to courses_path, notice: 'Curso creado correctamente.'
      else
        render :new 
      end
  end

  # PATCH/PUT /courses/1
  def update
      if @course.update(course_params)
        redirect_to courses_path, notice: 'Curso actualizado correctamente.'
      else
         render :edit 
      end
  end

  def summary
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    redirect_to courses_path, notice: 'Curso eliminado correctamente.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:year, :name)
    end
  end
