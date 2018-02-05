class Evaluation < ApplicationRecord
	validates :title, presence: true

	validates :date, presence: true
	
	validates :minnote, presence:true,
	numericality: {greater_than_or_equal_to: 0}
	
	validates :course_id, presence:true
	
	belongs_to :course
	has_many :exams, :dependent => :destroy

end
