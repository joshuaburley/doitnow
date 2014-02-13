#----------------------------------------------------------
# File: task_spec.rb
# Author: Joshua E. Burley
#
# Description: This file contains the "Task" class 
#              rspec tests.
#----------------------------------------------------------

#Mac/Linux Paths
require_relative '../lib/task'

describe Task do
	
  before (:all) do 
    @mytask = Task.new(nil, nil, nil, nil, nil, nil) #Setting defualt values.
  end
  
  it 'should contain a nil id value (until it gets added to a tasklist)' do
    expect(@mytask.id).to eq(nil)
    puts "Task ID: #{@mytask.id}"
  end
	
  it 'should contain a task name' do
    name = 'Shovel Snow'
    @mytask.name=(name)
    expect(@mytask.name).to eq(name)
    puts "Task Name: #{@mytask.name}"
  end
	
  it 'should contain a task description' do
    desc = 'Remove snow from driveway and sidewalk.'
    @mytask.desc=(desc)
    expect(@mytask.desc).to eq(desc)
    puts "Task Desc: #{@mytask.desc}"
  end
	
  it 'should contain a task due date' do
    date = '03/23/2014'
    @mytask.date_due=(date)
    expect(@mytask.date_due).to eq(date)
    puts "Task Date Due: #{@mytask.date_due}"
  end
	
  it 'should contain a tasks complete date' do
    date = '05/25/2015'
    @mytask.date_done=(date)
    expect(@mytask.date_done).to eq(date)
    puts "Task Date Done: #{@mytask.date_done}"
  end
	
  it 'should not contain a user id value' do
    id = nil
    @mytask.user_id=(id)
    expect(@mytask.user_id).to eq(id)
    puts "Task User ID: #{@mytask.user_id}"
  end
  
end #End of "describe Task do" block.