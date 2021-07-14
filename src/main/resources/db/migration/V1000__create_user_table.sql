CREATE TABLE users (
    id SERIAL PRIMARY KEY,

    name VARCHAR(128) NOT NULL,

    password VARCHAR(128) NOT NULL,

    enabled boolean NOT NULL DEFAULT TRUE,

    role VARCHAR(128) NOT NULL DEFAULT 'ROLE_USER'
);

CREATE TABLE post(
    id SERIAL PRIMARY KEY,

    name VARCHAR(128) NOT NULL,

    description VARCHAR(128) NOT NULL,

    user_id INT NOT NULL,

    date DATE,

    FOREIGN KEY (user_id) REFERENCES users (id)
);


CREATE TABLE comment(
    id SERIAL PRIMARY KEY ,

    text VARCHAR (255) NOT NULL,

    post_id INT NOT NULL,

    user_id INT NOT NULL,



    FOREIGN KEY (user_id) REFERENCES users (id),

    FOREIGN KEY (post_id) REFERENCES post (id)
);


INSERT INTO users(name, password, role) values (
    'admin', '$2a$08$JVRJbOv7ZafY6MJWycAdge7w5ItheoX3AhUR2jcbYrpAiHFuuZG6i', 'ROLE_ADMIN'
);
INSERT INTO users(name, password, role) values (
    'user', '$2a$08$JVRJbOv7ZafY6MJWycAdge7w5ItheoX3AhUR2jcbYrpAiHFuuZG6i', 'ROLE_USER'
);

INSERT INTO post(name, description, user_id, date) values (
    'PAW', 'PEW', '1', '2020-01-06'
);
INSERT INTO post(name, description, user_id, date) values (
    'GANG', 'GANG', '2', '2020-01-06'
);

INSERT INTO post(name, description, user_id, date) values (
    'zzz', 'zzz', '1', current_date
);
INSERT INTO post(name, description, user_id, date) values (
    'xxx', 'xxx', '2', current_date
);
