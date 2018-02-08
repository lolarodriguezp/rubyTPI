class StudentsController < ApplicationController
  before_action :set_course
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  
  # GET /students
  def index
    @students = @course.students
  end

  # GET /students/new
  def new
    @student = @course.students.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  def create
    @student = @course.students.new(student_params)
      if @student.save
        redirect_to course_students_path(@course), notice: 'Alumno creado correctamente.'
      else
        render :new
      end
  end

  # PATCH/PUT /students/1
  def update
      if @student.update(student_params)
        redirect_to course_students_path(@course), notice: 'Alumno actualizado correctamente.'
      else
        render :edit
      end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
      redirect_to course_students_path(@course), notice: 'Alumno eliminado correctamente.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = @course.students.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :document, :docket, :email, :course_id, :exam_id)
    end

    def set_course
      @course = Course.find(params[:course_id])
    end
end
