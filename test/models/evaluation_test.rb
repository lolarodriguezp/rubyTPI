require 'test_helper'



class EvaluationTest < ActiveSupport::TestCase

	setup do
    	@course = courses(:c_uno)
    	@evaluation1 = evaluations(:uno)
    	@evaluation2 = evaluations(:dos)
    	@exam1 = exams(:uno)
    	@exam2 = exams(:dos)
  	end

	test "should not create evaluation, year must be equal than or greater than course year" do
		e= Evaluation.create(title:"Parcial1", date:'2015-10-01', min_note:4, course: @course)

		refute e.valid?
		refute e.errors[:date].empty?
	end

	test "should student be approved" do
		assert @evaluation1.min_note <= @exam2.note
	end

	test "should student be disapproved" do 	
		assert @evaluation1.min_note > @exam1.note
	end

	test "amount of approved students must be correct" do
		assert_equal(1, @evaluation1.amount_approved)
	end
	
	test "amount of disapproved students must be correct" do
		assert_equal(1, @evaluation1.amount_disapproved)
	end

	test "amount of absent students must be correct" do
		assert_equal(1, @evaluation2.amount_absent)
		assert_equal(0, @evaluation1.amount_absent)
	end

	test "approved percentage must be correct" do
		assert_equal(50, @evaluation1.percent_approved)
	end

end
