-- a
select hereglegchNer, hereglegchId from hereglegch;

-- b
select avg(baraaNegjUne) as BaraaniiDundajUne from line inner join baraa on line.baraaId = baraa.baraaId where zahialgiinHuudasId = 120131;

-- c
select sum(dun) as NiitDun from line inner join zahialgiinHuudas on zahialgiinHuudas.zahialgiinHuudasId = line.zahialgiinHuudasId where line.zahialgiinHuudasId = 120131;

-- d
select count(*) from line inner join baraa on line.baraaId = baraa.baraaId where line.zahialgiinHuudasId = 120131 and baraa.baraaNegjUne > 100000;

-- e
select sum(dun) as niitDun, zahialgiinHuudas.zahialgiinHuudasId as zahialgaId from line inner join zahialgiinHuudas on zahialgiinHuudas.zahialgiinHuudasId = line.zahialgiinHuudasId group by zahialgiinHuudas.zahialgiinHuudasId;

-- f
select sum(hedenShirheg) as 'heden shirheg baraa', sum(dun) as 'Niit uniin dun', zahialgiinHuudas.zahialgiinHuudasId as 'zahialgiin huudas id' from zahialgiinHuudas inner join line on zahialgiinHuudas.zahialgiinHuudasId = line.zahialgiinHuudasId group by zahialgiinHuudas.zahialgiinHuudasId having sum(hedenShirheg) >= 5 and sum(dun) > 250000 

-- 3
select * from hereglegch where hereglegchId = 9321

-- 4
select * from hereglegch where hereglegchHayg like '%sukhbaatar%'

-- 5
select h.hereglegchId, sum(il.hedenShirheg) as 'Niit heden shirheg baraa'
from hereglegch h
join zahialgiinHuudas z on h.hereglegchId = z.hereglegchId
join line il on z.zahialgiinHuudasId = il.zahialgiinHuudasId
join baraa b on il.baraaId = b.baraaId
where h.hereglegchId = 9321
group by h.hereglegchId, h.hereglegchNer;

-- 6 
SELECT h.hereglegchId, COUNT(DISTINCT b.baraaId) as 'Niit heden torliin baraa'
FROM hereglegch h
JOIN zahialgiinHuudas z ON h.hereglegchId = z.hereglegchId
JOIN line li ON li.zahialgiinHuudasId = z.zahialgiinHuudasId
JOIN baraa b ON li.baraaId = b.baraaId
WHERE h.hereglegchId = 9321
GROUP BY h.hereglegchId;

-- 7
SELECT h.hereglegchId, sum(li.dun) as "Niit dun"
FROM hereglegch h
JOIN zahialgiinHuudas z ON h.hereglegchId = z.hereglegchId
JOIN line li ON li.zahialgiinHuudasId = z.zahialgiinHuudasId
JOIN baraa b ON li.baraaId = b.baraaId
WHERE h.hereglegchId = 9321
GROUP BY h.hereglegchId;

-- 8 
select h.hereglegchId, li.hedenShirheg, b.baraaNer, sum(li.hedenShirheg)
from hereglegch h
join zahialgiinHuudas z on h.hereglegchId = z.hereglegchId
join line li on li.zahialgiinHuudasId = z.zahialgiinHuudasId
join baraa b on b.baraaId = li.baraaId
where b.baraaId = 'H1020'
group by h.hereglegchId, li.hedenShirheg, b.baraaNer

-- 9
select top 1 b.baraaId, b.baraaNer, sum(li.hedenShirheg) as NiitHedenShirhegZaragdsan
from zahialgiinHuudas z
join line li on z.zahialgiinHuudasId = li.zahialgiinHuudasId
join baraa b on b.baraaId = li.baraaId
where z.onSarUdur >= '2018-03-01' and z.onSarUdur <= '2018-03-30'
group by b.baraaId, b.baraaNer
order by NiitHedenShirhegZaragdsan desc;
 
-- 10
select * 
from zahialgiinHuudas
order by zahialgiinHuudas.onSarUdur asc

-- 11
select top 1 b.baraaId, b.baraaNer, sum(li.hedenShirheg) as NiitHedenShirhegZaragdsan
from zahialgiinHuudas z
join line li on z.zahialgiinHuudasId = li.zahialgiinHuudasId
join baraa b on b.baraaId = li.baraaId
group by b.baraaId, b.baraaNer
order by NiitHedenShirhegZaragdsan desc;

-- 12
select top 3 b.baraaId, b.baraaNer, sum(li.hedenShirheg) as NiitHedenShirhegZaragdsan
from zahialgiinHuudas z
join line li on z.zahialgiinHuudasId = li.zahialgiinHuudasId
join baraa b on b.baraaId = li.baraaId
group by b.baraaId, b.baraaNer
order by NiitHedenShirhegZaragdsan asc;

-- 13
select z.zahialgiinHuudasId, sum(li.hedenShirheg) as 'Niit hudaldagdsan baraanii hemjee'
from zahialgiinHuudas z
join line li on z.zahialgiinHuudasId = li.zahialgiinHuudasId
group by z.zahialgiinHuudasId

-- 14
select h.hereglegchId, sum(li.hedenShirheg) as 'Niit hudaldan avsan baraanii too'
from hereglegch h
join zahialgiinHuudas z on h.hereglegchId = z.hereglegchId
join line li on li.zahialgiinHuudasId = z.zahialgiinHuudasId
group by h.hereglegchId

-- 15
select top 1 h.hereglegchId, count(z.zahialgiinHuudasId) as NiitZahialga
from hereglegch h
join zahialgiinHuudas z on z.hereglegchId = h.hereglegchId
group by h.hereglegchId
order by NiitZahialga DESC

