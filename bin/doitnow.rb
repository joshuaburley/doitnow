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

def is_user_input_valid(option, input_type, input_length, user_input)
  
  case input_type
    when 'text'
      if user_input.length > input_length 
 	print '%-60s' % "Text lgth too long (max lgth: #{input_length}, your lgth: #{user_input.length})! Re-try: " if option == 'add'
	print '%-73s' % "Text lgth too long (max lgth: #{input_length}, your lgth: #{user_input.length})! Re-try: " if option == 'update'
        is_user_input_valid(option, 'text', input_length, gets.chomp())
      #elsif
        #user_input.scan != only |a..z, A..Z, 0..9, ' '|
        #return false
      else
        return user_input 
      end
    when 'date'	   
      if user_input == ''
	return user_input #Allows null value!
      elsif user_input.length != input_length 
      	print '%-60s' % "Invalid date format (mm/dd/yyyy)! Re-try: " if option == 'add'
	print '%-73s' % "Invalid date format (mm/dd/yyyy)! Re-try: " if option == 'update'
        is_user_input_valid(option, 'date', input_length, gets.chomp())
      #elsif
         #user_input.scan != only |01..12, '/', 01..31, '/', 2014..n|
         #return false
      else
        return user_input 
      end 
    else
      #Code should never get here!!
      #Question: Can I remove this else statement or does the case syntax require it?
  end #End of "input_type" case block.
end

def menu_create_task
  puts ''
  puts 'Add new task information at each prompt, press Enter to leave the field blank.'
    
  print '%-60s' % 'Enter Task Name (30 char. numbers/letters/spaces only!): '
  new_name = is_user_input_valid('add', 'text', 30, gets.chomp())
  
  print '%-60s' % 'Enter Description (60 char. numbers/letters/spaces only!): '
  new_desc = is_user_input_valid('add', 'text', 60, gets.chomp())
  
  print '%-60s' % 'Enter Date Due (required format: mm/dd/yyyy): '
  new_date_due = is_user_input_valid('add', 'date', 10, gets.chomp())
  
  print '%-60s' % 'Enter Date Done (required format: mm/dd/yyyy): '
  new_date_done = is_user_input_valid('add', 'date', 10, gets.chomp())
  
  print '%-60s' % 'Enter User ID (8 char. numbers/letters/spaces only!): '
  new_user_id = is_user_input_valid('add', 'text', 8, gets.chomp())

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
      print "Invalid Task number (#{update_task_num}) (total tasks: #{@list.count}), please re-try: "
      is_update_menu_option_good('edit', gets.chomp())   if update_type == 'edit'
      is_update_menu_option_good('delete', gets.chomp()) if update_type == 'delete' 
    end
  end
end

def update_task(task_index)
  puts ''
  puts "Update the Task #{task_index+1} information at each prompt, press Enter to leave the field unchanged."
  print '%-73s' % 'Enter updated Task Name (30 char. numbers/letters/spaces only!): '
  name = is_user_input_valid('update', 'text', 30, gets.chomp())
  @list.tasks[task_index].name=(name) if name != '' #Shorter version of the Ternary operator.
  
  print '%-73s' % 'Enter updated Task Description (60 char. numbers/letters/spaces only!): '
  desc = is_user_input_valid('update', 'text', 60, gets.chomp())
  @list.tasks[task_index].desc=(desc) if desc != ''
      
  print '%-73s' % 'Enter updated Date Due (required format: mm/dd/yyyy): '
  date_due = is_user_input_valid('update', 'date', 10, gets.chomp())
  @list.tasks[task_index].date_due=(date_due) if date_due != ''
  
  print '%-73s' % 'Enter updated Date Done (required format: mm/dd/yyyy): '
  date_done = is_user_input_valid('update', 'date', 10, gets.chomp())
  @list.tasks[task_index].date_done=(date_done) if date_done != ''
      
  print '%-73s' % 'Enter updated User ID (8 char. numbers/letters/spaces only!): '
  user_id = is_user_input_valid('update', 'text', 8, gets.chomp())
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
