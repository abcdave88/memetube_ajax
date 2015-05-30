CREATE TABLE videos (
  id serial8 primary key,
  title varchar(100),
  description text,
  genre varchar(100),
  url text,
  views integer

);