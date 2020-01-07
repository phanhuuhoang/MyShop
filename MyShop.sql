

create table Custommers (
   customer_username varchar(255) not null,
   customer_pass varchar(50) not null,
   customer_email varchar(20) not null UNIQUE,
   customer_fullname varchar(255) not null,
   customer_adress varchar(255) not null,
   customer_phone varchar(11) not null,
   primary key (customer_username)
);
 
create table Users (
   user_id integer not null AUTO_INCREMENT,
   user_pass varchar(50) not null,
   user_name varchar(50) not null UNIQUE,
   user_role integer not null,
   user_active boolean not null,
   primary key (user_id)
);
 
create table Categories (
   category_id integer not null AUTO_INCREMENT,
   category_name varchar(255) not null,
   primary key (category_id)
);
 
create table Products (
   product_id bigint(20) not null AUTO_INCREMENT,
   category_id integer not null,
   product_description varchar (255) not null,
   product_name varchar (255) not null UNIQUE,
   product_image varchar (255) not null,
   product_price decimal not null,
   product_detail text not null,
   primary key (product_id),
   FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);


create table Orders (
   order_id bigint(20) not null AUTO_INCREMENT,
   customer_username varchar(255) not null,
   order_amount decimal not null,
   order_status integer not null,
   order_date date not null,
   order_number integer not null,
   primary key (order_id),
   FOREIGN KEY (customer_username) REFERENCES Custommers(customer_username)
); 

create table Orderdetails (
   orderdetail_id bigint(20) not null AUTO_INCREMENT,
   product_id bigint(20) not null,
   order_id bigint(20) not null,
   orderdetail_price decimal not null,
   orderdetail_quantity integer not null,
   primary key (orderdetail_id),
   FOREIGN KEY (product_id) REFERENCES Products(product_id),
   FOREIGN KEY (order_id) REFERENCES Orders(order_id)
); 

insert into Users (user_pass, user_name, user_role, user_active)
values ('admin', 'damin', '1', true);


