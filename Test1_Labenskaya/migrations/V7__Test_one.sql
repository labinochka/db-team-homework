create table client
(
    id              bigserial not null,
    name            varchar   not null,
    lastname        varchar   not null,
    patronymic      varchar   not null,
    birthday        date      not null,
    email           varchar   not null,
    phone           varchar   not null,
    passport_series varchar   not null,


    constraint client_id_pk primary key (id),
    constraint client_email_uk unique (email),
    constraint client_phone_uk unique (phone),
    constraint client_passport_series_ck check (length(passport_series) = 4),
    constraint client_email_ck check (email like '%@%'),
    constraint client_phone_ck check (phone like '%+%')
);

create table path
(
    id         bigserial not null,
    city_from  varchar   not null,
    city_where varchar   not null,

    constraint path_id_pk primary key (id)
);


create table train
(
    id                        bigserial not null,
    path_id                   bigint    not null,
    type                      varchar   not null,
    model                     varchar   not null,
    date_of_creation          date      not null,
    number_of_passenger_seats int       not null,
    isWork                    boolean   not null,


    constraint train_id_pk primary key (id),
    constraint train_path_fk foreign key (path_id) references path (id)
);

create table ticket
(
    id               bigserial not null,
    client_id        bigint    not null,
    train_id         bigint    not null,
    date_of_dispatch date      not null,

    constraint ticket_id_pk primary key (id),
    constraint ticket_client_fk foreign key (client_id) references client (id),
    constraint ticket_train_fk foreign key (train_id) references train (id)
);

insert into client(name, lastname, patronymic, birthday, email, phone, passport_series)
values ('Марина', 'Лабенская', 'Евгеньевна', '2004-07-01', 'jdjd@mail.ru', '+79373773', '7777');
insert into client(name, lastname, patronymic, birthday, email, phone, passport_series)
values ('Анна', 'Иванова', 'Ивановна', '2004-07-05', 'hehehe@mail.ru', '+7988837', '7677');
insert into client(name, lastname, patronymic, birthday, email, phone, passport_series)
values ('Александр', 'Морозов', 'Иванович', '1995-07-05', 'ооооe@mail.ru', '+764664', '7999');
insert into client(name, lastname, patronymic, birthday, email, phone, passport_series)
values ('Анатолий', 'Иванов', 'Дмитриевич', '2002-11-05', 'lala@mail.ru', '+7655543', '1527');
insert into client(name, lastname, patronymic, birthday, email, phone, passport_series)
values ('Виктория', 'Красная', 'Дмитриевна', '1999-07-05', 'bbbb@mail.ru', '+7972552', '9999');

insert into path(city_from, city_where) values ('Казань', 'Москва');
insert into path(city_from, city_where) values ('Казань', 'Санкт-Петербург');
insert into path(city_from, city_where) values ('Москва', 'Казань');
insert into path(city_from, city_where) values ('Санкт-Петербург', 'Москва');
insert into path(city_from, city_where) values ('Казань', 'Новосибирск');

insert into train(path_id, type, model, date_of_creation, number_of_passenger_seats, isWork)
values (1, 'Купе', 'РЖД 2017', '2017-11-11', 50, true);
insert into train(path_id, type, model, date_of_creation, number_of_passenger_seats, isWork)
values (2, 'Купе', 'РЖД 2020', '2020-11-11', 40, true);
insert into train(path_id, type, model, date_of_creation, number_of_passenger_seats, isWork)
values (3, 'Плацкарт', 'РЖД 2017', '2017-12-11', 50, false);
insert into train(path_id, type, model, date_of_creation, number_of_passenger_seats, isWork)
values (4, 'Купе', 'РЖД 2005', '2005-11-11', 30, true);
insert into train(path_id, type, model, date_of_creation, number_of_passenger_seats, isWork)
values (5, 'Плацкарт', 'РЖД 2010', '2005-11-12', 50, false);

insert into ticket(client_id, train_id, date_of_dispatch)
values (1, 1, '2023-10-11');
insert into ticket(client_id, train_id, date_of_dispatch)
values (2, 1, '2023-10-12');
insert into ticket(client_id, train_id, date_of_dispatch)
values (3, 3, '2023-10-05');
insert into ticket(client_id, train_id, date_of_dispatch)
values (4, 5, '2023-10-11');
insert into ticket(client_id, train_id, date_of_dispatch)
values (5, 4, '2023-10-11');
