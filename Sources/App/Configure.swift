import Vapor
import Fluent
import FluentMySQLDriver

public func configure(_ app: Application) throws {
    app.databases.use(.mysql(
    hostname: "localhost",
    username: "cookwise_user",
    password: "root",
    database: "cookwise",
    tlsConfiguration: .forClient(certificateVerification: .none) 
), as: .mysql)

    app.migrations.add(CreateUsuario())
    app.migrations.add(CreateReceta())
    app.migrations.add(CreateIngrediente())
    app.migrations.add(CreateRecetaIngrediente())
    app.migrations.add(CreateFavorito())  
    app.migrations.add(SeedDatabase())

    try app.autoMigrate().wait() 
    try routes(app)
    
}
