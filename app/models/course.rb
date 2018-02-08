class Course < ApplicationRecord
  validates :year, presence: true,
    numericality: {only_integer:true, greater_than_or_equal_to: 2014},
    inclusion: { in: 2014..2025 }

  validates :name, presence: true,	
    uniqueness: { scope: :year, message: "Ya existe el curso para el año ingresado"}

  has_many :students , dependent: :destroy
  has_many :evaluations, dependent: :destroy

  #has_many :exams, :through => :evaluations 
  #obtener los examenes desde las evaluaciones

  def to_s
    "#{name} - #{year}"
  end

end
