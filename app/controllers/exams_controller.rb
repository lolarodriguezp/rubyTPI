class ExamsController < ApplicationController
  before_action :set_student
  before_action :set_course
  before_action :set_evaluation
  before_action :set_exam, only: [:show, :edit, :update, :destroy]
  

  # GET /exams
  def index
    @exams = @student.exams
  end

  # GET /exams/1
  def show
  end

  # GET /exams/new
  def new
    @exam = @student.exams.new
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams
  def create
    @exam = @student.exams.new(exam_params)
      if @exam.save
        redirect_to course_student_exams_path(@course, @student), notice: 'Exam was successfully created.'
      else
        render :new
      end

  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    if @exam.update(exam_params)
      redirect_to student_exams_path(@student), notice: 'Exam was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam.destroy
    redirect_to student_exams_path(@student), notice: 'Exam was successfully destroyed.'

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = @student.exams.find(params[:id])
    end

    def set_student
      @student = Student.find(params[:student_id])
    end

    def set_course
      @course = @student.course
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:note, :student_id, :evaluation_id)
    end
end
