# cookWise-api
CookWise es un recetario digital, que ofrece una comunidad llena de recetas para tu dia a dia

CookWise API 

CookWise es una API RESTful desarrollada en Swift usando el framework Vapor. Permite gestionar un recetario inteligente, con funciones para usuarios, recetas, ingredientes, relaciones entre ellos y favoritos. 

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

Autor: 

Andrés Aguilera Hernández 

 
