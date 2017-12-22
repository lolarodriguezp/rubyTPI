class ExamsController < ApplicationController
  before_action :set_student
  before_action :set_course
  #before_action :set_evaluation
  before_action :set_exam, only: [:show, :edit, :update, :destroy]
  

  # GET /exams
  # GET /exams.json
  def index
    @exams = @student.exams
  end

  # GET /exams/1
  # GET /exams/1.json
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
  # POST /exams.json
  def create
    @exam = @student.exams.new(exam_params)

    respond_to do |format|
      if @exam.save
        format.html { redirect_to student_exams_path(@student), notice: 'Exam was successfully created.' }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to student_exams_path(@student), notice: 'Exam was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to student_exams_path(@student), notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
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
