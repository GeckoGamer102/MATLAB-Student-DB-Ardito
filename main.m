%Author Name: Tyler Ardito
%Email: ardito86@students.rowan.edu
%Course: MATLAB Programming - Fall 2024
%Assignment: Midterm Project
%Date: 11/12/2024

%this assignes the db to the StudentDB class. this means that all things =
%to db will have the same functions and methods that are in the StudentDB
%class.

db = StudentDB;

%db = db.initDB(10); makes the size of the database ten, this then makes it
%easier becuase we now know that not only does db = the StudentDB class,
%but now also has a size.

db = db.initDB(4);


db = db.createUser("1", "John", "20", 3.8, "Computer Science");
db = db.createUser("2", "Tyler", "22", 3.5, "Engineering");
db = db.createUser("3", "Thomas", "21", 3.9, "Mathematics");
db = db.createUser("4", "Billy", "18", 4.0, "Mathematics");

%below is the how we display all studnets added to the database. I
%commented it out because I was getting to jumbled up with the find student
%function

    %%db.showStudents();

%this is where we can search for each individual student by ID, if the ID
%matches, it will post the results of the student information. If the ID
%entered is not existing for any student, it will give an error message.

db.findStudent("2");


%this saves the database to a seperate .mat fil, which can be found on the
%left side under the other files.

db.saveDatabase('Student_database.mat');

%this loads the database that was previously saved.

load('Student_database.mat')





%This creates a histogram for the students' gpas. since the gpa's are
%listed in the code itself, there is no need to call for another way to
%find it, ex. input of the person running the code.

nbins = 4;
x=[3.8, 3.5, 3.9, 4.0];
histogram(x, nbins)



%this creates a bar chart for the average GPA by major. We have 2 students
%in mathematics, and one student each in comp sci, and engineering. We plug
%in the names of the majors, then also add the gpas, we calculate mean(gpa)
%for mathematics.

categories = {'Computer Science', 'Engineering', 'Matematics'};
values = [3.8, 3.5, mean(3.9, 4.0)];
bar(values);
set(gca, 'xticklabel', categories);
title('Average GPA by major');

%here, we add a studnet age char. This shows each student's age as well as
%name. once again, we don't ask the user for an input. so we can plug their
%ages directly into the main.m code.

%to make each different person colored for added visualization (5pts.) I
%searched on google for the simplest way to implement the colors for
%students
categories = {'John', 'Tyler', 'Thomas', 'Billy',};
values = [20, 22, 21, 18];
h = bar(values);
h.FaceColor = 'flat';
h.CData = [1 0 0;    
           0 1 0;    
           0 0 1;    
           1 1 0];   
set(gca, 'xticklabel', categories);
title('Student Age');