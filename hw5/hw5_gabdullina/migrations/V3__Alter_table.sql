alter table person
    add constraint person_phone_uk unique (phone),
    add constraint person_phone_ck check (phone is not null and phone like '+' and length(phone) > 5),
    add constraint person_profession_ck check (profession is not null),
    add constraint person_nationality_ck check (nationality is not null),
    add constraint person_date_ck check (date_of_registration is not null),
    add constraint person_age_ck check (age >= 14),
    add constraint person_email_ck check (email like '@');

alter table post
    add constraint post_text_ck check (length(text) >= 10)