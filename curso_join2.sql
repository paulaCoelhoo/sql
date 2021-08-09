CREATE TABLE canais (
    id_canal int(11) NOT NULL,
    nome_canal varchar(100) NOT NULL
);

INSERT INTO canais (id_canal, nome_canal) VALUES
('1', 'React'),
('2', 'PHP'),
('3', 'CSS'),
('4', 'HTML');

CREATE TABLE videos (
    id_video int(11) NOT NULL,
    nome_video varchar(100) NOT NULL,
    autor_video varchar(100) NOT NULL
);

INSERT INTO videos (id_video, nome_video, autor_video) VALUES
('1','login com React', 'React'),
('2', 'Componentes com React', 'React'),
('3', 'Listas com PHP', 'PHP'),
('4','Funções com PHP','PHP'),
('5','Páginas com HTML', 'HTML');

CREATE TABLE videos_canais (
    id_videos_canais int(11) NOT NULL,
    fk_canal int(11) NOT NULL,
    fk_video int(11) NOT NULL
);

INSERT INTO videos_canais (id_videos_canais, fk_canal, fk_video) VALUES
('1','2','4'),
('2','2','3'),
('3','1','1'),
('4','1','2'),
('5','4','5');


SELECT * FROM videos_canais AS vc JOIN videos AS v ON vc.fk_video = v.id_video
JOIN canais as c ON vc.fk_canal = c.id_canal;


SELECT v.nome_video, v.autor_video, c.nome_canal FROM videos_canais AS vc JOIN videos AS v ON vc.fk_video = v.id_video
JOIN canais as c ON vc.fk_canal = c.id_canal;


SELECT v.id_video, v.nome_video FROM videos AS v LEFT OUTER JOIN videos_canais AS vc ON v.id_video= vc.fk_video
UNION 
SELECT c.id_canal, c.nome_canal  FROM videos_canais AS vc RIGHT OUTER JOIN canais as c ON vc.fk_canal = c.id_canal;

INSERT INTO canais (id_canal, nome_canal) VALUES ('4', 'HTML');

INSERT INTO videos_canais (id_videos_canais, fk_canal, fk_video) VALUES ('5', '4', '5');

SELECT * FROM videos_canais JOIN videos ON videos_canais.fk_video = videos.id_video
JOIN canais ON videos_canais.fk_canal = canais.id_canal;

SELECT * FROM videos_canais 
JOIN videos ON videos_canais.fk_video = videos.id_video
JOIN canais ON videos_canais.fk_canal = canais.id_canal
WHERE canais.id_canal = '2';







