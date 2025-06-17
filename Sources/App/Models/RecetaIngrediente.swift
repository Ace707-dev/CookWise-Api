import Fluent
import Vapor


final class RecetaIngrediente:@unchecked Sendable, Model, Content {
    static let schema = "receta_ingrediente"
    
    @ID(key: .id) var id: UUID?
    @Parent(key: "receta_id") var receta: Receta
    @Parent(key: "ingrediente_id") var ingrediente: Ingrediente
    @Field(key: "cantidad") var cantidad: Int  
    @Field(key: "unidad_medida") var unidadMedida: String  
    
    init() {}
    
    init(id: UUID? = nil, recetaID: UUID, ingredienteID: UUID, cantidad: Int, unidadMedida: String) {
        self.id = id
        self.$receta.id = recetaID
        self.$ingrediente.id = ingredienteID
        self.cantidad = cantidad
        self.unidadMedida = unidadMedida
    }
}