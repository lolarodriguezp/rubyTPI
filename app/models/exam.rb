class Exam < ApplicationRecord
	validates :note, presence: true
	
	validates :student_id, presence:true, 
	uniqueness:{scope: :exam_id, 
	message:"El estudiante ingresado ya pertenece al exámen especificado"}

	validates :evaluation_id, presence:true

	belongs_to :student
	belongs_to :evaluation




	
end
