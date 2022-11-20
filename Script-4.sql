create or replace view author_and_poems (author_name, poem_name, poem_date) as
select  a.last_name, p."name" as poem_nme, p."date" as poem_date from author a
full outer join poem p on a.id = p.a_id 
where p."date" > '01.01.1900' and p."date" < '01.01.2000';


create function overtime_limit () returns void as '
update orders
set overtime = false
where date_to < now();'
language sql;

select overtime_limit();

create or replace function parking_place_update (id integer) returns parking_place as '
update parking_place 
set parking_id = 2, floor = 3 where parking_id is null;
select * from parking_place where number = id and floor = 3;'
language sql;

select parking_place_update(pp."number")  from parking_place pp;



create or replace function update_overtime() returns setof orders as
$body$
declare ord orders;
begin 
   for ord in select * from orders where overtime = true 
loop 
   update orders set overtime = false, date_to = null where orders.id = ord.id;
   update parking_place set car_id = null where floor = ord.pp_floor and number = ord.pp_number;
return next ord;
end loop;
end;
$body$
language plpgsql;

select update_overtime();