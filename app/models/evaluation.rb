	class Evaluation < ApplicationRecord
  default_scope { order('date ASC') }

  validates :title, presence: true

  validates :date, presence: true

  validates :min_note, presence:true,
    numericality: {greater_than_or_equal_to: 0}

  validates :course_id, presence:true

  validate :validate_date

  belongs_to :course

  has_many :students, :through => :course

  has_many :exams, dependent: :destroy

  accepts_nested_attributes_for :exams


  after_save :create_exams

  def validate_date
    if (date.year <= course.year) then
      errors.add(:date, "Debe ser igual o mayor al año del curso") 
    end
  end

  def to_s
    "#{title}"
  end

  def amount_approved
    exams.where("note >= #{min_note}").count
  end

  def amount_disapproved
    exams.where("note < #{min_note}").count
  end

  def amount_absent
    exams.where("note = null").count
  end

  def percent_approved
    begin
      ((amount_approved * 100) / (exams.where("note is not null").count))
    rescue ZeroDivisionError
      "0"
    end
  end

  private

  def create_exams
    students.each do |student|
     exams.find_or_create_by(student_id: student.id)
    end
  end 
  


end
