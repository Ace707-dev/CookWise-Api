import Vapor
import Fluent


func routes(_ app: Application) throws {
    let usuarios = app.grouped("usuarios")
    usuarios.get { req in
        Usuario.query(on: req.db).all()
    }
    usuarios.post { req -> EventLoopFuture<Usuario> in
        let usuario = try req.content.decode(Usuario.self)
        return usuario.save(on: req.db).map { usuario }
    }

    let recetas = app.grouped("recetas")
    recetas.get { req in
        Receta.query(on: req.db).all()
    }
    recetas.post { req -> EventLoopFuture<Receta> in
        let receta = try req.content.decode(Receta.self)
        return receta.save(on: req.db).map { receta }
    }

    let ingredientes = app.grouped("ingredientes")
    ingredientes.get { req in
        Ingrediente.query(on: req.db).all()
    }
    ingredientes.post { req -> EventLoopFuture<Ingrediente> in
        let ingrediente = try req.content.decode(Ingrediente.self)
        return ingrediente.save(on: req.db).map { ingrediente }
    }

    recetas.get("buscar") { req -> EventLoopFuture<[Receta]> in
    let ingredientes = try req.query.get([String].self, at: "ingredientes")
    
    return Receta.query(on: req.db)
        .join(RecetaIngrediente.self, on: \Receta.$id == \RecetaIngrediente.$receta.$id)
        .join(Ingrediente.self, on: \RecetaIngrediente.$ingrediente.$id == \Ingrediente.$id)
        .filter(Ingrediente.self, \.$nombre ~~ ingredientes)
        .all()
    }
}
