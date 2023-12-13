create table baraa (
    baraa_id nchar(5) primary key,
    baraa_ner nvarchar(50),
    negj_une FLOAT,
)

insert into baraa values 
('H0030', 'Mouse', 4000),
('H1010', 'Notebook-size personal computer', 250000),
('H1020', 'Desktop-size personal computer', 180000),
('H2010', 'Laser printer', 300000),
('S1010', 'Word processing software', 30000),
('S1040', 'Integrated software', 1000000),
('SP002', 'A-4 size paper', null),
('SP003', 'B-5 size paper', null)



create table od (
    odid int primary key,
    OrderSlipNumber int,
    qnt INT,
    baraa_id nchar(5),
)

insert into od values 
(1, 120131, 4, 'H1010'),
(2, 120131, 2, 'H2010'),
(3, 120131, 1, 'S1040'),
(4, 120131, 2, 'SP002'),
(5, 120131, 4, 'SP003'),
(6, 120131, 4, 'H0030'),
(7, 120131, 5, 'H1020'),
(8, 120131, 5, 'S1010'),
(9, 120132, 4, 'S1010'),
(10, 120132, 3, 'H1020')


-- 2.
-- a)
/*
create proc sp_baraa_1
as
select * from dbo.baraa
where negj_une > 150000 or negj_une is null
*/
-- b)
exec sp_baraa_1

-- c)
/*
alter proc sp_baraa_1
as
select * from dbo.baraa
where negj_une > 200000 or negj_une is null
*/

-- d)

/*
create table TempBaraa (
    baraa_id nchar(5),
    baraa_ner nvarchar(50),
    negj_une FLOAT
)
*/

-- insert into TempBaraa exec sp_baraa_1


-- 3.
/*
create proc zahialga1
as
select * from baraa join od on baraa.baraa_id = od.baraa_id
where od.qnt > 3 

*/
exec zahialga1

/*
alter proc zahialga1
as 
select baraa.baraa_id, baraa.baraa_ner, baraa.negj_une, od.OrderSlipNumber, od.qnt
from baraa join od on baraa.baraa_id = od.baraa_id 
where od.qnt > 3
*/

create table TempBaraa1 (
    baraa_id nchar(5),
    baraa_ner nvarchar(50),
    negj_une float,
    OrderSlipNumber int,
    qnt int
)


-- 4.
insert into TempBaraa1 exec zahialga1

-- 5.
/*
create proc dbo.sp_baraa_2
@negj_une float
as
if @negj_une is null
begin
raiserror ('Negj_une talbart NULL utga zuvshuuruhgui.',14,1)
return
end
select * from baraa where negj_une > @negj_une
*/

-- 6.
-- a)
exec sp_baraa_2 @negj_une = null
exec sp_baraa_2 null

-- b)
exec sp_baraa_2 @negj_une = 200000
exec sp_baraa_2 200000


-- 7.
/* 
create proc zahialga2
@qnt INT
as
if @qnt is null
begin
raiserror ('Qnt talbart NULL utga zuvshuuruhgui.',14,1)
return
end
select baraa.baraa_id, baraa.baraa_ner, baraa.negj_une, od.OrderSlipNumber, od.qnt
FROM baraa join od on baraa.baraa_id = od.baraa_id
where od.qnt < @qnt
*/



create table TempBaraa2 (
    baraa_id nchar(5),
    baraa_ner nvarchar(50),
    negj_une float,
    OrderSlipNumber int,
    qnt int
)

-- 8.
insert into TempBaraa2 exec zahialga2 @qnt = 4
select * from TempBaraa2

-- 9.
create proc dbo.sp_baraa_3
(@baraa_id nchar(1), @result float output)
as
begin
select @result = AVG(negj_une) from baraa
where baraa_id like @baraa_id + '%'
end


-- 10.
declare @result_total float
exec sp_baraa_3 @baraa_id = 'H', @result = @result_total output
select 'Dundaj une : ', @result_total

-- 11.
/*
create proc zahialga3
(@zahialga_id int, @result int output)
as 
BEGIN
select @result = COUNT(baraa_id)
from od where OrderSlipNumber = @zahialga_id
END
*/

declare @result_total float
exec zahialga3 @zahialga_id = 120131, @result = @result_total output
select 'Heden shirheg baraa: ', @result_total