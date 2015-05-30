CREATE TABLE videos (
  id serial8 primary key,
  title varchar(100),
  description text,
  category varchar(100),
  genre varchar(100),
  url text,
  views integer

);