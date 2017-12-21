class Student < ApplicationRecord
	validates :fistName, presence: true
	validates :lastName, presence: true
	validates :dni, presence: true
	validates :legajo, presence: true, uniqueness: { true, 
						scope: :course_id, message: "already exists for this course"}
	validates :mail, presence: true
	validates_format_of :email, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i

	belongs_to :course
	has_many :exams, dependent: => :destroy
	#has_many :evaluations, :through => :course

	#after_save
end
