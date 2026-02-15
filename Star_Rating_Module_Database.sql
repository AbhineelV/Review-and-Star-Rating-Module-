CREATE TABLE ratingDB(
user_id int PRIMARY KEY IDENTITY(1,1),
user_name varchar(50),
user_email varchar(100) UNIQUE,
user_rating varchar(100),
user_comment varchar(100)
);