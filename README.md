# README

 Es una plataforma de manejo de cursos para la materia Ruby, como trabajo integrador 2017 de la cursada Taller de Produccion de Software, opcion Ruby, UNLP
 
## Requerimientos

* Ruby version:  2.4.1
* Bundler 
* Rails 5.1.4

## ¿Cómo instalo la plataforma?


### Descarga código fuente:
* [Repositorio Github] (https://github.com/ezemanzur/TPI-Ruby2017)
* [Repositorio Github] (https://github.com/ezemanzur/TPI-Ruby2017)
* Desde consola:

```
  $ git clone https://github.com/ezemanzur/TPI-Ruby2017
  ```

### Gemas:
```
	$ bundle install
```
	  * Para este último comando, se debe estar ubicado sobre el directorio donde se copió el repositorio.

### Preparar base de datos:
```
	$ rails db:create
	$ rails db:migrate
```
	 * La plataforma provee de datos pre-cargados (seeds) para poder probarla.

```
	$ rails db:seed
```

### Ejecutar server
*Para iniciar el server:
```
  $ rails s
```


### Todo listo!
Para acceder:
[http://localhost:3000](http://localhost:3000)

# Unit Test
Para correr los test:
* Todos los test:
```
  $ rails test test/
 ```

* Para el modelo de Cursos:
```
  $ rails test test/models/course_test.rb
 ```

* Para el modelo de Evaluaciones:
```
  $ rails test test/models/evaluation_test.rb
 ```

* Para el modelo de Estudiantes:
```
  $ rails test test/models/student_test.rb
 ```

* Para el modelo de Notas:
```
  $ rails test test/models/exam_test.rb
 ```

* Para iniciar sesion en la plataforma, se cuenta con un unico usuario precargado:
	email: p.ruby@gmail.com 
	password: 'ruby2017'

