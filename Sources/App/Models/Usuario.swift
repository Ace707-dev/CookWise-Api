import Fluent
import Vapor


final class Usuario: @unchecked Sendable, Model, Content {
    static let schema = "usuarios"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "usuario")
    var usuario: String

    @Field(key: "email")
    var email: String

    @Field(key: "contraseña")
    var contraseña: String

    init() {}

    init(id: UUID? = nil, usuario: String, email: String, contraseña: String) {
        self.id = id
        self.usuario = usuario
        self.email = email
        self.contraseña = contraseña
    }
}