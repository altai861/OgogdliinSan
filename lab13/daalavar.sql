-- 1.
begin TRY
    begin TRANSACTION;

    insert into order_detail values 
    (101, 1, 1);


    update product
    set qnt = qnt - 1
    where p_ID = 1;

    commit;
end TRY
begin CATCH

    ROLLBACK;
end catch;

-----------------

begin TRY
    begin TRANSACTION;

    insert into order_detail values 
    (101, 4, 1);


    update product
    set qnt = qnt - 1
    where p_ID = 4;

    commit;
end TRY
begin CATCH

    ROLLBACK;
end catch;

-------------------

begin TRY
    begin TRANSACTION;

    insert into order_detail values 
    (101, 5, 1);


    update product
    set qnt = qnt - 1
    where p_ID = 5;

    commit;
end TRY
begin CATCH

    ROLLBACK;
end catch;

--------------------------
begin TRY
    begin TRANSACTION;

    insert into order_detail values 
    (102, 5, 1);

    update product
    set qnt = qnt - 1
    where p_ID = 5;

    commit;
end TRY
begin CATCH

    ROLLBACK;
end catch;


-- 2.
begin TRY
    begin TRANSACTION;

    declare @updatedQuantity INT;
    select @updatedQuantity = qnt
    from order_detail
    where order_ID = 101 and p_ID = 1;

    update order_detail
    set qnt = 2
    where order_ID = 101 and p_ID = 1

    update product
    set qnt = qnt - (2 - @updatedQuantity)
    where p_ID = 1;

    commit;
end TRY
begin CATCH

    ROLLBACK;
end catch;

----------------------

begin TRY
    begin TRANSACTION;

    declare @updatedQuantity2 INT;
    select @updatedQuantity2 = qnt
    from order_detail
    where order_ID = 101 and p_ID = 5;

    update order_detail
    set qnt = 3
    where order_ID = 101 and p_ID = 5

    update product
    set qnt = qnt - (3 - @updatedQuantity2)
    where p_ID = 5;

    commit;
end TRY
begin CATCH

    ROLLBACK;
end catch;



-- 3.

begin TRY
    begin TRANSACTION;

    declare @deletedQuantity INT;
    select @deletedQuantity = qnt
    from order_detail
    where order_ID = 102 and p_ID = 5;

    delete from order_detail
    where order_ID = 102 and p_ID = 5;

    update product
    set qnt = qnt + @deletedQuantity
    where p_ID = 5;

    commit;
end TRY
begin CATCH

    ROLLBACK;
end catch;
