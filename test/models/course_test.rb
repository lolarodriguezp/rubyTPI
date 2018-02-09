require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  setup do
    @course = courses(:c_uno)
  end

  test "should create course" do
   	  assert_difference("Course.count") do
      	course= Course.create(name:"Lenguaje",year:Date.today.year)
      end
  end

   test "Course name must be unique in a year" do
  	a=Course.create name:@course.name , year:@course.year
  	
    refute a.valid?
    refute a.errors[:name].empty?
  end

  test "should not create course with a year less than 2014" do
  	b=Course.create name:"Taller" , year:2013
  	
  	refute b.valid?
    refute b.errors[:year].empty?

  end

end


end
