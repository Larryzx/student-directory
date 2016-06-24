students = []
def print_header 
  puts"The students of the Villians Academdy"
  puts "-------------"
end 
def print(students)
   counter = 0
    student_count = students.count
   while counter <= student_count -1
    student = students[counter]
    puts (counter+1).to_s + student[:name] +" " +"(" + student[:cohort].to_s + " cohort)"
    counter = counter + 1
  end
end
def print_footer(names)
   puts "Overall, we have #{names.count} great students"
end 
def input_students
  puts "Enter student details at each prompt: "
  puts "If you have finished entering last student just hit enter at name prompt"
  #create and empty array to store data
  students = []
  while true
    puts "Students Name:"
    name = gets.chomp
    if name.empty? 
      break # terminate loop
    end 
    puts"Sex (male/female)"
    sex = gets.chomp.downcase!
    puts "Country of birth"
    country_birth =gets.chomp
    # add the student hash to the array including additional stuff
    students << {name: name, gender: sex, birth_place: country_birth, cohort: :november}
    puts "Now we have #{students.count} students"
     # get another name from the user
  end
  #return the array of students
  students
end 
def print_beginwith (students)
  # create a cop of students array not to affect it
  copy_students = students
  #name_list is an empty array that will hopefully  contain matched names 
  #so that it can be returned to print students
  name_list = []
  puts "Enter first letter of students to searach for names"
  letter = gets.chomp 
  letter.downcase!
  puts letter
  copy_students.each do |student|
    #acess each students name
    #downcase it and extract first letter 
    name = student[:name]
    cohort = student[:cohort]
    first_letter = name[0]
    first_letter.downcase!
    # puts name[0]
    # now we have what we need to make comparisons
    #puts ("#{name} student name #{cohort}")
    #puts"#{letter} letter #{first_letter}: first letter"
    if letter == first_letter
      name_list << {name: name, cohort: cohort}  
    end  
  end 
  puts"students that match are listed below:"
  print(name_list)
end  
def undertwelve(students)
  puts "This prints outs students names who are less than twelve characters long"
  # make a copy of students so as not to alter it
  copy_students = students
  # make a blank list so we can add items to it
  list = []
  #go through each studen count the characters in their name
  # if there is less than twelve add there name to lis[]
  copy_students.each do |student|
    name = student[:name]
    cohort = student[:cohort]
    name_length = name.length
    string_pos = 0
    while string_pos <= name_length -1 #eliminate spaces 
     if name[string_pos] == ' '
       name_length -= 1   
     end
     string_pos +=1
    end
    if name_length <12
      list << {name: name, cohort: cohort}
    end  
  end 
  print(list)
end  
students = input_students
print_header
print(students)
print_footer(students)
#print_beginwith(students)
#undertwelve(students)

