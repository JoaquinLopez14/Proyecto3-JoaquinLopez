# *API REST TRAILERFLIX* 
### Proyecto final de Argentina Programa 4.0

## Introducción
#### Como usar este programa

1. Instalación
    1. Base de datos
    2. Archivo .env
    3. Dependencias 
2. Catalogo
3. Generos
4. Categorias
5. Ejemplos

## 1 - ***Instalación***
#### 1.1 En tu MYSQL Workbench ejecuta el archivo "trailerflix.sql" que se encuentra en la carpeta *"conexion"*.

#### 1.2 Luego crea un archivo llamado *".env"* en la carpeta raiz del proyecto con el siguiente codigo.
```javascript
    DB_SCHEMA = trailerflix
    DB_USER = root
    DB_PASSWORD = conexluffy14
    DB_HOST = localhost
```

#### 1.3 Una vez hecho todo lo anterior, abre una terminal en la carpeta raiz del proyecto y ejecuta el siguiente comando.
```
    npm install
```
#### Luego podras iniciar el servidor y probar las rutas HTTP escribiendo el siguiente comando en la terminal.
```
    npm start
```
#### O si lo prefieres
```
    node index.js
```

---
---

## 2 - ***Catalogo***
#### Estas son las rutas para probar solicitudes HTTP referidas a la vista Catalogo.
#### En la carpeta *"Controladores"* podras leer mas informacion sobre esta vista SQL.

### Rutas Catalogo
| Catalogo |  URL | Resultado |
|----------|:----:|:---------:|
|   GET    |http://localhost:3000/catalogo| Muestra todas las series y peliculas|
|   GET    |http://localhost:3000/catalogo/:id| Muestra una serie o pelicula por su ID|
|   GET    |http://localhost:3000/catalogo/categoria/:categoria| Muestra las series y peliculas segun su categoria
|   GET    |http://localhost:3000/catalogo/generos/:generos| Muestra las series y peliculas segun su genero
|   GET    |http://localhost:3000/catalogo/nombre/:nombre| Muestra las series y peliculas por parte de su nombre

---
---

## 3 - ***Generos***
#### Estas son las rutas para probar solicitudes HTTP referidas a la tabla Generos.
#### En la carpeta *"Controladores"* podras leer mas informacion sobre esta tabla.

### Rutas Generos
| Generos  |  URL | Resultado |
|----------|:----:|:---------:|
|   GET    |http://localhost:3000/generos| Muestra todas los generos
|   POST   |http://localhost:3000/generos/generos| Añade un nuevo genero
|  DELETE  |http://localhost:3000/generos/generos/:id| Elimina un genero

---
---
## 4 - ***Categorias***
#### Estas son las rutas para probar solicitudes HTTP referidas a la tabla Categorias.
#### En la carpeta *"Controladores*" podras leer mas informacion sobre esta tabla.

### Rutas Categorias

|Categorias|  URL | Resultado|
|----------|------|-----------|
|   GET    | http://localhost:3000/categorias | Muestra todas las categorias
|   POST   | http://localhost:3000/categorias/categorias | Añade una nueva categoria
|   DELETE | http://localhost:3000/categorias/categorias/:id | Elimina una categoria

---
---

## 5 - ***Ejemplos***
## Metodos GET 
#### Las consultas tipo GET devuelven una respuesta en formato JSON.
#### Por ejemplo, usemos la ruta para ver todas las series y peliculas

```
http://localhost:3000/catalogo
```

#### Devolvera lo siguiente 

```json
{
   "id":1,
   "poster":"http://localhost:3000/img/posters/1.jpg",
   "resumen":"Este drama narra las rivalidades politicas y el romance de la reina Isabel II, asi como los sucesos que moldearon la segunda mitad del siglo XX.",
   "temporadas":4,
   "titulo":"The Crown",
   "trailer":null,
   "categoria":"Serie",
   "generos":"Drama, Hechos veridicos",
   "actores":"Claire Foy, Olivia Colman, Matt Smith, Tobias Menzies, Vanessa Kirby, Helena Bonham Carter"
},
{
   "id":2,
   "poster":"http://localhost:3000/img/posters/2.jpg",
   "resumen":"El paso a la edad adulta incluye sexo, romance, escuela y familia. Para Archie y sus amigos, tambien hay misterios oscuros.",
   "temporadas":5,
   "titulo":"Riverdale",
   "trailer":null,
   "categoria":"Serie",
   "generos":"Drama, Ficcion, Misterio",
   "actores":"Lili Reinhart, Casey Cott, Camila Mendes, Marisol Nichols, Madelaine Petsch, Madchen Amick"
}
```

#### Y asi con el resto del JSON.
#### Este metodo *GET* solo sirve para *VER* contenido

---

### Mas ejemplos...

---

### Buscar una serie o pelicula por su ID

```
http://localhost:3000/catalogo/:id
```
#### Devolvera poniendo un numero en ":id" en este caso 5

```
{
  "id": 5,
  "titulo": "Gambito de Dama",
  "poster": "/posters/5.jpeg",
  "resumen": "En los cincuenta, una joven de un orfanato descubre que tiene un increíble don para el ajedrez y recorre el arduo camino a la fama mientras lucha contra las adicciones.",
  "temporadas": 1,
  "categoria": "Serie",
  "generos": "Drama, Ficción, Sucesos",
  "reparto": "Anya Taylor-Joy, Chloe Pirrie, Harry Melling, Janina Elkin, Moses Ingram, Thomas Brodie-Sangster",
  "trailer": "https://www.youtube.com/watch?v=-BBgzgNgzeQ"
}
```
---
### Buscar una pelicula o serie por su categoria 

http://localhost:3000/catalogo/categoria/:categoria

#### Reemplazamos ":categoria" por "serie" o "pelicula"
#### En este caso pelicula

```
  {
    "id": 6,
    "titulo": "Enola Holmes",
    "poster": "/posters/6.jpeg",
    "resumen": "La hermana menor de Sherlock, descubre que su madre ha desaparecido y se dispone a encontrarla. En su búsqueda, saca a relucir el sabueso que corre por sus venas y se encuentra con una conspiración que gira en torno a un misterioso lord, demostrando que su ilustre hermano no es el único talento en la familia.",
    "temporadas": 0,
    "categoria": "Pelicula",
    "generos": "Drama, Ficción, Misterio",
    "reparto": "Adeel Akhtar, Helena Bonham Carter, Henry Cavill, Louis Partridge, Millie Bobby Brown, Sam Claflin",
    "trailer": "https://www.youtube.com/watch?v=bxG9VN9RrVs"
  },
  {
    "id": 7,
    "titulo": "Guasón",
    "poster": "/posters/7.jpeg",
    "resumen": "Arthur Fleck (Phoenix) es un hombre ignorado por la sociedad, cuya motivación en la vida es hacer reír. Pero una serie de trágicos acontecimientos le llevarán a ver el mundo de otra forma. Película basada en el popular personaje de DC Comics Joker, conocido como archivillano de Batman, pero que en este film tomará un cariz más realista y oscuro.",
    "temporadas": 0,
    "categoria": "Pelicula",
    "generos": "Crimen, Drama, Suspenso",
    "reparto": "Brett Cullen, Frances Conroy, Joaquin Phoenix, Robert De Niro, Shea Whigham, Zazie Beetz",
    "trailer": "https://www.youtube.com/watch?v=TobNCFMK_bs"
  },

```
---
### Buscamos una serie o pelicula por su genero

http://localhost:3000/catalogo/generos/:generos

#### Reemplazamos ":generos" por algun genero
#### En este caso "Accion"

```
{
    "id": 27,
    "titulo": "DOOM: Aniquilación",
    "poster": "/posters/27.jpeg",
    "resumen": "Doom: Aniquilación sigue a un grupo de marines espaciales que han respondido a una llamada de alerta de una base en la luna marciana, solo para descubrir que ha sido tomada por criaturas demoníacas que amenazan con desatar el infierno en la tierra.",
    "temporadas": 0,
    "categoria": "Pelicula",
    "generos": "Acción, Ciencia Ficción, Terror",
    "reparto": "Amy Manson, Dominic Mafham, James Weber Brown, Lorina Kamburova, Luke Allen-Gale, Nina Bergman",
    "trailer": "https://www.youtube.com/watch?v=8e3JKVqb3p4"
  },
  {
    "id": 29,
    "titulo": "Viuda Negra",
    "poster": "/posters/29.jpeg",
    "resumen": "Primera pelicula individual de la Viuda Negra en el universo cinematografico de Marvel, contando su historia desde que se inició como doble agente rusa, su niñez, sus misiones, y su actualidad, después de Avengers.",
    "temporadas": 0,
    "categoria": "Pelicula",
    "generos": "Acción, Aventura, Drama",
    "reparto": "David Harbour, Florence Pugh, O.T. Fagbenle, Rachel Weisz, Ray Winstone, Scarlett Johansson, William Hurt",
    "trailer": "https://www.youtube.com/watch?v=xY1eqVSSuus"
  },
```
---
### Buscamos una serie o pelicula por parte de su titulo
```
http://localhost:3000/catalogo/nombre/:nombre
```
#### Reemplazamos ":nombre" por cualquier silaba o palabra entera
#### En este caso usaremos " la "

```
{
    "id": 4,
    "titulo": "The Umbrella Academy",
    "poster": "/posters/4.jpeg",
    "resumen": "La muerte de su padre reúne a unos hermanos distanciados y con extraordinarios poderes que descubren impactantes secretos y una amenaza que se cierne sobre la humanidad.",
    "temporadas": 1,
    "categoria": "Serie",
    "generos": "Ciencia Ficción, Fantasía",
    "reparto": "Aidan Gallagher, David Castañeda, Elliot Page, Emmy Raver-Lampman, Robert Sheehan, Tom Hopper",
    "trailer": "https://www.youtube.com/watch?v=KHucKOK-Vik"
  },
  {
    "id": 6,
    "titulo": "Enola Holmes",
    "poster": "/posters/6.jpeg",
    "resumen": "La hermana menor de Sherlock, descubre que su madre ha desaparecido y se dispone a encontrarla. En su búsqueda, saca a relucir el sabueso que corre por sus venas y se encuentra con una conspiración que gira en torno a un misterioso lord, demostrando que su ilustre hermano no es el único talento en la familia.",
    "temporadas": 0,
    "categoria": "Pelicula",
    "generos": "Drama, Ficción, Misterio",
    "reparto": "Adeel Akhtar, Helena Bonham Carter, Henry Cavill, Louis Partridge, Millie Bobby Brown, Sam Claflin",
    "trailer": "https://www.youtube.com/watch?v=bxG9VN9RrVs"
  },
```

#### Arrojo esta respuesta ya que en "The Umbrella Academy" se encuentra la silaba " la ", lo mismo para "Enola Holmes"

#### Si lo probamos con " con " arroja :

```
{
    "id": 25,
    "titulo": "Contra lo imposible (Ford versus Ferrari)",
    "poster": "/posters/25.jpeg",
    "resumen": "Los ganadores del Premio de la Academia® Matt Damon y Christian Bale protagonizan CONTRA LO IMPOSIBLE, basada en la historia real del visionario diseñador americano de automóviles Carroll Shelby (Damon) y el intrépido piloto británico Ken Miles (Bale). Juntos construyen un nuevo coche de carreras para Ford Motor Company y así enfrentar a Enzo Ferrari en las 24 Horas de Le Mans en Francia en 1966.",
    "temporadas": 0,
    "categoria": "Pelicula",
    "generos": "Aventura, Drama, Intriga",
    "reparto": "Caitriona Balfe, Christian Bale, Jon Bernthal, Josh Lucas, Matt Damon, Noah Jupe",
    "trailer": "https://www.youtube.com/watch?v=SOVb0-2g1Q0"
  },
  {
    "id": 28,
    "titulo": "Contagio",
    "poster": "/posters/28.jpeg",
    "resumen": "De repente, sin saber cuál es su origen, aunque todo hace sospechar que comienza con el viaje de una norteamericana a un casino de Hong Kong, un virus mortal comienza a propagarse por todo el mundo. En pocos días, la enfermedad empieza a diezmar a la población. El contagio se produce por mero contacto entre los seres humanos. Un thriller realista y sin efectos especiales sobre los efectos de una epidemia.",
    "temporadas": 0,
    "categoria": "Pelicula",
    "generos": "Drama, Ficción, Suspenso",
    "reparto": "Gwyneth Paltrow, Jennifer Ehle, Jude Law, Kate Winslet, Laurence Fishburne, Marion Cotillard, Matt Damon",
    "trailer": "https://www.youtube.com/watch?v=vh2vybuVgn0"
  }
```
---
---

### Metodos POST
#### Las consultas tipo POST se usan para crear un nuevo objeto en formato JSON
#### Por ejemplo, creemos un nuevo genero, llamado "Documentales"
#### Para ello, usamos la ruta para crear un nuevo genero

```
http://localhost:3000/generos/generos
```

#### Debemos enviar nuestra consulta en el apartado Body en formado JSON.

```json
  { 
    "clasificacion": "Documentales"
  }
```

#### Y de respuesta obtendremos un ID = 3, ya que hay solo 2 ID en la base de datos.

```json
  {
    "id": 3,  
    "clasificacion": "Documentales"
  }
```

---
---

### Metodos DELETE
#### Las consultas tipon Delete se usan para borrar un recurso, en este caso por ID
#### Por ejemplo, borremos el genero que acabamos de crear.

```
http://localhost:3000/generos/generos/3
```

#### Una vez realizado el pedido recibiremos esta respuesta
```json
  {
    "mensaje": "Genero eliminado con éxito"
  }
```

### Con esta informacion el uso de la API deberia ser exitoso. 