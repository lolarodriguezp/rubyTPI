# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
Professor.create(email: 'p.ruby@gmail.com', password: 'ruby2017')

course_1 = Course.create(name: "TTPS", year: Date.today.year-1)
course_2 = Course.create(name: "Lenguaje", year: Date.today.year)

evaluation1 = Evaluation.create(title: "Parcial 1", date: (3.month.from_now + course_1.year), course: course_1, min_note: "9")
evaluation1 = Evaluation.create(title: "Parcial 2", date: (6.month.from_now + course_1.year), course: course_1, min_note: "8")
evaluation1 = Evaluation.create(title: "Parcial 1", date: (3.month.from_now + course_2.year), course: course_2, min_note: "6")
evaluation1 = Evaluation.create(title: "Parcial 2", date: (6.month.from_now + course_2.year), course: course_2, min_note: "6")

student_1 = Student.create(first_name: "Maria", last_name: "Lopez", document: "12345678", 
                           docket: "13502/7", email: "m.lopez@gmail.com", course: course_1)
student_2 = Student.create(first_name: "Pablo", last_name: "Fernandez", document: "12245678",
                           docket: "13260/4", email:"p.fernandez@gmail.com", course: course_1)
student_3 = Student.create(first_name: "Lucio", last_name: "Ucar", document: "12345338",
                           docket: "15482/7", email:"l.ucar@gmail.com", course: course_1)
student_4 = Student.create(first_name: "Roberto", last_name: "Agostino", document: "14545678", 
                           docket: "13045/1", email:"r.agostino@gmail.com", course: course_1)
student_5 = Student.create(first_name: "Analia", last_name: "Alvarez", document: "4444678", 
                           docket: "13250/7", email:"a.alvarez@gmail.com", course: course_2)
student_6 = Student.create(first_name: "Fernanda", last_name: "Perez", document: "77745678", 
                           docket:"14782/4", email:"f.perez@gmail.com", course: course_2)
student_7 = Student.create(first_name: "Mario", last_name: "Rodriguez", document: "87655678",
                           docket:"16254/7", email:"m.rodriguez@gmail.com", course: course_2)
student_8 = Student.create(first_name: "Agustin", last_name: "Tau", document: "12342323",
                           docket: "12047/2", email:"a.tau@gmail.com", course: course_2)

course_1.evaluations.each do |e|
	e.exams.each do |ex|
		ex.update note: rand(15)
	end
end

course_2.evaluations.each do |e|
   e.exams.each do |ex|
      ex.update note: rand(10)
   end
end

