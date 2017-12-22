class Exam < ApplicationRecord
	validates :note, presence: true
	validates :student_id, presence:true, uniqueness:{scope: :evaluation_id, 
							message:"Can't have more than one grade for the same evaluation"}
	validates :evaluation_id, presence:true

	belongs_to :student
	belongs_to :evaluation

	before_save :set_evaluation

	def set_evaluation
      @evaluation = self.course.evaluations.find(params[:evaluation_id])
    end
	
end
