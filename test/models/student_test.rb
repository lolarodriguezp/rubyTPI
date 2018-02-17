require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  setup do
		@student = students(:uno)
		@course1 = courses(:c_uno)
		@course3= courses(:c_tres)
		@exams= exams(:uno)
	end
	test "should not create two students with the same docket for one course" do
		assert_difference("Student.count", 0) do
      		std = Student.create(first_name:"Martin",last_name:"Perez", email: "m.perez@gmail.com",
      			course: @course1, document: 41258741, docket: @student.docket)
    	end
	end

	test "should create exam per evaluation when creating a student" do
  		assert_difference("Exam.count", @course3.evaluations.count) do
  	     	Student.create(first_name:"Ignacio",last_name:"Pau", email: "ignapau@gmail.com", 
  	     		course: @course3, document: 35326894, docket: "12504/8")
    	end
	end

	test "should delete exams from student when it's deleted" do
		cant= Exam.count
		@student.destroy
		assert cant > Exam.count
	end
	
	
end
