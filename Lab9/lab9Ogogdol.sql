/* Executed
insert into hereglegch (hereglegchId, hereglegchNer, hereglegchHayg) values 
(9321, 'Office Ginza Co.LTD', '1-2-3 Ginza, Chou-ku'),
(9322, 'ICT group', 'Sukhbaatar duureg, naturiin zamiin, pizza hut'),
(9323, 'Premier Sport', 'Sukhbaatar duureg, naturiin zamiin pizza hut')

insert into baraa (baraaId, baraaNer,baraaNegjUne) values 
('H1010', 'Notebook-size personal computer', 250000),
('H2010', 'Laser printer', 300000),
('S1040', 'Integrated software', 100000),
('SP002', 'A-4 size paper', 3000),
('SP003', 'B-5 size paper', 2500),
('H0030', 'Mouse', 4000),
('H1020', 'Desktop personal computer', 180000),
('S1010', 'Word processing software', 30000)

insert into zahialgiinHuudas (zahialgiinHuudasId, hereglegchId, niitDun, onSarUdur) values 
(120131, 9321, 2782000, '2018-03-28'),
(120132, 9322, null, '2023-11-05'),
(120133, 9323, null, '2023-11-04')

insert into line (zahialgiinHuudasId, lineNumber, baraaId, hedenShirheg, dun) values 
(120131, 1, 'H1010', 4, 1000000),
(120131, 2, 'H2010', 2, 600000),
(120131, 3, 'S1040', 1, 100000),
(120131, 4, 'SP002', 2, 6000),
(120131, 5, 'SP003', 4, 10000),
(120131, 6, 'H0030', 4, 16000),
(120131, 7, 'H1020', 5, 900000),
(120131, 8, 'S1010', 5, 150000)


insert into line (zahialgiinHuudasId, lineNumber, baraaId, hedenShirheg, dun) values 
(120132, 1, 'S1010', 2, 60000),
(120132, 2, 'S1040', 1, 100000),
(120132, 3, 'SP003', 1, 2500),
(120132, 4, 'H0030', 2, 8000),
(120132, 5, 'H1020', 3, 540000)

*/

