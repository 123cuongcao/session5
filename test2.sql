
create table Students(
	StudentId int(4) primary key ,
    StudentName varchar(50),
    Age int(4) ,
    Email varchar(100)
);

 create table Marks (
	 Mark int ,
	 SubjectID int  ,
	 StudentID int ,
     foreign key (SubjectID) references  subjects (SubjectID),
      foreign key (StudentID) references  students (StudentID)
 ) ;
 create table ClassStudent(
	StudentID int ,
    ClassID int,
    foreign key (ClassID) references  Classes (ClassID),
	foreign key (StudentID) references  students (StudentID)
 );
 
 create table Subjects(
	SubjectID int ,
    SubjectName int
 );
 create table Classes (
	ClassID int ,
    ClassName varchar(50)
 );
 
--  alter table students 
--  add constraint primary key(StudentId);
--  
--  alter table Marks
--  add constraint  foreign key (SubjectID) references subjects(subjectid);
--  
-- alter table Students 
-- add constraint test foreign key (StudentID) references students (studentid);
 

 
--    alter table Classes 
--  add constraint primary key(ClassID);
--   
--    alter table Subjects 
--  add constraint primary key(SubjectID);
--  
--     alter table ClassStudent 
--  add constraint primary key(StudentID,ClassID);
 
 
 
 insert into students values(1,'Nguyen Quang An',18,'an@yahoo.com'),
							(2,'Nguyen Cong Vinh',20,'vinh@gmail.com'),
							(3,'Nguyen Van Quyen',19,'quyen'),
							(4,'Pham Thanh Binh',25,'binh@com'),                           
							(5,'Nguyen Van Tai Em',30,'taiem@sport.vn');
                            
select * from students;

insert into classes values (1,'C0706L'),(2,'C0708G');
select * from classes;

insert into classstudent values (1,1),(2,1),(3,2),(4,2),(5,2);
select * from classstudent;

insert into subjects values (1,'SQL'),(2,'JAVA'),(3,'C'),(4,'Visual Basic');
select * from subjects;

insert into marks values(8,1,1),(4,2,1),(9,1,1),(7,1,1),(3,1,4),(5,2,5),(8,3,3),(1,3,5),(3,2,4);
select * from marks;

-- Hien thi danh sach tat ca cac hoc vien 
select * from students;

-- Hien thi danh sach tat ca cac mon hoc
select * from subjects;

-- Tinh diem trung binh 
select studentid,avg(mark) from marks group by studentid ;

-- Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat
select *from marks where mark = (select max(mark) from marks);

-- Danh so thu tu cua diem theo chieu giam
select distinct	rank () over (order by  mark) rank_no,mark  from marks ;

-- Thay doi kieu du lieu cua cot SubjectName trong bang Subjects thanh nvarchar(max)
alter table Subjects 
modify SubjectName varchar(255);

-- Cap nhat them dong chu « Day la mon hoc «  vao truoc cac ban ghi tren cot Subjects trong bang Subjects
update Subjects set Subjectname = concat('Day la mon hoc ',Subjectname);

-- Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
alter table Students 
add constraint check(Age >15 and Age < 50);

-- Loai bo tat ca quan he giua cac bang

 
 
 -- Xóa tất cả ràng buộc khóa ngoại trong cơ sở dữ liệu
SET FOREIGN_KEY_CHECKS = 0;
ALTER TABLE classstudent DROP FOREIGN KEY ClassID;
ALTER TABLE classstudent DROP FOREIGN KEY StudentID;
ALTER TABLE marks DROP FOREIGN KEY SubjectID;
ALTER TABLE marks DROP FOREIGN KEY StudentID;
SET FOREIGN_KEY_CHECKS = 1;

-- Xoa hoc vien co StudentID la 1

delete from students where StudentID = 1;
-- Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1
alter table students 
add Status bit ;

-- Cap nhap gia tri Status trong bang Student thanh 0

update students set Status = 0;
--  

