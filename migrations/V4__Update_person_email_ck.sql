alter table person
    drop constraint person_email_ck,
    add constraint person_email_ck check (email like '%@%');
