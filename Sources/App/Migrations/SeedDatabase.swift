import Fluent
import Vapor

struct SeedDatabase: Migration {
    func revert(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.eventLoop.makeSucceededFuture(())
    }

    func prepare(on database: Database) -> EventLoopFuture<Void> {
        // 1. Crear ingredientes
        let pollo = Ingrediente(nombre: "Pollo", categoria: "Carnes")
        let tomate = Ingrediente(nombre: "Tomate", categoria: "Vegetales")
        
        // 2. Guardar ingredientes (usar create en migraciones)
        return pollo.create(on: database)
            .and(tomate.create(on: database))
            .flatMap { _ in
                // 3. Crear receta
                let receta = Receta(
                    nombre: "Ensalada",
                    descripcion: "Receta fresca",
                    pasos: "Mezclar todo",
                    tiempoDePreparacion: 10,
                    dificultad: "Fácil"
                )
                
                return receta.create(on: database)
            }
    }
}