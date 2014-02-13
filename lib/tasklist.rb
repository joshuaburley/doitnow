#----------------------------------------------------------
# File: Tasklist.rb
# Author: Joshua EBurley
#
# Description: Tasklist class file for the Do-It-Now 
#              console application.
#----------------------------------------------------------
class Tasklist
	
  def initialize
    @tasks = Array.new
    @auto_id = 0
  end
	
  #Get method for @tasks array class variable
  def tasks
    return @tasks
  end
  
  def add_task(new_task_object)
    new_task_object.id=(@auto_id)  #Add unique task id value.
    @tasks << new_task_object  #Adds new task object item to list array.
    
    #Sets up the id for the next task to be added.
    @auto_id += 1;
  end

  def display_tasks
    i = 0
    puts ''
    puts "%-12s %2s %-30s %-60s %-12s %-12s %-2s" % ['Task #  (ID)', '', 'Task', 'Description', 'Date Due', 'Date Done', 'User ID']
    puts '----------------------------------------------------------------------------------------------------------------------------------------------'
    for i in 0...@tasks.count
      #Double quotes used due to stirng interpolation.
      puts "Task %2s (%2s) %2s %-30s %-60s %-12s %-12s %-2s" % [i+1, @tasks[i].id, '', @tasks[i].name, @tasks[i].desc, @tasks[i].date_due, @tasks[i].date_done, @tasks[i].user_id]
    end
    puts '----------------------------------------------------------------------------------------------------------------------------------------------'
    
    return i+1 #Allows test to be run to determine if count of i (+1 to adust for the array staring at 0) matches the tasklist.count number.
  end

  def delete_task(task_num) 
    array_id = task_num-1
    puts ''
    puts "Deleting Task #{task_num}: \"#{@tasks[array_id].name}\"...!" 
    @tasks.delete_at(array_id) # minus 1 so that the user's list number to delete matches the array index that is base 0)
  end
  
  def count
    return @tasks.count
  end
  
end #End of "class Tasklist" block.