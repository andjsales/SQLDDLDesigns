-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  departure_time TIMESTAMP NOT NULL,
  arrival_time TIMESTAMP NOT NULL,
  seat TEXT NOT NULL,
  airline TEXT NOT NULL,
  passenger_id INT REFERENCES passengers(id),
  destination_id INT REFERENCES destinations(id)
);

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE destinations (
  id SERIAL PRIMARY KEY,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);

INSERT INTO passengers (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');


INSERT INTO destinations (from_city, from_country, to_city, to_country)
VALUES
  ('Washington DC', 'United States', 'Seattle', 'United States'),
  ('Tokyo', 'Japan', 'London', 'United Kingdom'),
  ('Los Angeles', 'United States', 'Las Vegas', 'United States'),
  ('Seattle', 'United States', 'Mexico City', 'Mexico'),
  ('Paris', 'France', 'Casablanca', 'Morocco'),
  ('Dubai', 'UAE', 'Beijing', 'China'),
  ('New York', 'United States', 'Charlotte', 'United States'),
  ('Cedar Rapids', 'United States', 'Chicago', 'United States'),
  ('Charlotte', 'United States', 'New Orleans', 'United States'),
  ('Sao Paolo', 'Brazil', 'Santiago', 'Chile');


INSERT INTO tickets (departure_time, arrival_time, seat, airline, passenger_id, destination_id)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', '33B', 'United', 1, 1),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', '8A', 'British Airways', 2, 2),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', '12F', 'Delta', 3, 3),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', '20A', 'Delta', 1, 4),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', '23D', 'TUI Fly Belgium', 4, 5),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', '18C', 'Air China', 2, 6),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', '9E', 'United', 5, 7),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', '1A', 'American Airlines', 6, 8),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', '32B', 'American Airlines', 5, 9),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', '10D', 'Avianca Brasil', 7, 10);