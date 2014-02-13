Do-It-Now Ruby Application (v1.0)

README

Welcome to the “Do-It-Now” (doitnow) Ruby software application. 

To run the program, copy the program’s source files to your system, navigate to the “/doitnow/bin” directory and execute “ruby doitnow.rb”.

.
├── LICENSE.txt
├── README.txt
├── bin
│   └── doitnow.rb
├── func
├── lib
│   ├── task.rb
│   └── tasklist.rb
└── spec
    ├── task_spec.rb
    └── tasklist_spec.rb

4 directories, 7 files


DESCRIPTION

The "Do-It-Now" program allows a public user to add tasks to a task list, display those tasks, and then update (edit/delete) them. 

The data in the task list is pre-populated with three tasks and the user can add any number of tasks to that list. Until a database (flat file or relational) has been added, all user entered data or changes made will be lost when the application terminates.

Limited testing has been completed to ensure a basic level functionality. For more information see the black/white box tests run below.

Further work will be done to complete the items listed in the following Future Goals section.


FUTURE GOALS

1. Implement full user input sanitization and boundaries (input field char. limits)
2. Add MySQL (or SQLite) database backend.
3. Add User create/login functionality.
4. Port program over to Ruby on Rails (RoR).
5. Host the RonR program on my public website.


WHITE/BLACK BOX TESTING

The following tests where run on the application to validate it for posting to GitHub.

1. RSpec Unit Test Cases (Automated)

./spec/tasklist_spec.rb:

* Tasklist class - add three (3) tasks to list
* Tasklist class - display all tasks in list
* Tasklist class - remove task from list
* Tasklist class - update all elements for a task in the list

./spec/task_spec.rb:

* Task class - checked that task "id" starts as nil when task is created
* Task class - checked that changing task "name" retains the changed value
* Task class - checked that changing task "desc" retains the changed value
* Task class - checked that changing task "date_due" retains the changed value
* Task class - checked that changing task "date_done" retains the changed value
* Task class - checked that changing task "user_id" retains the changed value

Results: 10 Total Automated Test Run/Passed

2. Functional Testcases (Manual)

Run "ruby doitnow.rb"

* select blank value (hit Enter with now value), error message displays with retry prompt
* select single invalid “space”, error message displays with retry prompt
* select single invalid numeric value, error message displays with retry prompt
* select single invalid alphanumeric value, error message displays with retry prompt
* select multiple characters, including valid/invalid numbers/letters/space, error message displays with retry prompt

- Test option letter A (add new task)

* select "a" ("A" also works)
* create task with all blank fields (hit Enter for each task field)
* create task with some blank fields
* create task with no blank fields
* create task with all fields of the same value
* create task with non-formatted date fields
* create task with field values of 80-100 characters each (text should wrap in the table)
* task list displays after each task has been added
* the menu option bar appears without terminating the program

- Test option letter B (display tasks)

* select "b" ("B" will also work!)
* all tasks appear in the list
* table formatting looks clean (columns properly aligned)
* the menu option bar appears without terminating the program

- Test option letter C (update task)

* select "c" ("C" also works)
* select an invalid "0" value, errors message displays with retry prompt
* select an invalid value +1 greater than the total number of tasks in the list, error message displays with retry prompt
* select an invalid alphanumeric value, error message displays with retry prompt
* select an invalid multi-character number, error message displays with retry prompt
* select an invalid blank (hit Enter) value, error message displays with retry prompt
* select an invalid "space" value, error message displays with retry prompt
* select "e" or "E", the menu option bar appears with no tasks deleted

* select a valid Task number
* update only the "name" field
* update only the "desc" field
* update only the "date_due" field
* update only the "date_done" field
* update only the "user_id" field
* update all fields
* update no fields (task values are unchanged)
* update all fields with 80-100 characters each (text should wrap in the table)
* task list displays after each task has been fully (all fields) updated

- Test option letter D (delete task)

* select "d" ("D" also works)
* select an invalid "0" value, errors message displays with retry prompt
* select an invalid value +1 greater than the total number of tasks in the list, error message displays with retry prompt
* select an invalid alphanumeric value, error message displays with retry prompt
* select an invalid multi-character number, error message displays with retry prompt
* select an invalid blank (hit Enter) value, error message displays with retry prompt
* select an invalid "space" value, error message displays with retry prompt
* select "e" or "E", the menu option bar appears with no tasks deleted

* select a valid Task number
* the task list displays with the correct task removed
* the Task numbers (1-n) adjust properly when removing task from the front/middle of the list
* the Task IDs are not reset, once the task is removed, that Task ID (index number) is gone
* delete task 1
* delete the last task
* after each task removal, the menu option bar appears without terminating the program

- Test option letter E (exit program)

* select "e" ("E" also works)
* the "doitnow" application terminates with a "Good Bye!" message

Results: 53 Total Manual Tests Run/Passed, 1 minor defect reported (see below!)


KNOWN ISSUES

1. DEFECT: Entering a alphanumeric value/values at the Option C/D prompts returns "0" as the Task number that the program thought was entered. The expected result should be to simply display in the Task number () field what the user entered. The current functionality only handles number values the user enters when trying to select the correct Task Number for Options C/D.


----------------------------------------------------
Copyright (c) 2014 Joshua Burley
2/12/2014

