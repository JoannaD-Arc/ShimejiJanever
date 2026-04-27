//
//  estado_sonido_feo.swift
//  ShimejiJanever
//
//  Created by Jose de la luz Olivares Gandara on 27/04/26.
//

class SonidoFeo: Estado{
    var contexto: (any MaquinaEstadosGenerica)?
    static let nombre: String = "sonido_feo"
    
    func inicializar() {
        print("cumbia")
    }
    
    func actualizar(_ evento: String) {
        print("sonando cumbia")
        contexto?.realizar_cambio_estado(nombre_del_estado_nuevo: ReposoAnimacion.nombre)
    }
    
    func finalizar() {
        
    }
    
    func reaccion(estimulo: String) {
        
    }
    
    
}
