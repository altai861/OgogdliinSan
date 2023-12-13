create table hereglegch (
    hereglegchId int primary key,
    ner nvarchar(50) not null,
    hayg nvarchar(50) not null,
)

create table zahialgiin_huudas (
    zahialgaId int primary key,
    hereglegchId int not null,
    niitDun float,
    ognoo DATE,

    foreign key (hereglegchId) REFERENCES hereglegch(hereglegchId)
)

create table baraa (
    baraaId nvarchar(10) primary key,
    baraaNer nvarchar(50) not null,
    negjUne float not null,
)

create table zahialgiinShirheg (
    id int primary key IDENTITY(1, 1),
    baraaId int not null,
    hemjee int default 1,
    dun float,

    foreign key (baraaId) REFERENCES baraa(baraaId)
)