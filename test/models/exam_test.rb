require 'test_helper'

class ExamTest < ActiveSupport::TestCase

  setup do
		@student1 = students(:uno) 
		@student5 = students(:cinco) 
		@evaluation1 = evaluations(:uno) 
		@evaluation3 = evaluations(:tres)
	end

	test "should evaluation have one exam for one student" do
		assert_difference("Exam.count", 0) do
      		 Exam.create(student: @student1, evaluation: @evaluation1)
      	end
	end

	test "should note of exam be number or nil, only" do
	    assert_difference("Exam.count") do
	      Exam.create(student: @student5, evaluation: @evaluation3, note: 1)
	    end
	    assert_difference("Exam.count", 0) do
	      Exam.create(student: @student5, evaluation: @evaluation3, note:"cinco")
	    end
	end

end
