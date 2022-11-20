create table if not exists parking (
 id serial primary key,
 type varchar(64) not null,
 name varchar(64),
 adress varchar (256)
);


create table if not exists parking_user(
 id bigserial primary key,
 login varchar(64) not null,
 password varchar(32) not null,
 first_name varchar(32),
 last_name varchar(32),
 middle_name varchar(32),
 phoneNumber varchar(32),
 cardNumber varchar(16),
 role varchar(32) not null
);

create table if not exists car(
 id bigserial primary key,
 model varchar(64),
 number varchar(16) not null,
 weight float4 not null,
 user_id int4 not null,
 foreign key (user_id) references parking_user(id)
);


create table if not exists parking_place (
 floor  int4,
 number int4,
 primary key (floor, number),
 cost float4 not null,
 car_id int4,
 parking_id int4,
foreign key (car_id) references car(id),
foreign key (parking_id) references parking(id)
);

create table if not exists orders (
 id bigserial primary key,
 pp_floor int4,
 pp_number int4,
 date_from timestamp,
 date_to timestamp,
 overtime bool,
 foreign key (pp_floor, pp_number) references parking_place(floor, number)
);

drop table parking cascade;
drop table parking_user cascade;
drop table car cascade;
drop table parking_place cascade;
drop table orders cascade;