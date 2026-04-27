//
//  rotacion_eje_x.swift
//  ShimejiJanever
//
//  Created by Jose de la luz Olivares Gandara on 27/04/26.
//

class RotacionX: Estado{
    var contexto: (any MaquinaEstadosGenerica)?
    static let nombre: String = "rotacion_x"
    
    func inicializar() {
        print("rotando en el eje x")
    }
    
    func actualizar(_ evento: String) {
        print("me estoy mareando cumbia")
        contexto?.realizar_cambio_estado(nombre_del_estado_nuevo: ReposoAnimacion.nombre)
    }
    
    func finalizar() {
        
    }
    
    func reaccion(estimulo: String) {
        
    }
    
    
}
