class Student < ApplicationRecord
  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :document, presence: true, numericality: {only_integer: true},
  length: { minimum: 7, maximum: 8 }

  validates :docket, presence: true, length: {is: 7 },
    uniqueness: { scope: :course_id, 
                  message: "El estudiante ya se encuentra registrado en el curso"}
  

  validates :email, presence: true, format: { with: Devise.email_regexp }


  after_save :create_exams

  belongs_to :course

  has_many :exams, :dependent => :destroy

  has_many :evaluations, :through => :course 

  #accepts_nested_attributes_for :exams

  def to_s
    "#{first_name} #{last_name}"
  end
 
 private 

   def create_exams
    self.course.evaluations.each do |evaluation|
     exams.find_or_create_by(evaluation_id: evaluation.id)
    end
   end	
 

end
