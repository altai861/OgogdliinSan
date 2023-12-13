
create table product (
    p_ID int primary key IDENTITY(1, 1),
    p_name nvarchar(50) not null,
    p_price float not null,
    qnt int not null
)

create table customer (
    cus_ID int primary key IDENTITY(50, 1),
    cus_name nvarchar(50) not null,
    cus_address nvarchar(50),
)

create table orders (
    order_ID int primary key IDENTITY(100, 1),
    order_date DATE not null,
    cus_ID int not null,

    foreign key (cus_ID) REFERENCES customer(cus_ID)
)

create table order_detail (
    order_ID int not null,
    p_ID int not null,
    qnt int not null,

    foreign key (order_ID) REFERENCES orders(order_ID),
    foreign key (p_ID) references product(p_ID),
    primary key (order_ID, p_ID)
)