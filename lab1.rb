puts "Welcome to the Student Registration System!"
print "Please enter your name: "
admin_name = gets.chomp

print "Please enter your age: "
admin_age = gets.chomp.to_i

puts "Hello, #{admin_name}! You are #{admin_age} years old."



students = []

# Method to add a student
def add_student(students)
  print "Enter student's name: "
  name = gets.chomp

  print "Enter student's age: "
  age = gets.chomp.to_i

  student = { name: name, age: age }
  students << student
  puts "Student added successfully!\n\n"
end

# Proc to view all students
view_students = Proc.new do |students|
  if students.empty?
    puts "No students have been added yet.\n\n"
  else
    puts "\nAll Registered Students:"
    students.each_with_index do |student, index|
      puts "#{index + 1}. Name: #{student[:name]}, Age: #{student[:age]}"
    end
    puts "\n"
  end
end

# Lambda to search for a student by name
search_student = lambda do |students|
  print "Enter the name to search: "
  search_name = gets.chomp.downcase

  found = students.find { |student| student[:name].downcase == search_name }

  if found
    puts "Student Found: Name: #{found[:name]}, Age: #{found[:age]}\n\n"
  else
    puts "Student not found.\n\n"
  end
end

# Main menu 
loop do
  puts "Main Menu:"
  puts "1. Add Student"
  puts "2. View All Students"
  puts "3. Search Student by Name"
  puts "4. Exit"
  print "Enter your choice: "
  choice = gets.chomp.to_i

  case choice
  when 1
    add_student(students)
  when 2
    view_students.call(students)
  when 3
    search_student.call(students)
  when 4
    puts "Thank You"
    break
  else
    puts "Invalid choice. Please try again.\n\n"
  end
end

