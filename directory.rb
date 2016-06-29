@students = [] # an empty array accessible to all methods
@success = false
def print_header 
   line_width = 120
   academy_string ="The students of the Villians Academdy"
   separator= "-------------"
   puts academy_string.center(line_width)
   puts separator.center(line_width)
end 
def print_students_list
    #line_width = 40
    students_by_cohorts
    if @students == []
      puts "No students were added"
      interactive_menu
    end  
    counter = 0
    student_count = @students.count
   # puts student_count
   while counter <= student_count -1
    student = @students[counter]
    output_name = student[:name]
    output_cohort = student[:cohort]
    space =' '
    #puts (counter+1).to_s + student[:name] +" " +"(" + student[:cohort].to_s + " cohort)" too bitty
    output_string = "#{space*8}#{counter+1} #{output_name} #{output_cohort}"
    puts output_string
    counter = counter + 1
   end
end
def print_footer 
  names = @students
  line_width = 120
  if names.count > 1
    footer_string ="Overall, we have #{names.count} great students"
  else  
     footer_string ="Overall, we have #{names.count} great student"
  end
  puts footer_string.center(line_width)
end 
def student_tally
   num_students = @students.count
    if num_students > 1
      puts "Now we have #{@students.count} students"
    else
      puts "Now we have #{@students.count} student"   
    end
end  
def input_students
  # default value for keys that are not set is nil
  puts "Enter student details at each prompt: "
  puts "If you have finished entering last student just hit enter at name prompt"
  #create and empty array to store data
  # @students =[] not required
  while true
    puts "Students Name:"
    name = STDIN.gets.chomp
    if name.empty? 
      break # terminate loop
    end 
    puts"Students Cohort:"
    cohort = STDIN.gets.chomp
    cohort = cohort.downcase
    # check for a value if not supply a default
    #convert string for cohort entered to a symbol
    if cohort.empty?
      #supply suitable default ?
      cohort = '0'.to_sym
    else
      cohort = cohort.to_sym
    end 
    sex =''
    while !(sex == "male" || sex =="female")
      puts"Sex (male/female)"
      sex = STDIN.gets.chomp
    end  
    puts "Country of birth"
    country_birth = STDIN.gets.chomp
    # add the student hash to the array including additional stuff
    if name == ''
      name ='0'# usassigned value so set to zero
    end  
    @students << {name: name, gender: sex, birth_place: country_birth, cohort: cohort}
    #call student tally instead
    student_tally
  end
  @success = true
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
def students_by_cohorts
  #genearate a list of cohorts put into an array called cohorts
  cohorts = []
  cohort_list = []
  # may need to remove dupicate cohorts and sort the array into order
  #make a copy of students not to alter it
  students_copy = @students
  students_copy.each do |student|
     cohorts << student[:cohort]
  end
  temp = cohorts
  temp.uniq! #make it array unique
  temp.sort! # sort into order
  cohorts = temp
  #Now using the cohorts array cycle through it
  #one by one and for each cohort find students print them out
  cohorts.each do |cohort|
    students_copy.each do |student|
    if student[:cohort]  == cohort
      name = student[:name]  
      month = student[:cohort]
      sex= student[:gender]
      country_birth = student[:birth_place]
      cohort_list << {name: name, cohort: month, gender: sex, birth_place: country_birth}
      #{name: name, gender: sex, birth_place: country_birth, cohort: cohort}
    end  
    end   
  end 
  @students = cohort_list #no return here required
end 
#interactive_menu puts up the choices and controls the program so 
#no need to call input_students etc.. 
def user_feedback(call_result)
  if @success
    case call_result
      when 'input'
        puts 'input successful'
      when 'show'  
        puts'Show successful'
      when 'save'    
        puts'save successful'  
      when 'load'
        puts "Load successful"
    end  
  end 
  @success = false
end  
def interactive_menu
  @success = false
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit" # 9 because we'll be adding more items  
end
def show_students
  print_header
  print_students_list
  print_footer
  @success = true
end
def process(selection)
   msg = ''
  case selection
    when "1"
      input_students
      msg = 'input'
      user_feedback(msg)
    when "2"
      show_students
      msg = 'show'
      user_feedback(msg)
    when "3"  
      save_students
      msg = 'save'
      user_feedback(msg)
    when "4"
      load_students
      msg = 'load'
      user_feedback(msg) 
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end  
def file_exists (file) 
   if File.exists?(file)
     return true
   else
    return false   
   end
end  

def save_students
  # open the file for 
  puts 'Enter a name for a file to sava your students:'
  filename = STDIN.gets.chomp
  file_there = file_exists(filename +'.csv')
  response = ''
  if file_there
    while !(response == 'y' || response == 'n')
      puts "file exists do you wish to overwrite it(y/n)"
      response = STDIN.gets.chomp
    end 
  end  
  if (file_there == false) || (response == 'y') #file does not exist or user wants to write over it
    file = File.open(filename +'.csv', "w")
    # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort],student[:gender], student[:birth_place]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    file.close
    @success = true
  end
end
def load_students(filename = "students.csv")
  puts "Enter a file to open"
  non_default = STDIN.gets.chomp
  #non_default = non_default+'.csv'
  file_there = file_exists(non_default)
  stud_file  = file_exists(filename)
  if (file_there == false) 
    puts "File does not exist in default location to try another choose option 4 again"
    @success = false
    return
   else # file exist and can be opened
    file = File.open(non_default, "r")
    file.readlines.each do |line|
      name, cohort, gender,birth_place = line.chomp.split(',')
      @students << {name: name, cohort: cohort.to_sym, gender: gender, birth_place: birth_place}
    end
    file.close
    @success = true
  end  
end
def load_students_default(filename = "students.csv")
  stud_file  = file_exists(filename)
  if stud_file == false
    puts"default load failed"
    exit
  end  
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  temp = ARGV[0]
  if temp == nil #load default file
    load_students_default
  end  
   return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students_default (filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end
 try_load_students
 interactive_menu
#students = input_students
#print_header
print(students)
#print_footer(students)
#students_by_cohorts(students)
#print_beginwith(students)
#undertwelve(students)

