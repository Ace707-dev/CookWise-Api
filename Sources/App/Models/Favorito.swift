import Vapor
import Fluent

final class Favorito: @unchecked Sendable, Model {
    static let schema = "favoritos"
    
    @ID(key: .id) var id: UUID?
    @Parent(key: "usuario_id") var usuario: Usuario
    @Parent(key: "receta_id") var receta: Receta
    
    init() {}
}