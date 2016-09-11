#CodeCademy Final Project for Ruby, a To-Do List
#Also, less cool, but my first actual program
#Built locally on a Chromebook

#Create a List class
class List
	attr_reader :all_tasks
	
	def initialize
		@all_tasks = []
	end

#Method to add a task to the list
	def add(added_task)
		@all_tasks << added_task
	end

#Method to show User all items in the list
	def show
		all_tasks
		#all_tasks.each {|var| puts all_tasks[var].description}
		
	end



end

#Create a Task class
class Task
	attr_reader :description
	def initialize(description)
		@description = description
	end
	
end


#Unclear to me why this line is necessary, but StackOverflow
#says the program is making sure that it's running the right thing...
if __FILE__ == $PROGRAM_NAME

	#Create a list (a new Instance of the List class)
	my_list = List.new

	#Notify user a list has been created
	puts 'You have created a new list'

	my_list.add(Task.new("Task the First"))

	#Notify user their task has been added to the List
	puts 'Your task has been added to the List'
	puts "Your task is: #{my_list.all_tasks[0].to_s}"
	puts 'That task kind of sucks'

	#See if this works better
	puts my_list.show

end