class Exam < ApplicationRecord
  validates :note, numericality: {greater_than_or_equal_to: 0, allow_nil: true}
  
  validates :student_id, presence:true, 
    uniqueness:{scope: :evaluation_id, 
                message:"El estudiante ingresado ya pertenece al exámen especificado"}

  validates :evaluation_id, presence:true

  belongs_to :student
  belongs_to :evaluation

  def to_s
  	if note.nil?
  		"Ausente"
  	else
  		"#{note}"
  	end
  end

  def approved
    if note.nil?
      "-"
    elsif note >= evaluation.min_note
      "Aprobado"
    else
      "Desaprobado"
    end
  end



end
