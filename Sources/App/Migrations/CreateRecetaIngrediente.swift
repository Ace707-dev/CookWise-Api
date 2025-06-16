import Fluent
import Vapor

struct CreateRecetaIngrediente: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("receta_ingrediente")
            .id()
            .field("receta_id", .uuid, .required, .references("recetas", "id"))
            .field("ingrediente_id", .uuid, .required, .references("ingredientes", "id"))
            .field("cantidad", .int, .required)
            .field("unidad_medida", .string, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("receta_ingrediente").delete()
    }
}