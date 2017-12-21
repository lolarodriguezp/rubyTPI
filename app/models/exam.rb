class Exam < ApplicationRecord
	validates :note, presence: true
	validates :student_id, presence:true, uniqueness:{scope: :evaluation_id, 
							message:"Can't have more than one grade for the same evaluation"}
	validates :evaluation_id, presence:true

	belongs_to :student
	belongs_to :evaluation

	
end
