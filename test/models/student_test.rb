require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  setup do
		@student = students(:uno)
		@course = courses(:c_uno)
		@course2= courses(:c_cuatro)
		@exams= exams(:c1_s1)
	end
	test "should not create two students with the same docket for one course" do
		assert_difference("Student.count", 0) do
      		student= Student.create(first_name:"Martin",last_name:"Perez",course:@course,document:@student.document,docket:13400/8)
    	end
	end

	test "should create exam per evaluation when creating a student" do
  		assert_difference("Exam.count") do
  	     	Student.create(first_name:"Ignacio",last_name:"Pau", email: "ignapau@gmail.com", course:@course2,document:35326894,docket:12504/8)
    	end
	end

	test "should delete exams from student when it's deleted" do
		cant=Exam.count
		@student.destroy
		assert cant > Exam.count
	end
	
	
end
