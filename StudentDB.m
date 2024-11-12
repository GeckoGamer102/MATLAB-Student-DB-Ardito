%Author Name: Tyler Ardito
%Email: ardito86@students.rowan.edu
%Course: MATLAB Programming - Fall 2024
%Assignment: Midterm Project
%Date: 11/12/2024

    %this is the student database
classdef StudentDB
    %this means everytime we run the StudentDB class, these properties
    %always run.
    properties
        size = 20
        studentList = []
        number_of_users = 0
    end

    methods
    %this is how we add students. If there are too many students, it will
    %reject it and give you a message. "the database is full)

        function currentObj = addStudent(currentObj, student)
            if currentObj.number_of_users < currentObj.size
                currentObj.number_of_users = currentObj.number_of_users + 1;
                currentObj.studentList(currentObj.number_of_users) = student;
            else
                fprintf("The database is full \n");
            end
        end
%Here is where we plug in the size of the database/how many max students
%can be added.
        function currentObj = initDB(currentObj, size)
            currentObj.size = size;
            currentObj.studentList = repmat(Student, 1, currentObj.size);
            
        end         

%this is how a user will be created and added to the database.

        function currentObj = createUser(currentObj, student_id, student_name, student_age, student_gpa, student_major)
            if currentObj.number_of_users < currentObj.size
                newStudent = Student(student_id, student_name, student_age, student_gpa, student_major);
                currentObj = currentObj.addStudent(newStudent);
            else
                fprintf("The database is full \n");
            end
        end

            %this will diplay the studnet information. It will show their
            %name, id, gpa, major, and age.

        function showStudents(currentObj)
            if currentObj.number_of_users == 0
                fprintf('No students to display.\n');
                return;
            end
            for i = 1: currentObj.number_of_users
                fprintf("#########----Student %d----########## \n", i)
                currentObj.studentList(i).displayinfo();
            end
        end
%this is how we search for students with thir ID. If you type an id into
%this function, it will list below all of that student's info.
        function res = findStudent(currentObj, student_id)
            res = 0;
            for i = 1:currentObj.number_of_users
               if strcmp(currentObj.studentList(i).student_id, student_id)
                   currentObj.studentList(i).displayinfo();
                   res = 1;
                   break;
               end
            end
            if res == 0
                fprintf("!!!!!!!!!!!Student Not Found!!!!!!!!!!!!!\n")
            end
        end
    %this saves the database to a seperate file, which you can open on its
    %own.
        function saveDatabase (currentObj, filename)
            save(filename, 'currentObj');
        end 
    end
end