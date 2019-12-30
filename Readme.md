# Swiggy Food Order And Delivery App

*http://swiggy.com

##Features
*User should able to view all the categories.


### feature 1:list all the categories.
```sql
   create table menu(menu_id number,
   category varchar2(30) not null,
   constraint menu_id_pk primary key(menu_id),
   constraint category_cq check(category in('food','snakes & shakes','desserts')));
```
 Query:
     select * from menu;
     
     
      
 
