Do-It-Now Ruby Application (v1.1)

README

Welcome to the “Do-It-Now” (doitnow) Ruby software application. 

To run the program, copy the program’s source files to your system, navigate to the “/doitnow/bin” directory and execute “ruby doitnow.rb”.

.
├── LICENSE.txt
├── README.txt
├── TESTING.txt
├── bin
│   └── doitnow.rb
├── func
├── lib
│   ├── task.rb
│   └── tasklist.rb
└── spec
    ├── task_spec.rb
    └── tasklist_spec.rb

4 directories, 8 files


DESCRIPTION

The "Do-It-Now" program allows a public user to add tasks to a task list, display those tasks, and then update (edit/delete) them. 

The data in the task list is pre-populated with three tasks and the user can add any number of tasks to that list. Until a database (flat file or relational) has been added, all user entered data or changes made will be lost when the application terminates.

Limited testing has been completed to ensure a basic level functionality. For more information see the black/white box tests run below.

Further work will be done to complete the items listed in the following Future Goals section.


FUTURE GOALS

1. Done/Updated --> Implement user input boundary limits.
2. Add User create/login functionality.
3. Add MySQL (or SQLite) database backend.
4. Port program over to Ruby on Rails (RoR).
5. New --> Implement user input sanitization (add SQL security measures.)
6. New --> Add Puppet Open Souce network software to website.
7. Host the RonR program on my public website.


WHITE/BLACK BOX TESTING

See the TESTING.txt file in the root project directory.


KNOWN ISSUES

20140218.1. DEFECT: If all task entries are removed from the list, removing/updating tasks from the list displays the list "and" asks the user to select a task number. Instead, the program should simply display an empyty table and then return the user "back" to the main menu. 


FIXED ISSUES

20140212.1. 
DEFECT: Entering a alphanumeric value/values at the Option C/D prompts returns "0" as the Task number that the program thought was entered. The expected result should be to simply display in the Task number () field what the user entered. The current functionality only handles number values the user enters when trying to select the correct Task Number for Options C/D. 
FIXED: Returned the string value that the user entered, not the "converted to int" value used in the method.
VERIFIED: 2014-02-18


----------------------------------------------------
Copyright (c) 2014 Joshua Burley

