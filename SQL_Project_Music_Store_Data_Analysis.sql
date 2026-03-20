# create a database 


#connecting with your database
 use ecom_db;
 #creating tables for your schema
 #table 1 -customers 
 
 create table customers
 (customer_id int auto_increment,
 first_name varchar(20)not null,
 last_name varchar(20)not null,
 email varchar(20)not null,
 phone varchar(20),
 created_at date,
 primary key(customer_id));
 
 #table 2- categories table 
 create table categories(
 category_id int auto_increment,
 name varchar(20)not null,
 description varchar(200),
 primary key (category_id));
 
 #table 3
 create table products(
 product_id int auto_increment,
 category_id int not null,
 name varchar(20) not null,
 price int not null check(price>=0),
 stock int default 0 check (stock>=0),
 primary key(product_id),
 foreign key(category_id) references categories(category_id) on delete cascade );
 
 create table orders(
 order_id int auto_increment,
 customer_id int not null,
 order_date date,
 status enum ('pending','shipped','delivered','cancelled') default 'pending',
 primary key(order_id),
 foreign key(customer_id)references customers(customer_id) on delete cascade );
 
 create table order_items(
 order_item_id int auto_increment,
 order_id int not null,
 product_id int not null,
 quantity int not null check(quantity>=0),
 price decimal(10,2) not null check (price>=0),
 primary key(order_item_id),
 foreign key(order_id) references orders(order_id) on delete cascade,
 foreign key(product_id)references products(product_id) on delete restrict );
 
 create table reviews(
 review_id int auto_increment,
 product_id int not null,
 customer_id int not null,
 rating int not null check (rating between 1 and 5),
 comment varchar(100),
 review_date date,
 primary key (review_id),
 foreign key(product_id) references products(product_id) on delete cascade,
 foreign key (customer_id) references customers(customer_id) on delete cascade);
 
 
 
 
 
 
 
 
 
 
 