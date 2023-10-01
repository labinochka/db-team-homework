create table person
(
    id BIGSERIAL PRIMARY KEY,
    first_name   VARCHAR(30) not null,
    last_name VARCHAR(30) not null,
    patronymic VARCHAR(30) not null,
    date_of_birth DATE not null,
    age BIGINT not null,
    city VARCHAR(40) not null,
    email VARCHAR(50) unique not null,
    date_of_registration DATE
);

create table message
(
    id BIGSERIAL PRIMARY KEY,
    text VARCHAR(300) not null,
    sender_id BIGINT not null,
    recipient_id BIGINT not null,
    date_of_sending DATE not null,
    time_of_sending TIME not null,
    foreign key (sender_id) references person (id),
    foreign key (recipient_id) references person (id)
);

create table relationship_status
(
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(50) not null
);

create table friendship
(
    id BIGSERIAL PRIMARY KEY,
    first_friend_id BIGINT not null,
    second_friend_id BIGINT not null,
    status_id BIGINT not null,
    start_date DATE not null,
    foreign key (first_friend_id) references person (id),
    foreign key (second_friend_id) references person (id),
    foreign key (status_id) references relationship_status (id)
);

create table access
(
    id BIGSERIAL PRIMARY KEY,
    type_of_access VARCHAR(50) not null
);

create table post
(
    id BIGSERIAL PRIMARY KEY,
    author_id BIGINT not null,
    text VARCHAR(500) not null,
    access_id BIGINT not null,
    date_of_publication DATE not null,
    foreign key (author_id) references person (id),
    foreign key (access_id) references access (id)
);

create table type_of_reaction
(
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(50) not null,
    image_link VARCHAR(300) not null
);

create table reaction
(
    id BIGSERIAL PRIMARY KEY,
    sender_id BIGINT not null,
    post_id BIGINT not null,
    type_id BIGINT not null,
    date_of_sending DATE not null,
    foreign key (sender_id) references person (id),
    foreign key (post_id) references post (id),
    foreign key (type_id) references type_of_reaction (id)
);

create table comment
(
    id BIGSERIAL PRIMARY KEY,
    sender_id BIGINT not null,
    post_id BIGINT not null,
    text VARCHAR(300) not null,
    date_of_sending DATE not null,
    foreign key (sender_id) references person (id),
    foreign key (post_id) references post (id)
);
