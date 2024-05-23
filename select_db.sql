-- Задание 2.1 Название и продолжительность самого длительного трека.
      
 select name, duration
 from songs
 where duration = (select MAX(duration) from songs);

-- Задание 2.2 Название треков, продолжительность которых не менее 3,5 минут.

select name
from songs
where duration >= 210;

-- Задание 2.3 Названия сборников, вышедших в период с 2018 по 2020 год включительно.

select name
from collection
where year_of between 2018 and 2020;

-- Задание 2.4 Исполнители, чьё имя состоит из одного слова.

select name
from bands
where name not like '% %';

-- Задание 2.5 Название треков, которые содержат слово «мой» или «my».

select name
from songs
where LOWER(name) like '%мой%' or LOWER(name) like '%my%';

-- Задание 3.1 Количество исполнителей в каждом жанре.

select Genre.name as Жанр, COUNT(Band_id) as Количество
from genreband
	inner join genre on genreband.genre_id = genre.id
group by genre.name;

-- Задание 3.2 Количество треков, вошедших в альбомы 2019–2020 годов.

select  count(s.id)
from songs s
left join album a on s.album_id = a.id
where a.year_of IN (2019, 2020);

-- Задание 3.3 Средняя продолжительность треков по каждому альбому.

select album.name, Прод_ть
from album
	inner join (select album_id, AVG(duration) as Прод_ть
				from songs
				group by album_id) as s
				on album.id = s.album_id;
			
-- Задание 3.4 Все исполнители, которые не выпустили альбомы в 2020 году.
			
select bands.name
from bands
	inner join bandalbum on bands.id = bandalbum.band_id
	inner join album on bandalbum.album_id = album.id
where year_of <> 2020;

-- Задание 3.5 Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами). Пусть это будет Evanescence.

select distinct collection.name
from collection
	inner join songcollection on collection.id = songcollection.collection_id
	inner join songs on songcollection.song_id = songs.id 
	inner join album on songs.album_id = album.id 
	inner join bandalbum on album.id = bandalbum.album_id 
	inner join bands on bandalbum.band_id = bands.id 
where bands.name = 'Evanescence';

-- 4.1 Названия альбомов, в которых присутствуют исполнители более чем одного жанра.

select a.name, COUNT(g.name)
from album a
	inner join bandalbum ba on a.id = ba.album_id
	inner join bands bs on ba.band_id = bs.id
	inner join genreband gb on bs.id = gb.band_id
	inner join genre g on gb.genre_id = g.id
group by a.name 
having COUNT(g.name) > 1;

-- 4.2 Наименования треков, которые не входят в сборники.

select s.name
from songs s 
where s.id <> all (select distinct song_id from songcollection);

-- 4.3 Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.

select b.name
from bands b 
	inner join bandalbum b2 on b.id = b2.band_id 
	inner join songs s on b2.album_id = s.album_id 
where s.duration = (select min(duration) from songs);

-- 4.4 Названия альбомов, содержащих наименьшее количество треков.

select a.name
from album a 
	inner join songs s on a.id = s.album_id
group by a.name
having count(s.name) = (
						select count(s.name)
						from songs s
						inner join album a
						on s.album_id = a.id
						group by s.name
						order by count(s.name)
						limit 1
						);