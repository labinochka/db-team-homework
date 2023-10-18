alter table person
    drop constraint person_phone_ck,
    add constraint person_phone_ck check (phone is not null and phone like '%+%' and length(phone) > 5)
