# cookWise-api
CookWise es una API RESTful diseñada para alimentar una aplicación de recetario inteligente. Su objetivo es permitir a los usuarios gestionar sus recetas personales, ingredientes y favoritos, facilitando la planificación de comidas en función de lo que ya tienen en casa.

El proyecto está construido con el lenguaje Swift usando el framework Vapor para el backend, y utiliza MySQL como sistema de base de datos relacional con soporte de Fluent ORM para el manejo de modelos y migraciones.

Entre sus funcionalidades destacan:

Registro y gestión de usuarios.

Creación, edición y consulta de recetas detalladas.

Asociación dinámica de ingredientes a recetas.

Marcado de recetas favoritas.

Consulta de recetas a partir de ingredientes disponibles (implementable).

Este proyecto representa una solución modular, escalable y moderna para el manejo digital de recetas, con un enfoque práctico y extensible para futuras funcionalidades como filtros por dificultad, búsqueda por ingredientes, y recomendación de recetas.

Tecnologías utilizadas 

Swift 

Vapor 

Fluent 

MySQL 

Docker (opcional) 

Desplegado en DigitalOcean 

Instalación 

Requisitos 

Ubuntu 22.04+ 

Swift 5.9+ 

MySQL 8+ 

Vapor CLI 

1. Clonar el proyecto 

git clone https://github.com/tuusuario/CookWise.git  

cd CookWise  

2. Configurar .env  

Crea un archivo .env con las siguientes variables: 

DB_HOST=localhost  

DB_USER=tu_usuario  

DB_PASSWORD=tu_password  

DB_NAME=cookwise  

Migraciones  

swift build -c release env $(cat .env | xargs) 

.build/release/Run migrate   

Endpoints disponibles   

Usuarios: Método Ruta Descripción  

GET /usuarios Lista todos los usuarios  

POST /usuarios Crea un nuevo usuario  

PUT /usuarios/:id Edita un usuario existente  

DELETE /usuarios/:id Elimina un usuario 

Recetas: Método Ruta Descripción  

GET /recetas Lista todas las recetas  

POST /recetas Crea una receta nueva  

PUT /recetas/:id Actualiza una receta  

DELETE /recetas/:id Elimina una receta 

Ingredientes: Método Ruta Descripción  

GET /ingredientes Lista todos los ingredientes  

POST /ingredientes Crea un nuevo ingrediente  

PUT /ingredientes/:id Modifica un ingrediente existente  

DELETE /ingredientes/:id Elimina un ingrediente 

Relación Receta – Ingrediente: Método Ruta Descripción  

GET /receta-ingredientes Lista las relaciones receta-ingrediente  

POST /receta-ingredientes Relaciona una receta con un ingrediente  

DELETE /receta-ingredientes/:id Elimina la relación 

Favoritos Método Ruta Descripción  

GET /favoritos Lista todos los favoritos 

POST /favoritos Agrega receta a favoritos  

DELETE /favoritos/:id Elimina un favorito 

Despliegue  

Esta API puede desplegarse en un droplet de DigitalOcean con MySQL instalado. Alternativamente, puedes contenerizarla usando Docker. 

Autores: 

Andrés Aguilera Hernández
Joaquín Alejandro Valois Ruiz

 
