require 'test_helper'

class EvaluationTest < ActiveSupport::TestCase
require 'test_helper'

class EvaluationTest < ActiveSupport::TestCase

	setup do
    	@course = courses(:c_uno)
    	@evaluation = evaluations(:uno)
  	end

	test "should not create evaluation, year must be equal than or greater than course year" do
		e=Evaluation.create(tittle:"Parcial1",date:'2015-10-01',min_note:4,course:@course)

		refute e.valid?
		refute e.errors[:date].empty?
	end

	test "should student be approved" do
		s=Student.create(first_name:"Alu",last_name:"mno",document:40138184,email:"alu.mno@gmail.com",docket:'13502/8',course:@course)
		exam=s.exams.detect{|e| e.evaluation==@evaluation}
		assert exam.note.nil?
		exam.note=8
		exam.save
		assert @evaluation.min_note <= exam.note 
	end

	test "should student be disapproved" do 	
		s=Student.create(first_name:"Pepe",last_name:"perez",docket:31524879,email:"pepe.p@gmail.com",docket:'12504/8',course:@course)
		exam=s.exams.detect{|e| e.evaluation==@evaluation}
		assert exam.exam.nil?
		exam.exam=2
		exam.save
		assert @evaluation.min_note > exam.note 
	end

	test "amount of approved students must be correct" do
		assert_equal(1,@evaluation.amount_approved)
	end
	
	test "amount of disapproved students must be correct" do
		assert_equal(1,@evaluation.amount_disapproved)
	end

	test "amount of absent students must be correct" do
		assert_equal(1,@evaluation.amount_absent)
	end

	test "approved percentage must be correct" do
		assert_equal(50,@evaluation.percent_approved)
	end

end
