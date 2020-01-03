# My swiggy hotel

*http://swiggy.com

## Features
* User should able to view all the tables.
* calculate the total amount of the particular user.
* update the status those who are order/cancel the order. 

### feature 1:display the foodstuff_items table.
```sql
    create table foodstuff_items(item_id number,
    item_name varchar2(50) not null,
    categories varchar2(60) not null,
    price number not null,
    constraint item_id_pk2 primary key(item_id),
    constraint item_name_uq2 unique(item_name),
    constraint categories_cq2 check(categories in('V','NV','O')),
    constraint price_cq2 check(price>=0));
 ```


```sql
   insert into foodstuff_items(item_id,item_name,categories,price)values(11,'Chicken Briyani','NV',300);
   insert into foodstuff_items(item_id,item_name,categories,price)values(12,'MilkShake','O',150);
   insert into foodstuff_items(item_id,item_name,categories,price)values(13,'Veg Burger','V',50);
   insert into foodstuff_items(item_id,item_name,categories,price)values(14,'Laddu','O',100);
   insert into foodstuff_items(item_id,item_name,categories,price)values(15,'Biscuit','O',80);
   insert into foodstuff_items(item_id,item_name,categories,price)values(16,'Badam Halwa','O',200);
 ```

  ```sql
    select * from foodstuff_items;
  ```
  
   
| item_id | menu_id | item_name       | categories | price |
|---------|---------|-----------------|------------|-------|
| 11      | 1       | Chicken Briyani | NV         | 300   |
| 12      | 2       | MilkShake       | O          | 150   |
| 13      | 3       | Laddu           | O          | 100   |

### display the menus table.
```sql
   create table menus(menu_id number,
   category varchar2(30) not null,
   constraint menu_id_pk primary key(menu_id),
   constraint category_cq check(category in('food','snakes & shakes','desserts')));
```

```sql
   insert into menus(menu_id,category)values(1,'food');
   insert into menus(menu_id,category)values(2,'snakes and shakes');
   insert into menus(menu_id,category)values(3,'desserts');
```
```sql
   select * from menus;
   
```
| menu_id | category          |
|---------|-------------------|
| 1       | food              |
| 2       | snakes and shakes |
| 3       | desserts          |


### display the users table.

```sql
     create table users(user_id number,
     user_name varchar2(50) not null,
     phone_no number(10) not null,
     address varchar2(50) not null,
     city varchar2(50) not null,
     constraint user_id_pk1 primary key(user_id),
     constraint phone_no_ck check(length(to_char(phone_no))=10));
     create sequence user_id start with 21 increment by 1;
```
   
```sql
insert into users(user_id,user_name,phone_no,address,city)values(user_id_seq.nextval,'Aarthi',9735647570,'no.29,north            street,mambakam','Chennai');

insert into users(user_id,user_name,phone_no,address,city)values(user_id_seq.nextval,'Sanaya',9834554345,'no.34,kamarajar colony,town','Tirunelveli');

insert into users(user_id,user_name,phone_no,address,city)values(user_id_seq.nextval,'Revathi',9934554682,'no.15,OMR    road,kelambakam','kachipuram');

insert into users(user_id,user_name,phone_no,address,city)values(user_id_seq.nextval,'Meenakshi',9756477451,'no.2,renugambal nagar,puthukottai','Tuticorin');

insert into users(user_id,user_name,phone_no,address,city)values(user_id_seq.nextval,'Rithya',9846767390,'no.6,west mambalam,avadi','chennai');

select * from users;
```
 
| user_id | user_name | phone_no   | address                     | city        |
|---------|-----------|------------|-----------------------------|-------------|
| 21      | aarthi    | 9735647570 | no.29,north street,mambakam | Chennai     |
| 22      | sanaya    | 9834554345 | no.34,kamarajar colony,town | Tirunelveli |
| 23      | revathi   | 9934554682 | no.15,OMR road,kelambakam   | kachipuram  |

   ### display the ordering table.

```sql
   create table ordering(order_id number,
   user_id number not null ,
   ordered_date timestamp ,
   delivered_date timestamp,
   tot_amt number,
   sta_tus varchar2(50) default 'ordered',
   comments varchar2(50),
   constraint order_id_pk1 primary key(order_id),
   constraint user_id_fk1 foreign key(user_id) references users(user_id));
   
 ```
  
 ```sql
insert into ordering(order_id,user_id)values(31,21);
insert into ordering(order_id,user_id)values(32,22);
insert into ordering(order_id,user_id)values(33,23);
insert into ordering(order_id,user_id)values(34,24);
insert into ordering(order_id,user_id)values(35,25);
```

```sql
  select * from ordering;
```
| order_id | user_id | ordered_date                   | delivered_date                 | tot_amt | sta_tus   | comments               |
|----------|---------|--------------------------------|--------------------------------|---------|-----------|------------------------|
| 31       | 21      | 02-01-20 10:18:56.469000000 PM | 02-01-20 11:31:18.160000000 PM | 2800    | delivered | successfully delivered |
| 32       | 22      | 02-01-20 10:18:56.469000000 PM | 02-01-20 11:31:18.160000000 PM | 450     | delivered | successfully delivered |
| 33       | 23      | 02-01-20 10:18:56.469000000 PM | 02-01-20 11:31:18.160000000 PM | 250     | delivered | successfully delivered |

 ###  display the order_item table.
 ```sql
    create table order_item(order_item_id number,
    order_id number not null,
    item_id number not null,
    quantity number not null,
    total_amounts number not null,
    status varchar2(50) default 'ordered',
    order_date timestamp,
    constraint order_item_id_pk primary key(order_item_id),
    constraint order_id_fk1 foreign key(order_id)references ordering(order_id),
    constraint item_id_fk2 foreign key(item_id)references foodstuff_items(item_id),
    constraint quantity_ck1 check(quantity>0),
    constraint new_uq unique(order_id,item_id),
    constraint total_amounts_ck1 check(total_amounts>0));
 ```
   
 ```sql
   insert into order_item(order_item_id,order_id,item_id,quantity,total_amounts)values(41,31,11,4,1200);
   insert into order_item(order_item_id,order_id,item_id,quantity,total_amounts)values(42,32,12,3,450);
   insert into order_item(order_item_id,order_id,item_id,quantity,total_amounts)values(43,33,13,5,250);
   insert into order_item(order_item_id,order_id,item_id,quantity,total_amounts)values(44,34,14,6,600);
   insert into order_item(order_item_id,order_id,item_id,quantity,total_amounts)values(45,35,15,7,560);
   insert into order_item(order_item_id,order_id,item_id,quantity,total_amounts)values(46,31,12,4,800);
   insert into order_item(order_item_id,order_id,item_id,quantity,total_amounts)values(47,31,16,3,800);
```

 
```sql
   select * from order_item;
```
| order_item_id | order_id | item_id | quantity | total_amounts | status  | order_date                     |
|---------------|----------|---------|----------|---------------|---------|--------------------------------|
| 41            | 31       | 11      | 4        | 1200          | ordered | 02-01-20 10:19:47.313000000 PM |
| 42            | 32       | 12      | 3        | 450           | ordered | 02-01-20 10:19:47.313000000 PM |
| 43            | 33       | 13      | 5        | 250           | ordered | 02-01-20 10:19:47.313000000 PM |
 
 ### feature 2:Add the menu_id in foodstuff_items table.
 ```sql
      alter table foodstuff_items add(menu_id number,constraint menu_id_fk2 foreign key(menu_id)references menus(menu_id));
 ```
 
| item_id | menu_id | item_name       | categories | price |
|---------|---------|-----------------|------------|-------|
| 11      |  NULL   | Chicken Briyani | NV         | 300   |
| 12      |  NULL   | MilkShake       | O          | 150   |
| 13      |  NULL   | Laddu           | O          | 100   |

### feature 3:update the menu_id in foodstuff_items table.
``` sql
     update foodstuff_items set menu_id=1 where item_id=11;
```
   
| item_id | menu_id | item_name       | categories | price |
|---------|---------|-----------------|------------|-------|
| 11      |  1      | Chicken Briyani | NV         | 300   |
| 12      |  NULL   | MilkShake       | O          | 150   |
| 13      |  NULL   | Laddu           | O          | 100   |

### feature 4:display the user_name,quantity,price and tot_amt for the user_id=22.
``` sql
    select u.user_name,f.price,i.quantity,(f.price*i.quantity) as total_amounts from foodstuff_items f,users u,ordering o,order_item i       where u.user_id=o.user_id and f.item_id=i.item_id and o.order_id=i.order_id and u.user_id=22;
```

| user_name |  price  |     quantity    | total_amounts|
|-----------|---------|-----------------|--------------|
| sanaya    |  150    |      3          | 450          | 

### feature 5:display the total_amount of the user for the order_id=32.
```sql
   create or replace FUNCTION TOT_AMT 
    (
      I_ORDER_ID IN NUMBER 
    ) RETURN NUMBER AS vs_amts number;
   BEGIN
       select  sum(total_amounts)into vs_amts from order_item  where order_id= I_ORDER_ID;
   RETURN vs_amts;
   END TOT_AMT;
   
   update ordering  set tot_amt=TOT_AMT(33) where order_id=33;
                           (OR)
   update ordering o set tot_amt = ( select sum(total_amounts) from order_item  where order_id= o.order_id )  where order_id = 33;
``` sql
    select * from ordering;
```    
| order_id | user_id |       ordered_date             | delivered_date      | tot_amt | sta_tus   |     comments     |
|----------|---------|--------------------------------|---------------------|---------|-----------|------------------|
| 31       | 21      | 02-01-20 10:18:56.469000000 PM |        NULL         |   NULL  | ordered   |       NULL       |
| 32       | 22      | 02-01-20 10:18:56.469000000 PM |        NULL         |   NULL  | ordered   |       NULL       |
| 33       | 23      | 02-01-20 10:18:56.469000000 PM |        NULL         |   250   | ordered   |       NULL       |

```sql
   select * from order_item;
```
| order_item_id | order_id | item_id | quantity | total_amounts | status  | order_date                     |
|---------------|----------|---------|----------|---------------|---------|--------------------------------|
| 41            | 31       | 11      | 4        | 1200          | ordered | 02-01-20 10:19:47.313000000 PM |
| 42            | 32       | 12      | 3        | 450           | ordered | 02-01-20 10:19:47.313000000 PM |
| 43            | 33       | 13      | 5        | 250           | ordered | 02-01-20 10:19:47.313000000 PM |
 


   ### feature 6:update the status,comments and delivered_date for the order_id=32.
 ```sql
    update ordering set sta_tus='delivered',comments='successfully delivered',delivered_date=systimestamp where order_id=33;
```
| order_id | user_id |       ordered_date             |        delivered_date          | tot_amt | sta_tus   |       comments        |
|----------|---------|--------------------------------|--------------------------------|---------|-----------|-----------------------|
| 31       | 21      | 02-01-20 10:18:56.469000000 PM |        NULL                    |   NULL  | ordered   |       NULL            |
| 32       | 22      | 02-01-20 10:18:56.469000000 PM |        NULL                    |   NULL  | ordered   |       NULL            |
| 33       | 23      | 02-01-20 10:18:56.469000000 PM |03-01-20 03:03:07.406000000 AM  |   250   | delivered |successfully delivered |      
### feature 7:update the status whose cancelled the order for the order_id=32.
```sql
 create or replace PROCEDURE PROCEDURE1 
(
  i_order_id IN NUMBER 
) AS 
BEGIN
 update ordering set sta_tus='cancelled' where order_id=i_order_id;
 update order_item set status='cancelled' where order_id=i_order_id;
commit;  
END PROCEDURE1;

declare
 begin
 procedure1(32);
 end;
```sql
   select * from ordering;
```
   
| order_id | user_id |       ordered_date             |        delivered_date          | tot_amt | sta_tus   |       comments        |
|----------|---------|--------------------------------|--------------------------------|---------|-----------|-----------------------|
| 31       | 21      | 02-01-20 10:18:56.469000000 PM |        NULL                    |   NULL  | ordered   |       NULL            |
| 32       | 22      | 02-01-20 10:18:56.469000000 PM |        NULL                    |   NULL  | cancelled |       NULL            |
| 33       | 23      | 02-01-20 10:18:56.469000000 PM |03-01-20 03:03:07.406000000 AM  |   250   | delivered |successfully delivered | 

```sql
   select * from order_item;
```
| order_item_id | order_id | item_id | quantity | total_amounts |   status  | order_date                     |
|---------------|----------|---------|----------|---------------|-----------|--------------------------------|
| 41            | 31       | 11      | 4        | 1200          | ordered   | 02-01-20 10:19:47.313000000 PM |
| 42            | 32       | 12      | 3        | 450           | cancelled | 02-01-20 10:19:47.313000000 PM |
| 43            | 33       | 13      | 5        | 250           | ordered   | 02-01-20 10:19:47.313000000 PM |

### feature 8:display the user_id and item_name for the quantity=4.
```sql
   select o.user_id,f.item_name from ordering o,order_item i,foodstuff_items f where o.order_id=i.order_id and i.item_id=f.item_id and i.quantity=4;
```
| user_id | item_name         |
|---------|-------------------|
| 21      | Chicken Briyani   |
| 21      | Milkshake         |

### feature 9:update the ordered_date for the order_id=33.
```sql
   CREATE OR REPLACE PROCEDURE PROCEDURE2 
(
  I_ORDER_ID IN NUMBER 
) AS 
BEGIN
   update ordering set ordered_date=systimestamp where order_id=i_order_id;
   update order_item set order_date=systimestamp where order_id=i_order_id;
commit;  
  
END PROCEDURE2;
declare
 begin
 procedure2(33);
 end;
```sql
select * from ordering;
```
| order_id | user_id |       ordered_date             |        delivered_date          | tot_amt | sta_tus   |       comments        |
|----------|---------|--------------------------------|--------------------------------|---------|-----------|-----------------------|
| 31       | 21      |          NULL                  |        NULL                    |   NULL  | ordered   |       NULL            |
| 32       | 22      |          NULL                  |        NULL                    |   NULL  | cancelled |       NULL            |
| 33       | 23      | 03-01-20 04:39:30.659000000 AM |03-01-20 03:03:07.406000000 AM  |   250   | delivered |successfully delivered |

```sql
  select * from order_item;
```
| order_item_id | order_id | item_id | quantity | total_amounts | status  | order_date                     |
|---------------|----------|---------|----------|---------------|---------|--------------------------------|
| 41            | 31       | 11      | 4        | 1200          | ordered |         NULL                   |
| 42            | 32       | 12      | 3        | 450           | ordered |         NULL                   |
| 43            | 33       | 13      | 5        | 250           | ordered | 03-01-20 04:39:30.659000000 AM |
 
