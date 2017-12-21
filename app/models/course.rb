class Course < ApplicationRecord
	validates :year, presence: true
	#, numericality: {only_integer:true, greater_than:Date.today.year}

	validates :name, presence: true
					#uniqueness: { scope: :year, message: "This course already exists"}

	has_many :students , dependent: :destroy
	has_many :evaluations, dependent: :destroy
	has_many :exams, :through => :evaluations #obtener los examenes desde las evaluaciones

	#after_create :create_evaluation

	def to_s
		name
	end

end
