	class Evaluation < ApplicationRecord
  validates :title, presence: true

  validates :date, presence: true

  validates :min_note, presence:true,
    numericality: {greater_than_or_equal_to: 0}

  validates :course_id, presence:true

  belongs_to :course

  has_many :students, :through => :course

  has_many :exams, dependent: :destroy

  accepts_nested_attributes_for :exams
  #exams_atributes

  after_save :create_exams

  def to_s
    "#{title}"
  end

  private

  def create_exams
    students.each do |student|
     exams.find_or_create_by(student_id: student.id)
    end
  end 
  


end
