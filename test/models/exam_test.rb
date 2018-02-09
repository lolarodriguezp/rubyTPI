require 'test_helper'

class ExamTest < ActiveSupport::TestCase

  setup do
		@student = students(:uno)
		@student2 = students(:dos)
		@evaluation= evaluations(:uno)
	end

	test "should evaluation have one exam for one student" do
		assert_difference("Exam.count", 0) do
      		 Exam.create(student:@student,evaluation:@evaluation)
      	end
	end

	test "should note of exam be number or nil, only" do
	    assert_difference("Exam.count") do
	      Exam.create(student: @student,evaluation: @evaluation, note: 1)
	    end
	    assert_difference("Exam.count", 0) do
	      Exam.create(student:@student2,evaluation:@evaluation, note:"hola")
	    end
	end

end
