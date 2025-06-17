import Fluent
import Vapor


final class Receta: @unchecked Sendable, Model, Content {
    static let schema = "recetas"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "nombre")
    var nombre: String

    @Field(key: "descripcion")
    var descripcion: String

    @Field(key: "pasos")
    var pasos: String

    @Field(key: "tiempoDePreparacion")
    var tiempoDePreparacion: Int

    @Field(key: "dificultad")
    var dificultad: String

    init() {}

   init(id: UUID? = nil, nombre: String, descripcion: String, pasos: String, tiempoDePreparacion: Int, dificultad: String) {
    self.id = id
    self.nombre = nombre
    self.descripcion = descripcion
    self.pasos = pasos
    self.tiempoDePreparacion = tiempoDePreparacion
    self.dificultad = dificultad
}

    
}