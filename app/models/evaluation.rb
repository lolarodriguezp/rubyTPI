class Evaluation < ApplicationRecord
	validates :title, presence: true
	validates :date, presence: true
	validates :minNote, presence:true
	validates :course_id, presence:true
	
	belongs_to :course
	has_many :exams, :dependent => :destroy

end
