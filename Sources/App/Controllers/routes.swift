import Vapor
import Fluent


func routes(_ app: Application) throws {

    app.get("seed") { req -> EventLoopFuture<String> in
    let ingredientes = [
        Ingrediente(nombre: "Lechuga", categoria: "Vegetales")
    ]
    
    return ingredientes.map { $0.save(on: req.db) }
        .flatten(on: req.eventLoop)
        .map { "¡Base de datos poblada!" }
    }

    let usuarios = app.grouped("usuarios")
    usuarios.get { req in Usuario.query(on: req.db).all() }
    
    usuarios.post { req -> EventLoopFuture<Usuario> in
        let usuario = try req.content.decode(Usuario.self)
        return usuario.save(on: req.db).map { usuario }
    }
    usuarios.put(":id") { req -> EventLoopFuture<Usuario> in
    let update = try req.content.decode(Usuario.self)
    return Usuario.find(req.parameters.get("id"), on: req.db)
        .unwrap(or: Abort(.notFound)).flatMap { usuario in
            usuario.usuario = update.usuario
            usuario.email = update.email
            usuario.contraseña = update.contraseña
            return usuario.save(on: req.db).map { _ in usuario }
        }
}

    usuarios.delete(":id") { req async throws -> HTTPStatus in
        guard let usuario = try await Usuario.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await usuario.delete(on: req.db)
        return .ok
    }

    let recetas = app.grouped("recetas")
    recetas.get { req in Receta.query(on: req.db).all() }
    recetas.post { req -> EventLoopFuture<Receta> in
        let receta = try req.content.decode(Receta.self)
        return receta.save(on: req.db).map { receta }
    }
    recetas.put(":id") { req -> EventLoopFuture<Receta> in
    let update = try req.content.decode(Receta.self)
    return Receta.find(req.parameters.get("id"), on: req.db)
        .unwrap(or: Abort(.notFound)).flatMap { receta in
            receta.nombre = update.nombre
            receta.descripcion = update.descripcion
            receta.pasos = update.pasos
            receta.tiempoDePreparacion = update.tiempoDePreparacion
            receta.dificultad = update.dificultad
            return receta.save(on: req.db).map { _ in receta }
        }
}

    recetas.delete(":id") { req async throws -> HTTPStatus in
        guard let receta = try await Receta.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await receta.delete(on: req.db)
        return .ok
    }

    let ingredientes = app.grouped("ingredientes")
    ingredientes.get { req in Ingrediente.query(on: req.db).all() }
    ingredientes.post { req -> EventLoopFuture<Ingrediente> in
        let ingrediente = try req.content.decode(Ingrediente.self)
        return ingrediente.save(on: req.db).map { ingrediente }
    }
    ingredientes.put(":id") { req -> EventLoopFuture<Ingrediente> in
    let update = try req.content.decode(Ingrediente.self)
    return Ingrediente.find(req.parameters.get("id"), on: req.db)
        .unwrap(or: Abort(.notFound)).flatMap { ingrediente in
            ingrediente.nombre = update.nombre
            ingrediente.categoria = update.categoria
            return ingrediente.save(on: req.db).map { _ in ingrediente }
        }
}

    ingredientes.delete(":id") { req async throws -> HTTPStatus in
        guard let ingrediente = try await Ingrediente.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await ingrediente.delete(on: req.db)
        return .ok
    }

    let recetaIngredientes = app.grouped("receta-ingredientes")
    recetaIngredientes.get { req in RecetaIngrediente.query(on: req.db).all() }
    recetaIngredientes.post { req -> EventLoopFuture<RecetaIngrediente> in
        let rel = try req.content.decode(RecetaIngrediente.self)
        return rel.save(on: req.db).map { rel }
    }
    recetaIngredientes.delete(":id") { req -> EventLoopFuture<HTTPStatus> in
        RecetaIngrediente.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db).transform(to: .ok) }
    }

    let favoritos = app.grouped("favoritos")
    favoritos.get { req in Favorito.query(on: req.db).all() }
    favoritos.post { req -> EventLoopFuture<Favorito> in
        let fav = try req.content.decode(Favorito.self)
        return fav.save(on: req.db).map { fav }
    }
    favoritos.delete(":id") { req -> EventLoopFuture<HTTPStatus> in
        Favorito.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db).transform(to: .ok) }
    }
}
    

    

