#CodeCademy Final Project for Ruby, a To-Do List
#Also, less cool, but my first actual program
#Built locally on a Chromebook

#User interface as a module, menu
module Menu
	def menu
		"Welcome to the Fabulous To-Do-Omizer!
		Please choose from the following options:
		1) Add
		2) Show your tasks
		3) Remove a task
		4) Update a task
		5) Write to a File
		6) Read from a File

		Q) I'm outta here"
	end

	#Following project instructions here, not sure why need a new show method
	def show
		menu
	end
end

#Create a module for user input
module Promptable
	def prompt(message='What would you like to do?',symbol=':> ')
		print message
		print symbol
		gets.chomp
	end
end


#Create a List class
class List
	attr_reader :all_tasks
	
	def initialize
		@all_tasks = []
	end

#Method to add a task to the list
	def add(task)
		@all_tasks << task
	end

#Method to show User all items in the list
	def show
		puts @all_tasks.map.with_index { |l, i| "(#{i.next}): #{l}"}
	end

#Method to remove a Task
	def delete(task_number)
		@all_tasks.delete_at(task_number-1)
	end

#Method to update a specific Task in the list
	def update(task_number, task)
		@all_tasks[task_number-1] = task
	end

#Method allowing user to write to a file
	def write_to_file(filename)
		IO.write(filename, @all_tasks.map(&:to_s).join("\n"))
	end	
#Method allowing user to read from a file
	def read_from_file(filename)
		IO.readlines(filename).each do |line|
			add(Task.new(line.chomp))
		end
	end
end

#Create a Task class
class Task
	attr_reader :description
	def initialize(description)
		@description = description
	end

	def to_s
		@description
	end
	
end


#Unclear to me why this line is necessary, but StackOverflow
#says the program is making sure that it's running the right thing...
if __FILE__ == $PROGRAM_NAME

	#Get those inclusions in
	include Menu
	include Promptable

	#Create a list (a new Instance of the List class)
	my_list = List.new

	#Notify user a list has been created
	puts 'Please choose from the following list'

	#page 7 step 9
	until ['q'].include?(user_input = prompt(show).downcase)
		case user_input
		when "1"
			my_list.add(Task.new(prompt('What is the task you would like to accomplish?')))
		when "2"
			my_list.show
		when "3"
			my_list.show
			my_list.delete(prompt('Which task is toast?').to_i)
		when "4"
			my_list.show
			my_list.update(prompt('Which task needs to change?').to_i, Task.new(prompt("What'll it be?")))
		when "5"
			my_list.write_to_file(prompt('What do you want to call the file?'))
		when "6"
			begin
			my_list.read_from_file(prompt('What file do you want to read from?'))
			rescue Errno::ENOENT
                  puts 'File name not found, please verify your file name 
                  and path.'
            end
		else
			puts "Sorry, I didn't quite catch that buddy"
		end
	end

	#Outtro
	puts "Thanks for using the List-o-mizer"

	#my_list.add(Task.new("Task the First"))
	#my_list.add(Task.new("Task the second!"))
	#my_list.add(Task.new("Task the TERCERO!"))

	#Notify user their task has been added to the List
	#puts 'Your task has been added to the List'

	#my_list.show

end