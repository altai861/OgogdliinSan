create table customers (
    cus_code int primary key,
    cus_fname nvarchar(50),
    cus_initial char(1),
    cus_areacode int,
    cus_phone nvarchar(10),
    cus_balance float,
)

create table invoice (
    inv_number int primary key,
    cus_code int not null,
    inv_date date,

    foreign key (cus_code) references customers(cus_code)
)

create table vendor (
    v_code int primary key,
    v_name nvarchar(50),
    v_contact nvarchar(50),
    v_areacode int,
    v_phone nvarchar(10),
    v_state char(2),
    v_order char(1),
)

create table product (
    p_code nvarchar(20) primary key,
    p_descript nvarchar(100),
    p_indate date,
    p_ooh int,
    p_mn int,
    p_price float,
    p_discount float,
    v_code int,
    foreign key (v_code) REFERENCES vendor(v_code)
)

create table line (
    inv_number int not null,
    line_number int not null,
    p_code nvarchar(20) not null,
    line_units int,
    line_price float,

    primary key (inv_number, line_number),
    foreign key (p_code) REFERENCES product(p_code)
)



