#----------------------------------------------------------
# File: Task.rb
# Author: Joshua Burley
#
# Description: Task class file for the Do-It-Now 
#              console application.
#----------------------------------------------------------
class Task

  def initialize (new_id, new_name, new_desc, new_date_due, new_date_done, new_user_id)
    #Set the initial task values.
    @id        = new_id
    @name      = new_name
    @desc      = new_desc
    @date_due  = new_date_due
    @date_done = new_date_done
    @user_id   = new_user_id
  end
  
  #Set/Get for Task ID.  
  def id=(updated_id)
    @id = updated_id
  end
  def id
	  return @id
  end
  
  #Set/Get for Task name.
  def name=(updated_name)
    @name = updated_name
  end
  def name
    return @name
  end
  
  #Set/Get for Task description.
  def desc=(updated_desc)
    @desc = updated_desc
  end
  def desc
    return @desc
  end
  
  #Set/Get for Task due date.
  def date_due=(updated_date_due)
    @date_due = updated_date_due
  end
  def date_due
    return @date_due
  end
  
  #Set/Get for Task complete date.
  def date_done=(updated_date_done)
    @date_done = updated_date_done
  end
  def date_done
    return @date_done
  end
  
  #Set/Get for Task user id.
  def user_id=(updated_user_id)
    @user_id = updated_user_id
  end 
  def user_id 
    return @user_id
  end
  
end #End of "class Task" block.