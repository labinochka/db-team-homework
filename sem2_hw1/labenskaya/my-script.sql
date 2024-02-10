\set amount 10000
\set flight_id random(2880, 214867)
\set boarding_no random(1, 90)
\set new_amount random(1000, 30000)
\set flight_id_new_ticket 2880

begin;
select ticket_no
from tickets
         join bookings b on b.book_ref = tickets.book_ref
where b.total_amount > :amount;

select flight_no
from flights
where flight_id = :flight_id;

select tf.fare_conditions
from flights f
         join ticket_flights tf on f.flight_id = tf.flight_id
where tf.flight_id = :flight_id;

select tickets.ticket_no
from tickets
         join boarding_passes bp on tickets.ticket_no = bp.ticket_no
where boarding_no = :boarding_no;

select passenger_id
from tickets
         join ticket_flights tf on tickets.ticket_no = tf.ticket_no
where tf.flight_id = :flight_id;

update bookings
set total_amount = :new_amount
where book_ref = '000AFB';

update ticket_flights
set amount = :new_amount
where amount > :amount;

insert into ticket_flights (ticket_no, flight_id, fare_conditions, amount)
values ('0005434204322', :flight_id_new_ticket, 'Economy', :amount);

delete
from boarding_passes
where flight_id > :flight_id;
end;