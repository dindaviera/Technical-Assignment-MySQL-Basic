-- SHOW database untuk melihat list database yang ada pada mysql
show databases;

-- CREATE database bernama bookstore
mysql> create database bookstore;

-- USE database bookstore
mysql> use bookstore;

-- SHOW seluruh table yang ada pada database bookstore
mysql> show tables;

--Buatlah table bernama books dengan attribute yang sudah ditentukan (id, author1, author2, author3, title, description, place_sell, stock, creation_date)
mysql> create table books(
    -> id int auto_increment primary key,
    -> author1 varchar(100) not null,
    -> author2 varchar(100),
    -> author3 varchar(100),
    -> title varchar(100),
    -> description text,
    -> place_sell char(3),
    -> stock int default(0),
    -> creation_date timestamp default current_timestamp on update current_timestamp
    -> );

-- Update column dari table books yang sudah ada dengan ADD column price dan status
mysql> alter table books
    -> add price int default(0),
    -> add status enum('available' , 'out of stock' , 'limited');

-- Update column dari table books yang sudah ada dengan DROP column place_sell
mysql> alter table books
    -> drop column place_sell;

-- Insert 3 data untuk semua column pada table books
mysql> insert into books (id, author1, author2, author3, title, description, stock, creation_date, price, status) values
    -> (1, 'Ilana Tan', '' , '' , 'Summer in Seoul', 'buku ini menceritakan sebuah kisah cinta antara Han Soon Hee dan Jung Tae Won dengan latar tempat Seoul', 25, '2007-05-01 05:05:05', 65000, 'available'),
    -> (2, 'Sara Wijayanto', 'Risa Saraswati', '', 'Risara', 'Buku ini merupakan kolaborasi antara Sara Wijayanto dan RIsa Saraswatiyang menceritakan tentang kisah misteri yang mereka alami', 50, '2019-01-01 10:10:10', 60000, 'available'),
    -> (3, 'Putri Cendana', 'Elizabeth Stefani', '', 'Anomali Hati', 'Buku ini merupakan kolaborasi antara dua penulis novel yang menceritakan tentang rumitnya perasaan seorang manusia', 0, '2016-06-06 10:10:10', 55000, 'out of stock');

-- SELECT semua row pada table books
mysql> select * from books;

-- SELECT menggunakan ALIAS. Column id digantikan ID, author1 digantikan A1, author2 digantikan A2, author3 digantikan A3.
mysql> select id as ID, author1 as A1, author2 as A2, author3 as A3 from books;

-- SELECT data menggunakan WHERE untuk id tertentu
mysql> select * from books where id = 1;

-- SELECT data menggunakan WHERE untuk dengan operator logical AND
mysql> select * from books where id = 2 and author2 = 'Risa Saraswati';

-- SELECT data menggunakan WHERE untuk dengan operator logical OR
mysql> select * from books where author1 = 'Ilana Tan' or id = 3;

-- SELECT data menggunakan WHERE untuk dengan operator logical NOT
mysql> select * from books where not id = 1;

-- SELECT seluruh column dari table bookstore dan diurutkan secara ASC berdasarkan id
mysql> select * from books order by id asc;

-- SELECT seluruh column dan berikan LIMIT untuk 2 row saja
mysql> select * from books limit 2;

-- Pilih 1 row untuk dilakukan UPDATE pada column author1 dan price.
mysql> update books set author1 = 'Putricen', price = 60000 where id = 3;

-- Pilih 1 row untuk dilakukan DELETE
mysql> delete from books where id = 2;

