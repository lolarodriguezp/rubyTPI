require 'test_helper'

class ExamTest < ActiveSupport::TestCase

  setup do
		@student = students(:one)
		@evaluation= evaluations(:one)
	end

	test "should evaluation have one exam for one student" do
		assert_difference("Exam.count", 0) do
      		 Exam.create(student:@student,evaluation:@evaluation)
      	end
	end
end
