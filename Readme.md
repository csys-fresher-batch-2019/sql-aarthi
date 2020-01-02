# My swiggy

*http://swiggy.com

## Features
* User should able to view all the tables.


### feature 1:display the menus table.
```create query
   create table menu(menu_id number,
   category varchar2(30) not null,
   constraint menu_id_pk primary key(menu_id),
   constraint category_cq check(category in('food','snakes & shakes','desserts')));
```
```
   insert query
```
   insert into menus(menu_id,category)values(1,'food');
   insert into menus(menu_id,category)values(2,'snakes and shakes');
   insert into menus(menu_id,category)values(3,'desserts');

 Query:
  ```sql
    
    select * from menus;
  ```
     

### feature 2:display the foodstuff_items table.
```create query
    create table foodstuff_items(item_id number,
    item_name varchar2(50) not null,
    categories varchar2(60) not null,
    price number not null,
    constraint item_id_pk2 primary key(item_id),
    constraint item_name_uq2 unique(item_name),
    constraint categories_cq2 check(categories in('V','NV','O')),
    constraint price_cq2 check(price>=0));
```
```
   insert query
```
   insert into foodstuff_items(item_id,item_name,categories,price)values(11,'Chicken Briyani','NV',300);
   insert into foodstuff_items(item_id,item_name,categories,price)values(12,'MilkShake','O',150);
   insert into foodstuff_items(item_id,item_name,categories,price)values(13,'Veg Burger','V',50);
   insert into foodstuff_items(item_id,item_name,categories,price)values(14,'Laddu','O',100);
   insert into foodstuff_items(item_id,item_name,categories,price)values(15,'Biscuit','O',80);
   insert into foodstuff_items(item_id,item_name,categories,price)values(16,'Badam Halwa','O',200);
```
```
   query
```
 
| item_id | menu_id | item_name       | categories | price |
|---------|---------|-----------------|------------|-------|
| 11      | 1       | Chicken Briyani | NV         | 300   |
| 12      | 2       | MilkShake       | O          | 150   |
| 13      | 3       | Laddu           | O          | 100   |
```
### feature 3: display the users table.
```
    create query
```
     create table users(user_id number,
     user_name varchar2(50) not null,
     phone_no number(10) not null,
     address varchar2(50) not null,
     city varchar2(50) not null,
     constraint user_id_pk1 primary key(user_id),
     constraint phone_no_ck check(length(to_char(phone_no))=10));
     create sequence user_id start with 21 increment by 1;
```
   insert query
```
insert into users(user_id,user_name,phone_no,address,city)values(user_id_seq.nextval,'Aarthi',9735647570,'no.29,north            street,mambakam','Chennai');

insert into users(user_id,user_name,phone_no,address,city)values(user_id_seq.nextval,'Sanaya',9834554345,'no.34,kamarajar colony,town','Tirunelveli');

insert into users(user_id,user_name,phone_no,address,city)values(user_id_seq.nextval,'Revathi',9934554682,'no.15,OMR    road,kelambakam','kachipuram');

insert into users(user_id,user_name,phone_no,address,city)values(user_id_seq.nextval,'Meenakshi',9756477451,'no.2,renugambal nagar,puthukottai','Tuticorin');

insert into users(user_id,user_name,phone_no,address,city)values(user_id_seq.nextval,'Rithya',9846767390,'no.6,west mambalam,avadi','chennai');
```
   query
```
| user_id | user_name | phone_no   | address                     | city        |
|---------|-----------|------------|-----------------------------|-------------|
| 21      | aarthi    | 9735647570 | no.29,north street,mambakam | Chennai     |
| 22      | sanaya    | 9834554345 | no.34,kamarajar colony,town | Tirunelveli |
| 23      | revathi   | 9934554682 | no.15,OMR road,kelambakam   | kachipuram  |

   ### feature 4:display the ordering table.

```sql
   create table ordering(order_id number,
   user_id number not null ,
   ordered_date timestamp default systimestamp,
   delivered_date timestamp,
   tot_amt number,
   sta_tus varchar2(50) default 'ordered',
   comments varchar2(50),
   constraint order_id_pk1 primary key(order_id),
   constraint user_id_fk1 foreign key(user_id) references users(user_id));
   
 ```
  insert query
 ```sql
insert into ordering(order_id,user_id)values(31,21);
insert into ordering(order_id,user_id)values(32,22);
insert into ordering(order_id,user_id)values(33,23);
insert into ordering(order_id,user_id)values(34,24);
insert into ordering(order_id,user_id)values(35,25);
```
query
```sql
  select * from ordering;
```
| order_id | user_id | ordered_date                   | delivered_date                 | tot_amt | sta_tus   | comments               |
|----------|---------|--------------------------------|--------------------------------|---------|-----------|------------------------|
| 31       | 21      | 02-01-20 10:18:56.469000000 PM | 02-01-20 11:31:18.160000000 PM | 2800    | delivered | successfully delivered |
| 32       | 22      | 02-01-20 10:18:56.469000000 PM | 02-01-20 11:31:18.160000000 PM | 450     | delivered | successfully delivered |
| 33       | 23      | 02-01-20 10:18:56.469000000 PM | 02-01-20 11:31:18.160000000 PM | 250     | delivered | successfully delivered |

 ### feature 5: display the ordering table.
 ```sql
    create table order_item(order_item_id number,
    order_id number not null,
    item_id number not null,
    quantity number not null,
    total_amounts number not null,
    status varchar2(50) default 'ordered',
    order_date timestamp default systimestamp,
    constraint order_item_id_pk primary key(order_item_id),
    constraint order_id_fk1 foreign key(order_id)references ordering(order_id),
    constraint item_id_fk2 foreign key(item_id)references foodstuff_items(item_id),
    constraint quantity_ck1 check(quantity>0),
    constraint new_uq unique(order_id,item_id),
    constraint total_amounts_ck1 check(total_amounts>0));
 ```
   insert query
 ```
   insert into order_item(order_item_id,order_id,item_id,quantity,total_amounts)values(41,31,11,4,1200);
   insert into order_item(order_item_id,order_id,item_id,quantity,total_amounts)values(42,32,12,3,450);
   insert into order_item(order_item_id,order_id,item_id,quantity,total_amounts)values(43,33,13,5,250);
   insert into order_item(order_item_id,order_id,item_id,quantity,total_amounts)values(44,34,14,6,600);
   insert into order_item(order_item_id,order_id,item_id,quantity,total_amounts)values(45,35,15,7,560);
   insert into order_item(order_item_id,order_id,item_id,quantity,total_amounts)values(46,31,12,4,800);
   insert into order_item(order_item_id,order_id,item_id,quantity,total_amounts)values(47,31,16,3,800);
```
  query
```
  sql
```
   select * from order_item;
```
| order_item_id | order_id | item_id | quantity | total_amounts | status  | order_date                     |
|---------------|----------|---------|----------|---------------|---------|--------------------------------|
| 41            | 31       | 11      | 4        | 1200          | ordered | 02-01-20 10:19:47.313000000 PM |
| 42            | 32       | 12      | 3        | 450           | ordered | 02-01-20 10:19:47.313000000 PM |
| 43            | 33       | 13      | 5        | 250           | ordered | 02-01-20 10:19:47.313000000 PM |
 
   

