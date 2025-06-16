import Fluent
import Vapor

struct CreateFavorito: Migration {
  
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("favoritos")
            .id()
            .field("usuario_id", .uuid, .required, .references("usuarios", "id", onDelete: .cascade))
            .field("receta_id", .uuid, .required, .references("recetas", "id", onDelete: .cascade))
            
            .unique(on: "usuario_id", "receta_id")  // ¡Sin corchetes!
            .create()
    }

   
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("favoritos").delete()
    }
}