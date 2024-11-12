% Author Name: Tyler Ardito
% Email: ardito86@students.rowan.edu
% Course: MATLAB Programming - Fall 2024
% Assignment: Midterm Project
% Date: 11/12/2024


%Class def creates the "class" of students, meaning what is required for
%each student

classdef Student
    %these are each individual properties for students, each has to be a
    %string

    properties
        student_id = ""
        student_name = ""
        student_age = ""
        student_gpa = 0.0
        student_major = ""
    end

     %methods are all of the functions that are active when each student
        %is "called"

    methods
       
        %this means that currentObj, means that for whatever student is
        %called, it is automatically assigned their specific identity
        %ex. current Obj for student 2 might have an ID of 3

        function currentObj = Student(student_id, student_name, student_age, student_gpa, student_major)
            if nargin > 0
                currentObj.student_id = student_id;
                currentObj.student_name = student_name;
                currentObj.student_age = student_age;
                currentObj.student_gpa = double(student_gpa);
                currentObj.student_major = student_major;
            end
            
        end

        %this will read out the student Info for each individual student
        %added, can be very overwhelming if on top of a lot of other
        %functions or searches.

        function show_student_info = displayinfo(currentObj)
            fprintf('Student ID: %s \n', currentObj.student_id);
            fprintf('Student Name: %s \n', currentObj.student_name);
            fprintf('Student Age: %s \n', currentObj.student_age);
            fprintf('Student GPA: %.2f \n', currentObj.student_gpa);
            fprintf('Student Major: %s \n', currentObj.student_major);
            show_student_info = 1;
        end

%this is how we can update the gpa of the student, it can't be above a 4.0
%because well, that's not how college works.

        function currentObj = update_gpa(currentObj, new_gpa)
              if new_gpa >= 0 && new_gpa <= 4.0
        currentObj.student_gpa = new_gpa;
        fprintf('GPA updated to %.2f \n', currentObj.student_gpa);
              else
        error('Invalid GPA. It must be between 0.0 and 4.0.');
              end
        end

        %the search_by_id is how we can plug into the main.m if we want to
        %search the database for a student with student_id of x. where x =
        %input

        function student_obj = search_by_id(all_students, search_id)
            
            student_obj = [];
            for i = 1:length(all_students)
                if strcmp(all_students(i).student_id, search_id)
                    student_obj = all_students(i);  % Found the student
                    return;
                end
            end
            % If no student found
            fprintf('No student found with ID: %s\n', search_id);
        end
    end
end