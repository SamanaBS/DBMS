	# MOVIE TABLE
create table movie (
		mov_id int not null,
        mov_title char(45) not null,
        mov_rel_date_year date not null,
        mov_lang CHAR(45) not null,
        mov_country CHAR(45) not null,
        mov_duration int not null,
        primary key(mov_id)
);
insert into  movie(mov_id,mov_title,mov_rel_date_year ,mov_lang ,mov_country ,mov_duration)
	values(300,'chakde','2017-06-15','hindi','india','2');
    insert into movie values(400,'gold','2016-06-18','hindi','india','3');
	insert into movie values(500,'3 idiots','2008-07-14','hindi','india','2');
    insert into movie values(600,'taare zameen par','2008-07-10','hindi','india','2');
    insert into movie values(900,'Harry potter and the prisoner of askaban','2008-05-11','english','USA','4');
    insert into movie values(1000,'Harry potter and the deathly hallows 1','2011-05-21','english','USA','5');
    insert into movie values(700,'Mission Impossible 1','2012-06-14','english','USA','6');
    
    # MOV_GENRE TABLE
    
create table mov_genre(
	genre_id int not null,
    genre_name varchar(45) not null,
    primary key(genre_id)
);
insert into mov_genre(genre_id,genre_name)
	values(300,'Drama,Family,sports');
    insert into mov_genre values(400,'Drama,History,sports');
    insert into mov_genre values(600,'Drama,Family');
    insert into mov_genre values(900,'Adventure,fantasy');
    insert into mov_genre values(1000,'Adventure,fantasy');
    
    # MOVIE_DIRECTOR TABLE

create table movie_director(
		id int not null,
        director_fname varchar(45) not null,
        director_lname varchar(45) not null,
        primary key(id)
);
insert into movie_director(id,director_fname,director_lname)
	values(300,'shimit','amin');
    insert into movie_director values(500,'Rajkumar','Hirani');
    insert into movie_director values(900,'David','Yates');
    insert into movie_director values(700,'Brian De','Palma');

    
	#MOVIE_CAST TABLE
    
    create table movie_cast(
	mov_id int not null,
    act_id int not null,
    primary key(act_id)
);

insert into  movie_cast(mov_id,act_id)
	values(300,400);
    insert into movie_cast values(700,900);
	insert into movie_cast values(300,500);
    insert into movie_cast values(600,1000);
    insert into movie_cast values(900,300);
    insert into movie_cast values(1000,600);

	# ACTOR TABLE

    create table actor(
act_id INT NOT NULL,
act_fname VARCHAR(255) NOT NULL,
actor_lname VARCHAR(255) NOT NULL,
actor_gender CHAR(10) NOT NULL,
actor_DOB DATE NOT NULL,
    primary key(act_id)
);

insert into  actor(act_id,act_fname,actor_lname,actor_gender,actor_DOB)
	values(300,'ranbir','kapoor','male','1998-07-11');
    insert into actor values(400,'rajkumar','rao','male','1997-02-17');
	insert into actor values(500,'anushka','sharma','female','2000-05-25');
    insert into actor values(600,'priyanka','chopra','female','1988-09-18');
    insert into actor values(900,'emma','watson','female','1991-05-11');
    insert into actor values(1000,'akshay','kumar','male','1974-12-14');
    
		#MOV_RATING TABLE
        
	create table mov_rating(
	mov_id INT NOT NULL,
    num_o_stars INT NOT NULL,
    primary key(mov_id)
);
    
insert into mov_rating(mov_id,num_o_stars)
   values(300,4);
   insert into mov_rating values(400,3);
   insert into mov_rating values(500,4);
   insert into mov_rating values(600,3);
   insert into mov_rating values(900,4);
   insert into mov_rating values(1000,4);
   insert into mov_rating values(700,5);
   
	# MOV_AWARD TABLE
   
	create table mov_award(
    Award_id INT NOT NULL,
    mov_id INT NOT NULL,
	title VARCHAR(255) NOT NULL,
    primary key(award_id)
);
   
    
    insert into mov_award(award_id,mov_id,title)
   values(1,300,'zee cine awards');
   insert into mov_award values(2,400,'ifa');
   insert into mov_award values(4,700,'iifa');
   insert into mov_award values(7,600,'guild award');
   insert into mov_award values(5,900,'people choice award');
   insert into mov_award values(6,700,'oscar');
   
				# INNER JOIN
                
SELECT mov_award.title, movie.mov_title
FROM movie
INNER JOIN mov_award ON movie.mov_id = mov_award.mov_id WHERE mov_title='Mission Impossible 1';

SELECT mov_genre.genre_name, movie.mov_title 
FROM movie 
INNER JOIN mov_genre ON movie.mov_id = mov_genre.genre_id ORDER BY mov_lang;


select mov_genre.genre_name,movie.mov_title,movie.mov_lang,mov_rating.num_o_stars
from mov_genre
inner join movie on mov_genre.genre_id = movie.mov_id
inner join mov_rating on  mov_genre.genre_id = mov_rating.mov_id;

				# LEFT JOIN
                
SELECT movie.mov_title, mov_award.title
FROM movie
LEFT JOIN mov_award ON movie.mov_id = mov_award.mov_id
WHERE movie.mov_rel_date_year<'2011-12-12';


SELECT movie.mov_title, movie.mov_rel_date_year, movie.mov_lang, movie_director.director_fname, movie_director.director_lname,mov_rating.num_o_stars
FROM movie
LEFT JOIN movie_director ON movie.mov_id = movie_director.id
LEFT JOIN mov_rating ON movie.mov_id = mov_rating.mov_id;

SELECT movie.mov_title,movie.mov_lang,mov_rating.num_o_stars
FROM movie
LEFT JOIN mov_rating ON movie.mov_id = mov_rating.mov_id ORDER BY num_o_stars;

				# RIGHT JOIN

select movie.mov_title,movie.mov_country,movie.mov_lang, mov_award.Award_id,mov_award.title
from movie
right join mov_award on  movie.mov_id = mov_award.mov_id order by movie.mov_title;

select t.mov_title,t.mov_lang,sum(ti.act_id) as 'total views',sum(ti.mov_id) as 'total likes'
from movie as t
right join movie_cast as ti
on t.mov_id = ti.act_id
group by t.mov_title;

select mov_genre.genre_name,movie.mov_title,movie.mov_lang,mov_rating.num_o_stars
from mov_genre
right join movie on mov_genre.genre_id = movie.mov_id
right join mov_rating on  mov_genre.genre_id = mov_rating.mov_id;






 