CREATE TABLE [dbo].[Салбарууд]
(
  [Id] INT NOT NULL PRIMARY KEY,
  нэр NVARCHAR(50)
)

insert into Салбарууд
values (3, N'Өргөө 1')
insert into Салбарууд
values (4, N'Өргөө 5')
insert into Салбарууд
values (5, N'Өргөө 4')
insert into Салбарууд
values (6, N'Өргөө 3')
insert into Салбарууд
values (7, N'Өргөө 2')


select * from Салбарууд where Id=6;

