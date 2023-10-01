CREATE DATABASE trailerflix;

USE trailerflix;

CREATE TABLE `Audiovisual` (
	`id` int NOT NULL AUTO_INCREMENT,
	`titulo` varchar(100) NOT NULL,
	`poster` varchar(255) NOT NULL,
	`resumen` TEXT NOT NULL,
	`temporadas` smallint NOT NULL,
	`trailer` varchar(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Categorias` (
	`id` int NOT NULL AUTO_INCREMENT,
	`tipo` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Generos` (
	`id` int NOT NULL AUTO_INCREMENT,
	`clasificacion` varchar(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Actores` (
	`id` int NOT NULL AUTO_INCREMENT,
	`nombreApellido` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `AudiovisualxCategorias` (
	`idaudiovisual` int NOT NULL,
	`idcategoria` int NOT NULL
);

CREATE TABLE `AudiovisualxGeneros` (
	`idaudiovisual` int NOT NULL,
	`idgenero` int NOT NULL
);

CREATE TABLE `AudiovisualxActores` (
	`idaudiovisual` int NOT NULL,
	`idactor` int NOT NULL
);

ALTER TABLE `AudiovisualxCategorias` ADD CONSTRAINT `AudiovisualxCategoria_fk0` FOREIGN KEY (`idaudiovisual`) REFERENCES `Audiovisual`(`id`);

ALTER TABLE `AudiovisualxCategorias` ADD CONSTRAINT `AudiovisualxCategoria_fk1` FOREIGN KEY (`idcategoria`) REFERENCES `Categorias`(`id`);

ALTER TABLE `AudiovisualxGeneros` ADD CONSTRAINT `AudiovisualxGeneros_fk0` FOREIGN KEY (`idaudiovisual`) REFERENCES `Audiovisual`(`id`);

ALTER TABLE `AudiovisualxGeneros` ADD CONSTRAINT `AudiovisualxGeneros_fk1` FOREIGN KEY (`idgenero`) REFERENCES `Generos`(`id`);

ALTER TABLE `AudiovisualxActores` ADD CONSTRAINT `AudiovisualxActores_fk0` FOREIGN KEY (`idaudiovisual`) REFERENCES `Audiovisual`(`id`);

ALTER TABLE `AudiovisualxActores` ADD CONSTRAINT `AudiovisualxActores_fk1` FOREIGN KEY (`idactor`) REFERENCES `Actores`(`id`);

SELECT * FROM Audiovisual;

SELECT * FROM Categorias;

SELECT * FROM Generos;

SELECT * FROM Actores;

SELECT * FROM AudiovisualxCategoria;

SELECT * FROM AudiovisualxGeneros;

SELECT * FROM AudiovisualxActores;

SELECT * FROM catalogoView;

CREATE VIEW catalogoView AS
SELECT
    A.id AS id,
    A.titulo,
    A.poster,
    A.resumen,
    A.temporadas,
    A.trailer,
    C.tipo AS categoria,
	GROUP_CONCAT(DISTINCT AG.clasificacion ORDER BY AG.clasificacion ASC SEPARATOR ', ') AS generos,
    GROUP_CONCAT(DISTINCT AC.nombreApellido ORDER BY AC.nombreApellido ASC SEPARATOR ', ') AS reparto
FROM
    Audiovisual A
JOIN
    AudiovisualxCategorias ACat ON A.id = ACat.idaudiovisual
JOIN
    Categorias C ON ACat.idcategoria = C.id
JOIN
    AudiovisualxGeneros AGen ON A.id = AGen.idaudiovisual
JOIN
    Generos AG ON AGen.idgenero = AG.id
LEFT JOIN
    AudiovisualxActores AAct ON A.id = AAct.idaudiovisual
LEFT JOIN
    Actores AC ON AAct.idactor = AC.id
GROUP BY
    A.id, A.titulo, A.poster, A.resumen, A.temporadas, A.trailer, C.tipo;
    
    
-- CARGA DE DATA EN LA TABLA AUDIOVISUAL --

INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (1, 'The Crown', "/posters/1.jpeg", 'Este drama narra las rivalidades políticas y el romance de la reina Isabel II, así como los sucesos que moldearon la segunda mitad del siglo XX.', 4, "https://www.youtube.com/watch?v=zzBjNG1GKu4");
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (2, "Riverdale", "/posters/2.jpeg", "El paso a la edad adulta incluye sexo, romance, escuela y familia. Para Archie y sus amigos, también hay misterios oscuros.", 5, "https://www.youtube.com/watch?v=HxtLlByaYTc"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (3, "The Mandalorian", "/posters/3.jpeg", "Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la serie sigue los pasos de un pistolero solitario en las aventuras que protagoniza en los confines de la galaxia, donde no alcanza la autoridad de la Nueva República.", 2, "https://www.youtube.com/watch?v=aOC8E8z_ifw");
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (4, "The Umbrella Academy", "/posters/4.jpeg", "La muerte de su padre reúne a unos hermanos distanciados y con extraordinarios poderes que descubren impactantes secretos y una amenaza que se cierne sobre la humanidad.", 1, "https://www.youtube.com/watch?v=KHucKOK-Vik");
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (5, "Gambito de Dama", "/posters/5.jpeg", "En los cincuenta, una joven de un orfanato descubre que tiene un increíble don para el ajedrez y recorre el arduo camino a la fama mientras lucha contra las adicciones.", 1, "https://www.youtube.com/watch?v=-BBgzgNgzeQ");
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (6, "Enola Holmes", "/posters/6.jpeg", "La hermana menor de Sherlock, descubre que su madre ha desaparecido y se dispone a encontrarla. En su búsqueda, saca a relucir el sabueso que corre por sus venas y se encuentra con una conspiración que gira en torno a un misterioso lord, demostrando que su ilustre hermano no es el único talento en la familia.",0, "https://www.youtube.com/watch?v=bxG9VN9RrVs"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (7, "Guasón", "/posters/7.jpeg", "Arthur Fleck (Phoenix) es un hombre ignorado por la sociedad, cuya motivación en la vida es hacer reír. Pero una serie de trágicos acontecimientos le llevarán a ver el mundo de otra forma. Película basada en el popular personaje de DC Comics Joker, conocido como archivillano de Batman, pero que en este film tomará un cariz más realista y oscuro.",0, "https://www.youtube.com/watch?v=TobNCFMK_bs"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (8, "Avengers: End Game", "/posters/8.jpeg", "Después de los devastadores eventos de los Vengadores: Infinity War (2018), el universo está en ruinas. Con la ayuda de los aliados restantes, los Vengadores se reúnen una vez más para revertir las acciones de Thanos y restaurar el equilibrio del universo.",0, "https://www.youtube.com/watch?v=PyakRSni-c0"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (9, "Juego de tronos", "/posters/9.jpeg", "En un mundo fantástico y en un contexto medieval varias familias, relativas a la nobleza, se disputan el poder para dominar el territorio ficticio de Poniente (Westeros) y tomar el control de los Siete Reinos desde el Trono de Hierro, lugar donde el rey ejerce el poder.",8, "https://www.youtube.com/watch?v=KPLWWIOCOOQ"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (10, "The Flash", "/posters/10.jpeg", "Sigue las veloces aventuras de Barry Allen, un joven común y corriente con el deseo latente de ayudar a los demás. Cuando una inesperada partícula aceleradora golpea por accidente a Barry, de pronto se encuentra cargado de un increíble poder para moverse a increíbles velocidades. Mientras Barry siempre ha tenido el alma de un héroe, sus nuevos poderes le han dado la capacidad de actuar como tal.",6,"https://www.youtube.com/watch?v=_l9HkDJnwLw"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (11, "The Big Bang Theory", "/posters/11.jpeg", "Leonard y Sheldon son dos físicos que comparten trabajo y apartamento. La serie comienza con la mudanza de Penny, su nueva y atractiva vecina, y hace hincapié en la dificultad de los físicos para relacionarse con personas fuera de su entorno para dar lugar a situaciones cómicas.",12, "https://www.youtube.com/watch?v=_uQXxvZ3afQ"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (12, "Friends", "/posters/12.jpeg", "'Friends' narra las aventuras y desventuras de seis jóvenes de Nueva York: Rachel, Monica, Phoebe, Ross, Chandler y Joey. Ellos forman una unida pandilla de amigos que viven en Manhattan y que suelen reunirse en sus apartamentos o en su bar habitual cafetería, el Central Perk. A pesar de los numerosos cambios que se producen en sus vidas, su amistad es inquebrantable en la dura batalla por salir adelante en sus periplos profesionales y personales.",10, "https://www.youtube.com/watch?v=ki6Mbtnl_9I"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (13, "Anne with an 'E'", "/posters/13.jpeg", "Anne Shirley es una niña huérfana que vive en un pequeño pueblo llamado Avonlea que pertenece a la Isla del Príncipe Eduardo, en el año 1890. Después de una infancia difícil, donde fue pasando de orfanato a hogares de acogida, es enviada por error a vivir con una solterona y su hermano. Cuando cumple 13 años, Anne va a conseguir transformar su vida y el pequeño pueblo donde vive gracias a su fuerte personalidad, intelecto e imaginación. Basada en la inolvidable novela.",2, "https://www.youtube.com/watch?v=VRe5XeXs1i8"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (14, "Expedientes Secretos 'X'", "/posters/14.jpeg", "Fox Mulder y Dana Scully son dos investigadores del FBI que investigan casos sin resolución ni explicación, ya sea por razones paranormales (espíritus, criaturas extrañas, aliens...) ya porque el gobierno se ha encargado de ocultar todo tipo de pruebas. Cuando Mulder tenía doce años, su hermana pequeña fue secuestrada por unos desconocidos, aunque él cree que, en realidad, fue abducida por extraterrestres. Tras acabar sus estudios en la universidad de Oxford, ingresó en la Academia de Quantico, donde se ganó el apodo de 'siniestro'",11, "https://www.youtube.com/watch?v=QmrFPaKCh1s"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (15, "Chernobyl", "/posters/15.jpeg", "Sigue «la verdadera historia de una de las peores catástrofes provocadas por el hombre y habla de los valientes hombres y mujeres que se sacrificaron para salvar a Europa de un desastre inimaginable. La miniserie se centra en el desgarrador alcance del desastre de la planta nuclear que ocurrió en Ucrania en abril de 1986, revelando cómo y por qué ocurrió, además contando las sorprendentes y notables historias de los héroes que lucharon y cayeron.",1,"https://www.youtube.com/watch?v=s9APLXM9Ei8"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (16, "Westworld", "/posters/16.jpeg", "'Westworld' es una oscura odisea acerca del amanecer de la conciencia artificial y la evolución del pecado. Situada en la intersección del futuro cercano y el pasado reimaginado, explora un mundo donde cada apetito humano, sin importar cuán noble o depravado, puede ser saciado. Está ambientada en un parque temático futurista dirigido por el Dr. Robert Ford (Anthony Hopkins). Las instalaciones cuentan con androides caracterizados del western americano, y gracias a ellos los visitantes pueden introducirse en cualquier tipo de fantasía por muy oscura que sea.",3, "https://www.youtube.com/watch?v=sey1O3-PJjY"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (17, "Halt and Catch Fire", "/posters/17.jpeg", "Situada en los inicios de la década de 1980, un visionario ficticio, un ingeniero electrónico y una prodigiosa ingeniera, se alían a una programadora de software para confrontar con las corporaciones informáticas dominantes de la época. El Personal de la firma y sus socios de negocio, comenzarán una carrera que cambiará la cultura en el Estado de Texas, cuna de las empresas de tecnología, casi de la misma forma que lo es hoy Silicon Valey. Esta historia ficticia emula el trabajo realizado, en su momento, por la firma Compaq, cuando clonó el BIOS de las Computadoras Personales IBM, dando vida así al económico mercado de los clones. Mostrando también, a lo largo de sus 4 temporadas, el nacimiento de la arquitectura abierta de hardware, los videojuegos online, las salas de chat y de trueque de productos físicos, los BBS, y las primeras nubes computacionales, hasta la llegada de Internet (sin dejar afuera la guerra de los web browsers).",4, "https://www.youtube.com/watch?v=oKxZP-bP5Ww"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (18, "Ava", "/posters/18.jpeg", "Ava es una mortífera asesina a sueldo que trabaja para una organización de operaciones encubiertas, que viaja por todo el mundo acabando con aquellos objetivos que nadie más puede derribar. Cuando uno de sus encargos sale mal, Ava tendrá que luchar por una vida.",0, "https://www.youtube.com/watch?v=ozUuAcGOhPs"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (19, "Aves de presa y la fantabulosa emancipación de una Harley Quinn", "/posters/19.jpeg","Después de separarse de Joker, Harley Quinn y otras tres heroínas (Canario Negro, Cazadora y Renée Montoya) unen sus fuerzas para salvar a una niña (Cassandra Cain) del malvado rey del crimen Máscara Negra.",0, "https://www.youtube.com/watch?v=ogo8AlGVa70"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (20, "Archivo", "/posters/20.jpeg", "2038: George Almore está trabajando en una verdadera IA equivalente a la humana. Su último prototipo está casi listo. Esta fase sensible también es la más arriesgada. Especialmente porque tiene un objetivo que debe ocultarse a toda costa: reunirse con su esposa muerta.",0, "https://www.youtube.com/watch?v=m0J0BwIzURI"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (21, "Jumanji - The next level", "/posters/21.jpeg", "Las aventuras continúan en el fantástico mundo del video juego Jumanji, donde nada es lo que parece. En esta ocasión, los jugadores vuelven al juego, pero sus personajes se han intercambiado entre sí, lo que ofrece un curioso plantel: los mismos héroes con distinta apariencia y habilidades. Pero, ¿dónde está el resto de la gente?",0, "https://www.youtube.com/watch?v=rBxcF-r9Ibs"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (22, "3022", "/posters/22.jpeg", "La película está ambientada en una estación espacial en el futuro. La tripulación sufre un estrés traumático y considera abandonar su misión después de observar lo que creen que es la destrucción de la Tierra. La película se muestra como una serie de flashbacks y flash-forward.", 0, "https://www.youtube.com/watch?v=AGQ7OkmIx4Q"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (23, "IT - Capítulo 2",  "/posters/23.jpeg", "En este segundo capitulo Han pasado 27 años desde que el 'Club de los Perdedores', formado por Bill, Berverly, Richie, Ben, Eddie, Mike y Stanley, se enfrentaran al macabro y despiadado Pennywise (Bill Skarsgård). En cuanto tuvieron oportunidad, abandonaron el pueblo de Derry, en el estado de Maine, que tantos problemas les había ocasionado. Sin embargo, ahora, siendo adultos, parece que no pueden escapar de su pasado. Todos deberán enfrentarse de nuevo al temible payaso para descubrir si de verdad están preparados para superar sus traumas de la infancia.", 0, "https://www.youtube.com/watch?v=o1sQbtZpsic"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (24, "Pantera Negra", "/posters/24.jpeg", "T’Challa (Chadwick Boseman) regresa a su hogar en la apartada nación africana de Wakanda para servir como líder de su país. Tras suceder a su padre en el trono, pasa a convertirse en Pantera Negra, una sigilosa criatura de la noche, con agudos sentidos felinos y otras habilidades como súper fuerza e inteligencia, agilidad, estrategia o maestro del combate sin armas. Es bajo el liderazgo de T’Challa como Wakanda consigue convertirse en una de las naciones más ricas y tecnológicamente avanzadas del planeta.", 0, "https://www.youtube.com/watch?v=JK-wAfAvJ0g"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (25, "Contra lo imposible (Ford versus Ferrari)", "/posters/25.jpeg", "Los ganadores del Premio de la Academia® Matt Damon y Christian Bale protagonizan CONTRA LO IMPOSIBLE, basada en la historia real del visionario diseñador americano de automóviles Carroll Shelby (Damon) y el intrépido piloto británico Ken Miles (Bale). Juntos construyen un nuevo coche de carreras para Ford Motor Company y así enfrentar a Enzo Ferrari en las 24 Horas de Le Mans en Francia en 1966.",0, "https://www.youtube.com/watch?v=SOVb0-2g1Q0"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (26, "Centígrados", "/posters/26.jpeg", "Una joven pareja estadounidense viaja a las montañas árticas de Noruega. Después de detenerse durante una tormenta de nieve, se despiertan atrapados en su SUV, enterrados bajo capas de nieve y hielo.",0, "https://www.youtube.com/watch?v=0RvV7TNUlkQ"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (27, "DOOM: Aniquilación", "/posters/27.jpeg", "Doom: Aniquilación sigue a un grupo de marines espaciales que han respondido a una llamada de alerta de una base en la luna marciana, solo para descubrir que ha sido tomada por criaturas demoníacas que amenazan con desatar el infierno en la tierra.",0, "https://www.youtube.com/watch?v=8e3JKVqb3p4"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (28, "Contagio", "/posters/28.jpeg", "De repente, sin saber cuál es su origen, aunque todo hace sospechar que comienza con el viaje de una norteamericana a un casino de Hong Kong, un virus mortal comienza a propagarse por todo el mundo. En pocos días, la enfermedad empieza a diezmar a la población. El contagio se produce por mero contacto entre los seres humanos. Un thriller realista y sin efectos especiales sobre los efectos de una epidemia.",0, "https://www.youtube.com/watch?v=vh2vybuVgn0"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (29, "Viuda Negra", "/posters/29.jpeg", "Primera pelicula individual de la Viuda Negra en el universo cinematografico de Marvel, contando su historia desde que se inició como doble agente rusa, su niñez, sus misiones, y su actualidad, después de Avengers.",0, "https://www.youtube.com/watch?v=xY1eqVSSuus"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (30, "The Martian", "/posters/30.jpeg", "Durante una misión a Marte de la nave tripulada Ares III, una fuerte tormenta se desata dando por desaparecido y muerto al astronauta Mark Watney (Matt Damon), sus compañeros toman la decisión de irse pero él ha sobrevivido. Está solo y sin apenas recursos en el planeta. Con muy pocos medios deberá recurrir a sus conocimientos, su sentido del humor y un gran instinto de supervivencia para lograr sobrevivir y comunicar a la Tierra que todavía está vivo esperando que acudan en su rescate.",0, "https://www.youtube.com/watch?v=ej3ioOneTy8"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (31, "Ex-Machina", "/posters/31.jpeg", "Un programador multimillonario selecciona a Caleb, un joven empleado de su empresa, para que pase una semana en un lugar remoto con el objetivo de que participe en un test en el que estará involucrada su última creación: un robot-mujer en el que inteligencia artificial lo es todo.",0, "https://www.youtube.com/watch?v=qSwobe3uIII"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (32, "Jurassic World", "/posters/32.jpeg", "Veintidós años después de lo ocurrido en Jurassic Park, la isla Nublar ha sido transformada en un enorme parque temático, Jurassic Wold, con versiones «domesticadas» de algunos de los dinosaurios más conocidos. Cuando todo parece ir sobre ruedas y ser el negocio del siglo, un nuevo dinosaurio de especie desconocida, pues ha sido creado manipulando genéticamente su ADN, y que resulta ser mucho más inteligente de lo que se pensaba, se escapa de su recinto y comienza a causar estragos entre los visitantes del Parque.",0, "https://www.youtube.com/watch?v=nQwt1nlSQ3A"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (33, "Soy leyenda", "/posters/33.jpeg", "Años después de que una plaga mate a la mayoría de la humanidad y transforme al resto en monstruos, el único superviviente en la ciudad de Nueva York lucha valientemente para encontrar una cura.",0, "https://www.youtube.com/watch?v=TXQ7kRnFXS4"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (34, "El primer hombre en la luna", "/posters/34.jpeg", "Cuenta la historia de la misión de la NASA que llevó al primer hombre a la luna, centrada en Neil Armstrong (interpretado por Ryan Gosling) y el periodo comprendido entre los años 1961 y 1969. Un relato en primera persona, basado en la novela de James R. Hansen, que explora el sacrificio y el precio que representó, tanto para Armstrong como para Estados Unidos, una de las misiones más peligrosas de la historia.",0, "https://www.youtube.com/watch?v=JnISFkVs4Q0"); 
INSERT INTO Audiovisual (id, titulo, poster, resumen, temporadas, trailer) VALUES (35, "Titanes del pacífico - La insurrección", "/posters/35.jpeg", "Han pasado 10 años tras la primera invasión que sufrió la humanidad, pero la lucha aún no ha terminado. El planeta vuelve a ser asediado por los Kaiju, una raza de alienígenas colosales, que emergen desde un portal interdimensional con el objetivo de destruir a la raza humana. Ante esta nueva amenaza, los Jaegers, robots gigantes de guerra pilotados por dos personas para sobrellevar la inmensa carga neuronal que conlleva manipularlos, ya no están a la altura de lo que se les viene encima. Será entonces cuando los supervivientes de la primera invasión, además de nuevos personajes como el hijo de Pentecost, tendrán que idear la manera de sorprender al enorme enemigo, apostando por nuevas estrategias defensivas y de ataque. Con la Tierra en ruinas e intentando reconstruirse, esta nueva batalla puede ser decisiva para el futuro.",0, "https://www.youtube.com/watch?v=CBqnX__3RwE"); 

-- CARGA DE DATOS EN LA TABLA CATEGORIAS --

INSERT INTO Categorias (id, tipo) VALUES ( 1, "Serie" );
INSERT INTO Categorias (id, tipo) VALUES ( 2, "Pelicula" );

-- CARGA DE DATOS EN LA TABLA GENEROS--

INSERT INTO Generos (id, clasificacion) VALUES (1, "Ciencia Ficción"); 
INSERT INTO Generos (id, clasificacion) VALUES (2, "Fantasía"); 
INSERT INTO Generos (id, clasificacion) VALUES (3, "Drama"); 
INSERT INTO Generos (id, clasificacion) VALUES (4, "Ficción"); 
INSERT INTO Generos (id, clasificacion) VALUES (5, "Sucesos"); 
INSERT INTO Generos (id, clasificacion) VALUES (6, "Misterio"); 
INSERT INTO Generos (id, clasificacion) VALUES (7, "Hechos verídicos"); 
INSERT INTO Generos (id, clasificacion) VALUES (8, "Crimen"); 
INSERT INTO Generos (id, clasificacion) VALUES (9, "Suspenso"); 
INSERT INTO Generos (id, clasificacion) VALUES (10, "Aventura"); 
INSERT INTO Generos (id, clasificacion) VALUES (11, "Acción"); 
INSERT INTO Generos (id, clasificacion) VALUES (12, "Comedia"); 
INSERT INTO Generos (id, clasificacion) VALUES (13, "Familia"); 
INSERT INTO Generos (id, clasificacion) VALUES (14, "Western"); 
INSERT INTO Generos (id, clasificacion) VALUES (15, "Tecnología"); 
INSERT INTO Generos (id, clasificacion) VALUES (16, "Terror");
INSERT INTO Generos (id, clasificacion) VALUES (17, "Historia"); 
INSERT INTO Generos (id, clasificacion) VALUES (18, "Intriga"); 

-- CARGA DE DATOS EN LA TABLA ACTORES --

INSERT INTO Actores (id, nombreApellido) VALUES (1, "Pedro Pascal");
INSERT INTO Actores (id, nombreApellido) VALUES (2, "Carl Weathers");
INSERT INTO Actores (id, nombreApellido) VALUES (3, "Misty Rosas");
INSERT INTO Actores (id, nombreApellido) VALUES (4, "Chris Bartlett");
INSERT INTO Actores (id, nombreApellido) VALUES (5, "Rio Hackford");
INSERT INTO Actores (id, nombreApellido) VALUES (6, "Giancarlo Esposito");
INSERT INTO Actores (id, nombreApellido) VALUES (7, "Tom Hopper");
INSERT INTO Actores (id, nombreApellido) VALUES (8, "David Castañeda");
INSERT INTO Actores (id, nombreApellido) VALUES (9, "Emmy Raver-Lampman");
INSERT INTO Actores (id, nombreApellido) VALUES (10, "Robert Sheehan");
INSERT INTO Actores (id, nombreApellido) VALUES (11, "Aidan Gallagher");
INSERT INTO Actores (id, nombreApellido) VALUES (12, "Elliot Page");
INSERT INTO Actores (id, nombreApellido) VALUES (13, "Anya Taylor-Joy");
INSERT INTO Actores (id, nombreApellido) VALUES (14, "Thomas Brodie-Sangster");
INSERT INTO Actores (id, nombreApellido) VALUES (15, "Harry Melling");
INSERT INTO Actores (id, nombreApellido) VALUES (16, "Moses Ingram");
INSERT INTO Actores (id, nombreApellido) VALUES (17, "Chloe Pirrie");
INSERT INTO Actores (id, nombreApellido) VALUES (18, "Janina Elkin");
INSERT INTO Actores (id, nombreApellido) VALUES (19, "Lili Reinhart");
INSERT INTO Actores (id, nombreApellido) VALUES (20, "Casey Cott");
INSERT INTO Actores (id, nombreApellido) VALUES (21, "Camila Mendes");
INSERT INTO Actores (id, nombreApellido) VALUES (22, "Marisol Nichols");
INSERT INTO Actores (id, nombreApellido) VALUES (23, "Madelaine Petsch");
INSERT INTO Actores (id, nombreApellido) VALUES (24, "Mädchen Amick");
INSERT INTO Actores (id, nombreApellido) VALUES (25, "Claire Fox");
INSERT INTO Actores (id, nombreApellido) VALUES (26, "Olivia Colman");
INSERT INTO Actores (id, nombreApellido) VALUES (27, "Matt Smith");
INSERT INTO Actores (id, nombreApellido) VALUES (28, "Tobias Menzies");
INSERT INTO Actores (id, nombreApellido) VALUES (29, "Vanesa Kirby");
INSERT INTO Actores (id, nombreApellido) VALUES (30, "Helena Bonham Carter");
INSERT INTO Actores (id, nombreApellido) VALUES (31, "Millie Bobby Brown");
INSERT INTO Actores (id, nombreApellido) VALUES (32, "Henry Cavill");
INSERT INTO Actores (id, nombreApellido) VALUES (33, "Sam Claflin");
INSERT INTO Actores (id, nombreApellido) VALUES (34, "Louis Partridge");
INSERT INTO Actores (id, nombreApellido) VALUES (35, "Adeel Akhtar");
INSERT INTO Actores (id, nombreApellido) VALUES (36, "Joaquin Phoenix");
INSERT INTO Actores (id, nombreApellido) VALUES (37, "Robert De Niro");
INSERT INTO Actores (id, nombreApellido) VALUES (38, "Zazie Beetz");
INSERT INTO Actores (id, nombreApellido) VALUES (39, "Frances Conroy");
INSERT INTO Actores (id, nombreApellido) VALUES (40, "Brett Cullen");
INSERT INTO Actores (id, nombreApellido) VALUES (41, "Shea Whigham");
INSERT INTO Actores (id, nombreApellido) VALUES (42, "Robert Downey Jr.");
INSERT INTO Actores (id, nombreApellido) VALUES (43, "Chris Evans");
INSERT INTO Actores (id, nombreApellido) VALUES (44, "Mark Ruffalo");
INSERT INTO Actores (id, nombreApellido) VALUES (45, "Chris Hemsworth");
INSERT INTO Actores (id, nombreApellido) VALUES (46, "Scarlett Johansson");
INSERT INTO Actores (id, nombreApellido) VALUES (47, "Jeremy Renner");
INSERT INTO Actores (id, nombreApellido) VALUES (48, "Emilia Clarke");
INSERT INTO Actores (id, nombreApellido) VALUES (49, "Lena Headey");
INSERT INTO Actores (id, nombreApellido) VALUES (50, "Sophie Turner");
INSERT INTO Actores (id, nombreApellido) VALUES (51, "Kit Harington");
INSERT INTO Actores (id, nombreApellido) VALUES (52, "Peter Dinklage");
INSERT INTO Actores (id, nombreApellido) VALUES (53, "Nikolaj Coster-Waldau");
INSERT INTO Actores (id, nombreApellido) VALUES (54, "Grant Gustin");
INSERT INTO Actores (id, nombreApellido) VALUES (55, "Carlos Valdes");
INSERT INTO Actores (id, nombreApellido) VALUES (56, "Danielle Panabaker");
INSERT INTO Actores (id, nombreApellido) VALUES (57, "Candice Patton");
INSERT INTO Actores (id, nombreApellido) VALUES (58, "Jesse L. Martin");
INSERT INTO Actores (id, nombreApellido) VALUES (59, "Tom Cavanagh");
INSERT INTO Actores (id, nombreApellido) VALUES (60, "Jim Parsons");
INSERT INTO Actores (id, nombreApellido) VALUES (61, "Johnny Galecki");
INSERT INTO Actores (id, nombreApellido) VALUES (62, "Kaley Cuoco");
INSERT INTO Actores (id, nombreApellido) VALUES (63, "Simon Helberg");
INSERT INTO Actores (id, nombreApellido) VALUES (64, "Kunal Nayyar");
INSERT INTO Actores (id, nombreApellido) VALUES (65, "Melissa Rauch");
INSERT INTO Actores (id, nombreApellido) VALUES (66, "Mayim Bialik");
INSERT INTO Actores (id, nombreApellido) VALUES (67, "Jennifer Aniston");
INSERT INTO Actores (id, nombreApellido) VALUES (68, "Courteney Cox");
INSERT INTO Actores (id, nombreApellido) VALUES (69, "Lisa Kudrow");
INSERT INTO Actores (id, nombreApellido) VALUES (70, "David Schwimmer");
INSERT INTO Actores (id, nombreApellido) VALUES (71, "Matthew Perry");
INSERT INTO Actores (id, nombreApellido) VALUES (72, "Matt LeBlanc");
INSERT INTO Actores (id, nombreApellido) VALUES (73, "Amybeth McNulty");
INSERT INTO Actores (id, nombreApellido) VALUES (74, "Geraldine James");
INSERT INTO Actores (id, nombreApellido) VALUES (75, "R. H. Thomson");
INSERT INTO Actores (id, nombreApellido) VALUES (76, "Corrine Koslo");
INSERT INTO Actores (id, nombreApellido) VALUES (77, "Dalila Bela");
INSERT INTO Actores (id, nombreApellido) VALUES (78, "Lucas Jade Zumann");
INSERT INTO Actores (id, nombreApellido) VALUES (79, "Gillian Anderson");
INSERT INTO Actores (id, nombreApellido) VALUES (80, "David Duchovny");
INSERT INTO Actores (id, nombreApellido) VALUES (81, "Mitch Pileggi");
INSERT INTO Actores (id, nombreApellido) VALUES (82, "Robert Patrick");
INSERT INTO Actores (id, nombreApellido) VALUES (83, "Tom Braidwood");
INSERT INTO Actores (id, nombreApellido) VALUES (84, "Bruce Harwood");
INSERT INTO Actores (id, nombreApellido) VALUES (85, "Jared Harris");
INSERT INTO Actores (id, nombreApellido) VALUES (86, "Stellan Skarsgård");
INSERT INTO Actores (id, nombreApellido) VALUES (87, "Emily Watson");
INSERT INTO Actores (id, nombreApellido) VALUES (88, "Paul Ritter");
INSERT INTO Actores (id, nombreApellido) VALUES (89, "Jessie Buckley");
INSERT INTO Actores (id, nombreApellido) VALUES (90, "Adam Nagaitis");
INSERT INTO Actores (id, nombreApellido) VALUES (91, "Evan Rachel Wood");
INSERT INTO Actores (id, nombreApellido) VALUES (92, "Thandie Newton");
INSERT INTO Actores (id, nombreApellido) VALUES (93, "Jeffrey Wright");
INSERT INTO Actores (id, nombreApellido) VALUES (94, "Tessa Thompson");
INSERT INTO Actores (id, nombreApellido) VALUES (95, "Ed Harris");
INSERT INTO Actores (id, nombreApellido) VALUES (96, "Luke Hemsworth");
INSERT INTO Actores (id, nombreApellido) VALUES (97, "Lee Pace");
INSERT INTO Actores (id, nombreApellido) VALUES (98, "Scoot McNairy");
INSERT INTO Actores (id, nombreApellido) VALUES (99, "Mackenzie Davis");
INSERT INTO Actores (id, nombreApellido) VALUES (100, "Kerry Bishé");
INSERT INTO Actores (id, nombreApellido) VALUES (101, "Toby Huss");
INSERT INTO Actores (id, nombreApellido) VALUES (102, "Alana Cavanaugh");
INSERT INTO Actores (id, nombreApellido) VALUES (103, "Jessica Chastain");
INSERT INTO Actores (id, nombreApellido) VALUES (104, "John Malkovich");
INSERT INTO Actores (id, nombreApellido) VALUES (105, "Colin Farrell");
INSERT INTO Actores (id, nombreApellido) VALUES (106, "Common");
INSERT INTO Actores (id, nombreApellido) VALUES (107, "Geena Davis");
INSERT INTO Actores (id, nombreApellido) VALUES (108, "Ioan Gruffudd");
INSERT INTO Actores (id, nombreApellido) VALUES (109, "Margot Robbie");
INSERT INTO Actores (id, nombreApellido) VALUES (110, "Ewan McGregor");
INSERT INTO Actores (id, nombreApellido) VALUES (111, "Mary Elizabeth Winstead");
INSERT INTO Actores (id, nombreApellido) VALUES (112, "Jurnee Smollett");
INSERT INTO Actores (id, nombreApellido) VALUES (113, "Rosie Perez");
INSERT INTO Actores (id, nombreApellido) VALUES (114, "Chris Messina");
INSERT INTO Actores (id, nombreApellido) VALUES (115, "Stacy Martin");
INSERT INTO Actores (id, nombreApellido) VALUES (116, "Rhona Mitra");
INSERT INTO Actores (id, nombreApellido) VALUES (117, "Theo James");
INSERT INTO Actores (id, nombreApellido) VALUES (118, "Peter Ferdinando");
INSERT INTO Actores (id, nombreApellido) VALUES (119, "Lia Williams");
INSERT INTO Actores (id, nombreApellido) VALUES (120, "Toby Jones");
INSERT INTO Actores (id, nombreApellido) VALUES (121, "Dwayne Johnson");
INSERT INTO Actores (id, nombreApellido) VALUES (122, "Kevin Hart");
INSERT INTO Actores (id, nombreApellido) VALUES (123, "Jack Black");
INSERT INTO Actores (id, nombreApellido) VALUES (124, "Karen Gillan");
INSERT INTO Actores (id, nombreApellido) VALUES (125, "Awkwafina");
INSERT INTO Actores (id, nombreApellido) VALUES (126, "Nick Jonas");
INSERT INTO Actores (id, nombreApellido) VALUES (127, "Miranda Cosgrove");
INSERT INTO Actores (id, nombreApellido) VALUES (128, "Kate Walsh");
INSERT INTO Actores (id, nombreApellido) VALUES (129, "Omar Epps");
INSERT INTO Actores (id, nombreApellido) VALUES (130, "Angus Macfadyen");
INSERT INTO Actores (id, nombreApellido) VALUES (131, "Jorja Fox");
INSERT INTO Actores (id, nombreApellido) VALUES (132, "Enver Gjokaj");
INSERT INTO Actores (id, nombreApellido) VALUES (133, "Bill Skarsgård");
INSERT INTO Actores (id, nombreApellido) VALUES (134, "Bill Hader");
INSERT INTO Actores (id, nombreApellido) VALUES (135, "James McAvoy");
INSERT INTO Actores (id, nombreApellido) VALUES (136, "Isaiah Mustafa");
INSERT INTO Actores (id, nombreApellido) VALUES (137, "Jay Ryan");
INSERT INTO Actores (id, nombreApellido) VALUES (138, "Chadwick Boseman");
INSERT INTO Actores (id, nombreApellido) VALUES (139, "Michael B. Jordan");
INSERT INTO Actores (id, nombreApellido) VALUES (140, "Lupita Nyong'o");
INSERT INTO Actores (id, nombreApellido) VALUES (141, "Danai Gurira");
INSERT INTO Actores (id, nombreApellido) VALUES (142, "Martin Freeman");
INSERT INTO Actores (id, nombreApellido) VALUES (143, "Daniel Kaluuya");
INSERT INTO Actores (id, nombreApellido) VALUES (144, "Christian Bale");
INSERT INTO Actores (id, nombreApellido) VALUES (145, "Matt Damon");
INSERT INTO Actores (id, nombreApellido) VALUES (146, "Caitriona Balfe");
INSERT INTO Actores (id, nombreApellido) VALUES (147, "Josh Lucas");
INSERT INTO Actores (id, nombreApellido) VALUES (148, "Noah Jupe");
INSERT INTO Actores (id, nombreApellido) VALUES (149, "Jon Bernthal");
INSERT INTO Actores (id, nombreApellido) VALUES (150, "Génesis Rodríguez");
INSERT INTO Actores (id, nombreApellido) VALUES (151, "Vincent Piazza");
INSERT INTO Actores (id, nombreApellido) VALUES (152, "Benjamin Sokolow");
INSERT INTO Actores (id, nombreApellido) VALUES (153, "Emily Bayiokos");
INSERT INTO Actores (id, nombreApellido) VALUES (154, "Amy Manson");
INSERT INTO Actores (id, nombreApellido) VALUES (155, "Luke Allen-Gale");
INSERT INTO Actores (id, nombreApellido) VALUES (156, "Nina Bergman");
INSERT INTO Actores (id, nombreApellido) VALUES (157, "Dominic Mafham");
INSERT INTO Actores (id, nombreApellido) VALUES (158, "James Weber Brown");
INSERT INTO Actores (id, nombreApellido) VALUES (159, "Lorina Kamburova");
INSERT INTO Actores (id, nombreApellido) VALUES (160, "Marion Cotillard");
INSERT INTO Actores (id, nombreApellido) VALUES (161, "Laurence Fishburne");
INSERT INTO Actores (id, nombreApellido) VALUES (162, "Jude Law");
INSERT INTO Actores (id, nombreApellido) VALUES (163, "Kate Winslet");
INSERT INTO Actores (id, nombreApellido) VALUES (164, "Jennifer Ehle");
INSERT INTO Actores (id, nombreApellido) VALUES (165, "Gwyneth Paltrow");
INSERT INTO Actores (id, nombreApellido) VALUES (166, "Florence Pugh");
INSERT INTO Actores (id, nombreApellido) VALUES (167, "David Harbour");
INSERT INTO Actores (id, nombreApellido) VALUES (168, "O.T. Fagbenle");
INSERT INTO Actores (id, nombreApellido) VALUES (169, "Rachel Weisz");
INSERT INTO Actores (id, nombreApellido) VALUES (170, "William Hurt");
INSERT INTO Actores (id, nombreApellido) VALUES (171, "Ray Winstone");
INSERT INTO Actores (id, nombreApellido) VALUES (172, "Kristen Wiig");
INSERT INTO Actores (id, nombreApellido) VALUES (173, "Jeff Daniels");
INSERT INTO Actores (id, nombreApellido) VALUES (174, "Michael Peña");
INSERT INTO Actores (id, nombreApellido) VALUES (175, "Sean Bean");
INSERT INTO Actores (id, nombreApellido) VALUES (176, "Kate Mara");
INSERT INTO Actores (id, nombreApellido) VALUES (177, "Alicia Vikander");
INSERT INTO Actores (id, nombreApellido) VALUES (178, "Domhnall Gleeson");
INSERT INTO Actores (id, nombreApellido) VALUES (179, "Oscar Isaac");
INSERT INTO Actores (id, nombreApellido) VALUES (180, "Sonoya Mizuno");
INSERT INTO Actores (id, nombreApellido) VALUES (181, "Corey Johnson");
INSERT INTO Actores (id, nombreApellido) VALUES (182, "Claire Selby");
INSERT INTO Actores (id, nombreApellido) VALUES (183, "Gana Bayarsaikhan");
INSERT INTO Actores (id, nombreApellido) VALUES (184, "Bryce Dallas Howard");
INSERT INTO Actores (id, nombreApellido) VALUES (185, "Chris Pratt");
INSERT INTO Actores (id, nombreApellido) VALUES (186, "Irrfan Khan");
INSERT INTO Actores (id, nombreApellido) VALUES (187, "Vincent D'Onofrio");
INSERT INTO Actores (id, nombreApellido) VALUES (188, "Omar Sy");
INSERT INTO Actores (id, nombreApellido) VALUES (189, "Nick Robinson");
INSERT INTO Actores (id, nombreApellido) VALUES (190, "Judy Greer");
INSERT INTO Actores (id, nombreApellido) VALUES (191, "Will Smith");
INSERT INTO Actores (id, nombreApellido) VALUES (192, "Alice Braga");
INSERT INTO Actores (id, nombreApellido) VALUES (193, "Charlie Tahan");
INSERT INTO Actores (id, nombreApellido) VALUES (194, "Dash Mihok");
INSERT INTO Actores (id, nombreApellido) VALUES (195, "Salli Richardson-Whitfield");
INSERT INTO Actores (id, nombreApellido) VALUES (196, "Willow Smith");
INSERT INTO Actores (id, nombreApellido) VALUES (197, "Emma Thompson");
INSERT INTO Actores (id, nombreApellido) VALUES (198, "Ryan Gosling");
INSERT INTO Actores (id, nombreApellido) VALUES (199, "Claire Foy");
INSERT INTO Actores (id, nombreApellido) VALUES (200, "Jason Clarke");
INSERT INTO Actores (id, nombreApellido) VALUES (201, "Kyle Chandler");
INSERT INTO Actores (id, nombreApellido) VALUES (202, "Corey Stoll");
INSERT INTO Actores (id, nombreApellido) VALUES (203, "Patrick Fugit");
INSERT INTO Actores (id, nombreApellido) VALUES (204, "John Boyega");
INSERT INTO Actores (id, nombreApellido) VALUES (205, "Scott Eastwood");
INSERT INTO Actores (id, nombreApellido) VALUES (206, "Cailee Spaeny");
INSERT INTO Actores (id, nombreApellido) VALUES (207, "Jing Tian");
INSERT INTO Actores (id, nombreApellido) VALUES (208, "Rinko Kikuchi");
INSERT INTO Actores (id, nombreApellido) VALUES (209, "Burn Gorman");


-- CARGA DE DATOS EN LA TABLA AUDIOVISUALxCATEGORIA --

INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (1, 1);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (2, 1);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (3, 1); 
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (4, 1);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (5, 1);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (6, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (7, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (8, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (9, 1);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (10, 1);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (11, 1);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (12, 1);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (13, 1);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (14, 1);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (15, 1);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (16, 1);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (17, 1);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (18, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (19, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (20, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (21, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (22, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (23, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (24, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (25, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (26, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (27, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (28, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (29, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (30, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (31, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (32, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (33, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (34, 2);
INSERT INTO AudiovisualxCategorias (idaudiovisual, idcategoria) VALUES (35, 2);


-- CARGA DE DATOS EN LA TABLA AUDIOVISUALxGENEROS --

INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (1, 3);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (1, 7);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (2, 3);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (2, 4);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (2, 6);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (3, 1);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (3, 2);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (4, 1);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (4, 2);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (5, 3);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (5, 4);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (5, 5);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (6, 3);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (6, 4);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (6, 6);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (7, 3);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (7, 8);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (7, 9);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (8, 10);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (8, 1);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (8, 12);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (9, 2);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (9, 3);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (9, 10);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (10, 1);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (10, 2);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (11, 2);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (11, 4);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (11, 13);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (12, 3);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (12, 13);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (12, 14);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (13, 3);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (13, 14);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (13, 15);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (14, 1);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (14, 2);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (15, 3);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (15, 7);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (16, 1);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (16, 15);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (17, 3);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (17, 4);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (17, 16);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (18, 3);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (18, 9);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (18, 12);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (19, 4);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (19, 12);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (19, 13);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (20, 9);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (20, 1);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (20, 12);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (21, 4);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (21, 10);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (21, 13);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (22, 1);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (22, 9);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (23, 2);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (23, 9);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (23, 17);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (24, 2);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (24, 10);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (24, 12);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (25, 3);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (25, 10);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (25, 18);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (26, 3);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (26, 9);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (26, 18);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (27, 1);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (27, 11);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (27, 16);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (28, 3);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (28, 4);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (28, 9);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (29, 3);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (29, 10);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (29, 11);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (30, 1);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (30, 3);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (30, 10);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (31, 1);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (31, 3);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (31, 9);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (32, 4);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (32, 9);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (32, 10);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (33, 3);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (33, 4);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (33, 16);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (34, 3);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (34, 7);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (35, 1);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (35, 2);
INSERT INTO AudiovisualxGeneros (idaudiovisual, idgenero) VALUES (35, 11);

-- CARGA DE DATOS EN LA TABLA AUDIOVISUALxACTORES--

INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (1, 25);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (1, 26);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (1, 27);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (1, 28);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (1, 29);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (1, 30);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (2, 19);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (2, 20);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (2, 21);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (2, 22);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (2, 23);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (2, 24);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (3, 1);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (3, 2);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (3, 3);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (3, 4);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (3, 5);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (3, 6);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (4, 7);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (4, 8);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (4, 9);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (4, 10);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (4, 11);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (4, 12);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (5, 13);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (5, 14);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (5, 15);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (5, 16);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (5, 17);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (5, 18);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (6, 31);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (6, 32);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (6, 33);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (6, 30);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (6, 34);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (6, 35);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (7, 36);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (7, 37);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (7, 38);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (7, 39);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (7, 40);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (7, 41);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (8, 42);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (8, 43);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (8, 44);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (8, 45);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (8, 46);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (8, 47);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (9, 48);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (9, 49);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (9, 50);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (9, 51);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (9, 52);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (9, 53);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (10, 54);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (10, 55);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (10, 56);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (10, 57);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (10, 58);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (10, 59);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (11, 60);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (11, 61);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (11, 62);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (11, 63);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (11, 64);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (11, 65);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (11, 66);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (12, 67);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (12, 68);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (12, 69);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (12, 70);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (12, 71);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (12, 72);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (13, 73);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (13, 74);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (13, 75);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (13, 76);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (13, 77);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (13, 78);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (14, 79);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (14, 80);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (14, 81);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (14, 82);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (14, 83);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (14, 84);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (15, 85);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (15, 86);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (15, 87);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (15, 88);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (15, 89);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (15, 90);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (16, 91);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (16, 92);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (16, 93);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (16, 94);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (16, 95);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (16, 96);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (17, 97);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (17, 98);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (17, 99);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (17, 100);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (17, 101);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (17, 102);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (18, 103);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (18, 104);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (18, 105);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (18, 106);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (18, 107);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (18, 108);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (19, 109);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (19, 110);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (19, 111);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (19, 112);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (19, 113);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (19, 114);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (20, 115);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (20, 116);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (20, 117);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (20, 118);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (20, 119);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (20, 120);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (21, 121);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (21, 122);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (21, 123);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (21, 124);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (21, 125);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (21, 126);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (22, 127);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (22, 128);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (22, 129);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (22, 130);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (22, 131);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (22, 132);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (23, 133);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (23, 103);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (23, 134);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (23, 135);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (23, 136);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (23, 137);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (24, 138);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (24, 139);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (24, 140);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (24, 141);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (24, 142);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (24, 143);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (25, 144);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (25, 145);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (25, 146);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (25, 147);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (25, 148);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (25, 149);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (26, 150);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (26, 151);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (26, 152);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (26, 153);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (27, 154);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (27, 155);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (27, 156);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (27, 157);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (27, 158);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (27, 159);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (28, 160);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (28, 145);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (28, 161);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (28, 162);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (28, 163);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (28, 164);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (28, 165);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (29, 46);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (29, 166);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (29, 167);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (29, 168);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (29, 169);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (29, 170);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (29, 171);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (30, 145);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (30, 103);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (30, 172);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (30, 173);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (30, 174);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (30, 175);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (30, 176);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (31, 177);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (31, 178);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (31, 179);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (31, 180);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (31, 181);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (31, 182);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (31, 183);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (32, 184);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (32, 185);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (32, 186);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (32, 187);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (32, 188);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (32, 189);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (32, 190);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (33, 191);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (33, 192);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (33, 193);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (33, 194);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (33, 195);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (33, 196);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (33, 197);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (34, 198);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (34, 199);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (34, 200);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (34, 201);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (34, 202);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (34, 203);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (35, 204);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (35, 205);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (35, 206);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (35, 207);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (35, 208);
INSERT INTO AudiovisualxActores (idaudiovisual, idactor) VALUES (35, 209);