class Student < ApplicationRecord
	validates :firstName, presence: true

	validates :lastName, presence: true

	validates :dni, presence: true, length: { minimum: 7, maximum: 8 }
	
	validates :legajo, presence: true, 
	uniqueness: { scope: :course_id, 
		message: "El estudiante ya se encuentra registrado en el curso"}
	
	validates :mail, presence: true
	
	validates_format_of :mail, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i

	belongs_to :course
	has_many :exams, :dependent => :destroy
	has_many :evaluations, :through => :course #obtener las evaluaciones desde los examenes

end
