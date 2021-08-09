CREATE TABLE videos(
    id_video int AUTO_INCREMENT PRIMARY KEY,
    author varchar (30),
    title varchar (30),
    likes int (10),
    dislikes int (10)
);

INSERT INTO videos (author, title, likes, dislikes) VALUES ('Maria', 'MySQL', '10', '2');
INSERT INTO videos (author, title, likes, dislikes) VALUES ('João', 'HTML', '15', '8');
INSERT INTO videos (author, title, likes, dislikes) VALUES ('Maria', 'CSS', '9', '0');
INSERT INTO videos (author, title, likes, dislikes) VALUES ('Pedro', 'JavaScript', '10', '2');
INSERT INTO videos (author, title, likes, dislikes) VALUES ('Maria', 'Python', '22', '1');
(Aqui estamos indo contra o princípio da atomicidade por haver duplicidade de nomes no campo autor, então iremos criar uma tabela exclusiva para autores).


CREATE TABLE author (
    id_author int  AUTO_INCREMENT PRIMARY KEY,
    name varchar (30),
    born date
);

INSERT INTO author (name, born) VALUES ('Maria', '200-04-19');
INSERT INTO author (name, born) VALUES ('Roberto', '1989-05-06');
INSERT INTO author (name, born) VALUES ('Pedro', '1993-08-14');
INSERT INTO author (name, born) VALUES ('Carla','1995-03-21');

ALTER TABLE videos DROP COLUMN author;

ALTER TABLE videos ADD CONSTRAINT fk_author FOREIGN KEY (id_author) REFERENCES author(id_author)
 ON DELETE CASCADE
 ON UPDATE CASCADE AFTER ;

UPDATE videos SET fk_author=1 WHERE id_video=1;
UPDATE videos SET fk_author=1 WHERE id_video=2;
UPDATE videos SET fk_author=1 WHERE id_video=3;
UPDATE videos SET fk_author=2 WHERE id_video=4;
UPDATE videos SET fk_author=3 WHERE id_video=5;


SELECT * FROM videos JOIN author ON videos.fk_author = author.id_author;

SELECT videos.title,author.name FROM videos JOIN author ON videos.fk_author = author.id_author;

INSERT INTO videos (fk_author, title, likes, dislikes) VALUES ('2', 'PHP', '8', '1');

CREATE TABLE seo (
    id_seo int AUTO_INCREMENT PRIMARY KEY,
    category varchar (20)
);

INSERT INTO seo (category) VALUES (frontend);
INSERT INTO seo (category) VALUES (backend);

ALTER TABLE videos ADD CONSTRAINT fk_seo int FOREIGN KEY (id_seo)
 REFERENCES seo(id_seo)
 ON DELETE CASCADE
 ON UPDATE CASCADE;

UPDATE videos SET fk_seo=1 WHERE id_video=2; 
UPDATE videos SET fk_seo=1 WHERE id_video=3;
UPDATE videos SET fk_seo=1 WHERE id_video=4;
UPDATE videos SET fk_seo=2 WHERE id_video=1;
UPDATE videos SET fk_seo=2 WHERE id_video=5;
UPDATE videos SET fk_seo=2 WHERE id_video=6;

SELECT * FROM videos JOIN seo ON videos.fk_seo = seo.id_seo;

SELECT videos.title, seo.categoria FROM videos JOIN seo ON videos.fk_seo = seo.id_seo;

SELECT videos.title, author.name, seo.categoria FROM videos JOIN seo ON videos.fk_seo = seo.id_seo
JOIN author ON videos.fk_author = author.id_author;

CREATE TABLE playlist (
    id_playlist int AUTO_INCREMENT PRIMARY KEY,
    name_pl varchar (30)
);

INSERT INTO playlist (name_pl) VALUES ('HTML + CSS');
INSERT INTO playlist (name_pl) VALUES ('HTML + PHP + JS');
INSERT INTO playlist (name_pl) VALUES ('Python + PHP');

CREATE TABLE videos_playlist (
    id_vp int AUTO_INCREMENT PRIMARY KEY,
    fk_video int, 
    fk_playlist int
);

INSERT into videos_playlist (fk_video, fk_playlist) VALUES ('2','1');
INSERT into videos_playlist (fk_video, fk_playlist) VALUES ('3','1');

SELECT * FROM playlist JOIN videos_playlist ON playlist.id_playlist = videos_playlist.fk_playlist;

SELECT * FROM playlist JOIN videos_playlist ON playlist.id_playlist = videos_playlist.fk_playlist
JOIN videos ON videos.id_video = videos_playlist.fk_video;

SELECT playlist.name_pl, videos.title, author.name FROM playlist 
JOIN videos_playlist ON playlist.id_playlist = videos_playlist.fk_playlist 
JOIN videos ON videos.id_video = videos_playlist.fk_video
JOIN author ON videos.fk_author = author.id_author; 




