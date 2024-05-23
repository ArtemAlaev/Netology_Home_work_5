-- Урок второй! Наполнение!
-- Задание 1

insert into Genre (name)
values ('Nu metal'),
	   ('Gothic metal'),
	   ('Pop punk'),
	   ('New age');

insert into Bands (name)
values ('Linkin park'),
	   ('Evanescence'),
	   ('Sum 41'),
	   ('Enigma');

insert into genreband 
values (1,1),
	   (2,2),
	   (3,3),
	   (4,4),
	   (1,2),
	   (1,3);

insert into Album (name, year_of)
values ('Meteora', 2003),
	   ('Fallen', 2003),
	   ('Does this look infected', 2002),
	   ('The cross of changes', 1993),
	   ('Hybrid theory', 2001),
	   ('Chuck', 2005),
       ('Order in decline', 2019);	   

insert into bandalbum 
values (1, 1),
	   (2, 2),
	   (3, 3),
	   (4, 4),
	   (5, 1),
	   (6, 3),
	   (7, 3);
	  
insert into songs (name, duration, album_id)
values ('Numb', 185, 1),
	   ('Bring me to life', 237, 2),
	   ('Still waiting', 159, 3),
	   ('Return to innocence', 251, 4),
	   ('In the end', 219, 5),
	   ('Pieces', 181, 6),
	   ('My december', 260, 5),
	   ('Never there', 261, 7),
	   ('Catching fire', 242, 7);
	  
insert into collection (name, year_of)
values ('Rock ballads', 2017),
	   ('The best rock songs', 2018),
	   ('Rock memory', 2019),
	   ('Favourites', 2021),
	   ('New', 2020);

insert into songcollection 
values (1, 1),
       (2, 1),
       (3, 1),
       (5, 2),
       (6, 2),
       (1, 2),
       (4, 3),
       (2, 3),
       (1, 3),
       (7, 4),
       (3, 4),
       (5, 4),
       (5, 5),
       (6, 5),
       (7, 5);