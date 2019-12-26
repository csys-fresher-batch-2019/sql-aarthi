create table tasks(task_no number,task_name varchar2(40) not null,name varchar2(25) not null,deadline date,completed_on date,status varchar2(10),constraint task_no-pk primary key(task_no));

insert into tasks(task_no,task_name,name,deadline,completed_on,status)values(1,'install oracle','aarthi',to_date('27-12-2019','dd-MM-yyyy'),to_date('26-12-2019','dd-MM-yyyy'),'yes');
insert into tasks(task_no,task_name,name,deadline,completed_on,status)values(2,'install jre','rithya',to_date('14-12-2019','dd-MM-yyyy'),to_date('16-12-2019','dd-MM-yyyy'),'no');                                                                                                                       

select * from tasks where status='yes';
