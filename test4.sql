create table student(
RN int primary key,
Name varchar(20),
age tinyint
) ;
create table test (
testid int primary key ,
name varchar(20)
);

create table studenttest (
RN int ,
testid int ,
Date datetime,
mark float,
FOREIGN KEY (testid) REFERENCES test(testid),
foreign key (rn) references student(rn)
);

alter table student 
add constraint check (age>=15 and age <=55);

alter table studenttest  
alter column mark set default 0 ;

alter table studenttest 
add constraint addPK primary key(rn,testid);

alter table test 
add unique (name);

ALTER TABLE test 
DROP INDEX name;

select * from studenttest;

insert into student values(1,'Nguyen Hong Ha',20),(2,'Truong Ngoc Anh',30),(3,'Tuan Minh',25),(4,'Dan Truong',22);

insert into test values(1,'EPC'),(2,'DWMX'),(3,'SQL1'),(4,'SQL2');

insert into studenttest values(1,1,'2006-07-17 00:00:00',8),
(1,2,'2006-07-18 00:00:00',5),
(1,3,'2006-07-19 00:00:00',7),
(2,1,'2006-07-17 00:00:00',7),
(2,2,'2006-07-18 00:00:00',4),
(2,3,'2006-07-19 00:00:00',2),
(3,1,'2006-07-17 00:00:00',10),
(3,3,'2006-07-18 00:00:00',1);

select rn,testid,date_format(date ,'%d-%m-%Y') as date,mark from studenttest;

select * from student where rn not in (select rn from studenttest group by rn) ;

select student.name,test.name,studenttest.mark,studenttest.Date
 from studenttest 
 join student on student.rn=studenttest.RN 
 join test on test.testid = studenttest.testid
 where mark <5;
 
 select st.name ,avg(mark)
 from studenttest stt 
 join student st on st.RN = stt.RN
 group by stt.RN
 order by avg(mark) desc;
 
  select st.name ,avg(mark)
 from studenttest stt 
 join student st on st.RN = stt.RN
 group by stt.RN
 order by avg(mark) desc 
 limit 1;
 
 select test.name ,max(mark)
 from studenttest stt 
 join test on test.testid = stt.testid
 group by stt.testid ;
 
 select st.name ,test .name  
 from student st
 left join studenttest stt on st.RN = stt.RN
 left join test on test.testid = stt.testid;
 
update student set age = age +1;

alter table student 
add column status varchar(10);
 
update student set status = case when Age < 30 then 'Young' else 'Old' end;

select st.Name,test.name,stt.mark,stt.Date
from studenttest stt 
join test on test.	testid = stt.testid
join student st on st.RN = stt.RN
order by date ;

select st.Name, avg(mark) 
from studenttest stt
join student st on st.RN = stt.RN
where st.Name like 't%'
group by st.RN 
having avg(mark)>4.5; 

select st.RN,st.name , avg(mark) as diemtrungbinh,rank () over (order by avg(mark)) xephang
from studenttest stt
join  student st on st.RN = stt.RN
group by stt.RN
order by avg(stt.mark);

alter table student 
modify name varchar(255);

update student set name = concat(case when age > 20 then 'old' else 'young' end ,' ',name);

select * from test where testid not in (select stt.testid 
from studenttest stt 
join test on test.testid = stt.testid 
group by stt.testid)
;

delete from studenttest where mark<5;

