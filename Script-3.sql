select * from parking_place pp inner join parking p on pp.parking_id  = p.id ;
select * from parking_place pp inner join car c on pp.car_id = c.id ;

insert into parking_place  values ( 2, 102, 0.0, null, 2);
select * from parking_place pp left join car c on pp.car_id = c.id where c.id is null ;

select * from parking_place pp full join car c on pp.car_id = c.id;

insert into parking_place  values ( 0, 1, 10, null, null);
insert into parking_place  values ( 0, 2, 10, null, null);
insert into parking_place  values ( 0, 3, 10, null, null);
insert into parking_place  values ( 0, 4, 10, null, null);
