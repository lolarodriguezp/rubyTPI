class EvaluationsController < ApplicationController
  before_action :set_course
  before_action :set_evaluation, only: [:edit, :update, :destroy, :results]
  
  # GET /evaluations
  def index
    @evaluations = @course.evaluations
  end

  # GET /evaluations/new
  def new
    @evaluation = @course.evaluations.new
  end

  # GET /evaluations/1/edit
  def edit
  end

  # POST /evaluations
  def create
    @evaluation = @course.evaluations.new(evaluation_params)
      if @evaluation.save
        redirect_to course_evaluations_path(@course), notice: 'Evaluación creada correctamente.'
      else
        render :new
      end
  
  end

  # PATCH/PUT /evaluations/1
  def update
      if @evaluation.update(evaluation_params)
        redirect_to course_evaluations_path(@course), notice: 'Evaluación actualizada correctamente.'
      else
        render :edit
      end
  end

  # DELETE /evaluations/1
  def destroy
    @evaluation.destroy
    redirect_to course_evaluations_path(@course), notice: 'Evaluación eliminada correctamente.'
  end

  def results
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = @course.evaluations.find(params[:id])
    end
    
    def set_course
      @course = Course.find(params[:course_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_params
      params.require(:evaluation).permit(:title, :min_note, :date, :course_id, exams_attributes:[:id, :note])
    end


end
