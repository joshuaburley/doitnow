#----------------------------------------------------------
# File: tasklist_spec.rb
# Author: Joshua Burley
#
# Description: This file contains the "Tasklist" class 
#              rspec tests.
#----------------------------------------------------------

#Linux/Mac Paths
require_relative '../lib/task'
require_relative '../lib/tasklist'

describe Tasklist do

  before (:all) do
    # Create a new tasks to be used in each rspec test below!
	  @mylist = Tasklist.new
	  @mytask1 = Task.new(nil, 'Personal study.', 'Get more for my reading and thinking.', '03/01/2014', nil, nil)
	  @mytask2 = Task.new(nil, 'Clear and wipe table.', 'Do this after each meal.', '02/03/2014', nil, nil)
  	@mytask3 = Task.new(nil, 'Complete school work.', 'Complete writing, math, reading assignments.', '02/03/2014', nil, nil)

    #Get a base count before running tests!
	  @base_count = @mylist.count 
  end
  
  it 'should be able to add any number of individual tasks to the list' do 
    @mylist.add_task(@mytask1)
    expect(@mylist.count).to eq(@base_count + 1)
    
    @mylist.add_task(@mytask2)
    expect(@mylist.count).to eq(@base_count + 2)
    
    @mylist.add_task(@mytask3)
    expect(@mylist.count).to eq(@base_count + 3)  
  end
  
  it 'should be able to display all tasks in the list' do 
    num_tasks_displayed = @mylist.display_tasks      #returns the number of tasks that were displayed
	  expect(num_tasks_displayed).to eq(@mylist.count) #compares if current count in tasklist is the same
  end
	
  it 'should allow individual tasks to be removed from the list' do
    task_num = 3
  	current_num_of_tasks = @mylist.count
    
    @mylist.delete_task(task_num)
    expect(@mylist.count).to eq(current_num_of_tasks - 1)
    
	  #Debug msg
	  @mylist.display_tasks
  end

  it 'should allow task to be (updated)' do
    array_id      = 1
    old_name      = @mylist.tasks[array_id].name
	  old_desc      = @mylist.tasks[array_id].desc
	  old_date_due  = @mylist.tasks[array_id].date_due
	  old_date_done = @mylist.tasks[array_id].date_done
    old_user_id   = @mylist.tasks[array_id].user_id
    
    puts ''
    puts "Updating Task #{array_id+1}: \"#{old_name}\"...!"
    
    @mylist.tasks[array_id].name=('Clear dishes and wash table.')
    @mylist.tasks[array_id].desc=('Do after meals and wipe three times.')
    @mylist.tasks[array_id].date_due=('04/04/2014')
    @mylist.tasks[array_id].date_done=('04/05/2015')
    @mylist.tasks[array_id].user_id=(193)
    
    expect(@mylist.tasks[array_id].name).not_to eq(old_name)
    expect(@mylist.tasks[array_id].desc).not_to eq(old_desc)
    expect(@mylist.tasks[array_id].date_due).not_to eq(old_date_due)
    expect(@mylist.tasks[array_id].date_done).not_to eq(old_date_done)
    expect(@mylist.tasks[array_id].user_id).not_to eq(old_user_id)
    
	  #Debug msg
	  @mylist.display_tasks
  end
	
end #End of "describe Tasklist do" block.