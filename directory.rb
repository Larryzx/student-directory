students = []
def print_header 
  puts"The students of the Villians Academdy"
  puts "-------------"
end 
def print(students)
  students.each.with_index do |student, idx|
    puts ("#{idx +1} #{student[:name]} (#{student[:cohort]} cohort)")     
  end
end
def print_footer(names)
   puts "Overall, we have #{names.count} great students"
end  
def input_students
  puts "Please enter the names of the students "
  puts "To finish just hit return twice"
  #create and empty array to store data
  students = []
  #get this first name
  name =gets.chomp 
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :novermber}
    puts "Now we have #{students.count} students"
     # get another name from the user
     name =gets.chomp
  end
  #return the array of students
  students
end  
students = input_students
print_header
print(students)
print_footer(students)

