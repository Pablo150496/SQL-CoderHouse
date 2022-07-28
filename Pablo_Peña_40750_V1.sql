CREATE SCHEMA HR_SOFTWARE_V1 ;
USE HR_SOFTWARE_V1 ; 


CREATE TABLE if not exists Employee(
employee_id int not null, 
team_id int, 
office_id int not null, 
first_name varchar(50) not null,
last_name varchar(50) not null, 
team_name varchar(20), 
office_name varchar(20) not null, 
birth_date date not null, 
nationality varchar(20) not null, 
status varchar(20) not null, 
gender varchar(20) not null, 
manager_name varchar(20),
email varchar(30) not null, 
PRIMARY KEY (employee_id)
);


CREATE TABLE if not exists Team(
team_id int not null, 
employee_id int not null,
team_name varchar(20) not null,
team_leader varchar(20), 
PRIMARY KEY (team_id),
FOREIGN KEY (employee_id) REFERENCES Employee (employee_id)
);

CREATE TABLE if not exists Office(
office_id int not null,
employee_id int not null, 
location_name varchar(50) not null, 
office_name varchar(20) not null, 
PRIMARY KEY (office_id),
FOREIGN KEY (employee_id) REFERENCES Employee (employee_id)
);

CREATE TABLE if not exists Time_Tracking(
shift_id int not null, 
employee_id int not null, 
clock_in varchar(8), 
clock_out varchar(8), 
shift_date date, 
shift_duration varchar(10), 
shift_estimated varchar(10) not null, 
shift_balance varchar(10) not null, 
PRIMARY KEY (shift_id),
FOREIGN KEY (employee_id) REFERENCES Employee (employee_id)
);

CREATE TABLE if not exists Time_off(
leave_id int not null, 
employee_id int not null, 
leave_type_name varchar(20),
leave_status varchar(50), 
leave_duration varchar(10),
leave_start_on date,
leave_finish_on date, 
PRIMARY KEY (leave_id),
FOREIGN KEY (employee_id) REFERENCES Employee (employee_id)
);

ALTER TABLE Employee
ADD FOREIGN KEY (team_id) REFERENCES Team (team_id)
;

 ALTER TABLE Employee
ADD FOREIGN KEY (office_id) REFERENCES Office (office_id)
;


CREATE TABLE if not exists Tasks(
Task_id int not null, 
assignee_id int not null, 
task_completed_by int,
task_author int not null,
task_imported_for int not null, 
task_name varchar(20) not null, 
task_content varchar(200) not null,  
task_due_on date,
task_completed_at date, 
task_created_at date not null,
task_updated_at date,
PRIMARY KEY (Task_id),
FOREIGN KEY (assignee_id) REFERENCES Employee (employee_id),
FOREIGN KEY (task_author) REFERENCES Employee (employee_id),
FOREIGN KEY (task_completed_by) REFERENCES Employee (employee_id),
FOREIGN KEY (task_imported_for) REFERENCES Employee (employee_id)
);


CREATE TABLE if not exists Documents(
Document_id int not null,
employee_id int not null, 
leave_id int not null, 
doc_created_by int not null, 
filename varchar(20) not null,
doc_type varchar(20) not null, 
doc_created_at date not null, 
PRIMARY KEY (Document_id),
FOREIGN KEY (employee_id) REFERENCES Employee (employee_id),
FOREIGN KEY (doc_created_by) REFERENCES Employee (employee_id),
FOREIGN KEY (leave_id) REFERENCES Time_off (leave_id)
);
