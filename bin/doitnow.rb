#----------------------------------------------------------
# File: doitnow.rb
# Author: Joshua Burley
#
# Description: Main program file for the Do-It-Now 
#              console application.
#----------------------------------------------------------

#Linux/Mac Paths
require_relative '../lib/task'
require_relative '../lib/tasklist'

#Program variables

@list = Tasklist.new

#Populate list with some test data (remove this when we start using an active database)
task1 = Task.new(nil, 'Devotional study.', 'Get more for my reading and thinking.', '03/01/2014', nil, nil)
task2 = Task.new(nil, 'Clear and wipe table.', 'Do this after each meal.', '02/03/2014', nil, nil)
task3 = Task.new(nil, 'Complete school work.', 'Complete writing, math, reading assignments.', '02/03/2014', nil, nil)

@list.add_task(task1)
@list.add_task(task2)
@list.add_task(task3)

#Display Menu
def menu_main
  puts ''
  puts 'Do-It-Now - Software App (v1.0)'
  puts 'Menu: Select letter and press Enter: (A) Create task, (B) Display tasks, (C) Update task, (D) Delete task, (E) Exit'
  print ': '
end

def menu_create_task
  puts ''
  puts 'Add new task information at each prompt, press Enter to leave the field blank.'
  print '%-31s' % 'Enter Task Name: '
  new_name = gets.chomp()
  print '%-31s' % 'Enter Task Description: '
  new_desc = gets.chomp()
  print '%-31s' % 'Enter Date Due (mm/dd/yyyy): '
  new_date_due = gets.chomp()
  print '%-31s' % 'Enter Date Done (mm/dd/yyyy): '
  new_date_done = gets.chomp()
  print '%-31s' % 'Enter User ID: '
  new_user_id = gets.chomp()

  new_task = Task.new(nil, new_name, new_desc, new_date_due, new_date_done, new_user_id)
  
  @list.add_task(new_task)
  
  menu_display_tasks
end

def menu_display_tasks
  @list.display_tasks
  program_start
end

def menu_update_task(update_type, show_tasks)
  puts ''
  puts "Select the Task number (e.g. 1, 2) that you want to #{update_type} and press Enter (or type E to Exit to Menu.)"
  @list.display_tasks if show_tasks == true
  print ': '
end

def is_update_menu_option_good(update_type, update_task_num)
  if update_task_num.downcase == 'e'
    program_start
  else
    task_num_as_int = update_task_num.to_i
    if task_num_as_int > 0 and task_num_as_int <= @list.count 
        update_task(task_num_as_int-1) if update_type == 'edit'
        delete_task(task_num_as_int)   if update_type == 'delete'
    else
      print "Invalid Task number (#{task_num_as_int}) (total tasks: #{@list.count}), please re-try: "
      is_update_menu_option_good('edit', gets.chomp())   if update_type == 'edit'
      is_update_menu_option_good('delete', gets.chomp()) if update_type == 'delete' 
    end
  end
end

def update_task(task_index)
  puts ''
  puts "Update the Task #{task_index+1} information at each prompt, press Enter to leave the field unchanged."
  print '%-38s' % 'Enter updated Task Name: '
  name = gets.chomp()
  @list.tasks[task_index].name=(name) if name != '' #Shorter version of the Ternary operator.
  
  print '%-38s' % 'Enter updated Task Description: '
  desc = gets.chomp()
  @list.tasks[task_index].desc=(desc) if desc != ''
      
  print '%-38s' % 'Enter updated Date Due (mm/dd/yyyy): '
  date_due = gets.chomp()
  @list.tasks[task_index].date_due=(date_due) if date_due != ''
  
  print '%-38s' % 'Enter updated Date Done(mm/dd/yyyy): '
  date_done = gets.chomp()
  @list.tasks[task_index].date_done=(date_done) if date_done != ''
      
  print '%-38s' % 'Enter updated User ID: '
  user_id = gets.chomp()
  @list.tasks[task_index].user_id=(user_id) if user_id != ''
    
  menu_display_tasks
end

def delete_task(task_num)
  @list.delete_task(task_num)
    
  menu_display_tasks
end

def is_main_menu_option_good(option)
  option.downcase!      #Permanently change value to lower case.
  
  case option
    when 'a'
      menu_create_task
    when 'b'
      menu_display_tasks
    when 'c'
      menu_update_task('edit', true) #true allows header msg to display
      is_update_menu_option_good('edit', gets.chomp())
    when 'd'
      menu_update_task('delete', true)
      is_update_menu_option_good('delete', gets.chomp())
    when 'e'
      puts 'Good Bye!'
    else
      print "Invalid option, please re-select option: "
      is_main_menu_option_good(gets.chomp())
    end
end

def program_start
  menu_main
  is_main_menu_option_good(gets.chomp())
end

#main program
#-------------------------------------------------------------

program_start #Runs program!
