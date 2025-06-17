import Vapor
import Fluent

final class Favorito: @unchecked Sendable, Model, Content {
    static let schema = "favoritos"
    
    @ID(key: .id) var id: UUID?
    @Parent(key: "usuario_id") var usuario: Usuario
    @Parent(key: "receta_id") var receta: Receta
    

    
    init() {}

    init(id: UUID? = nil, usuarioID: UUID, recetaID: UUID) {
        self.id = id
        self.$usuario.id = usuarioID
        self.$receta.id = recetaID
    }
}