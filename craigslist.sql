CREATE TABLE region (
    region_id SERIAL PRIMARY KEY,
    region_name TEXT
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(10) UNIQUE,
    password TEXT NOT NULL,
    region INT REFERENCES region(region_id)
);

CREATE TABLE post (
    post_id SERIAL PRIMARY KEY,
    title TEXT,
    content TEXT,
    user_id INT REFERENCES users(user_id),
    region_id INT REFERENCES region(region_id),
    category_id INT REFERENCES categories(category_id)
);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name TEXT
);
