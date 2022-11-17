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