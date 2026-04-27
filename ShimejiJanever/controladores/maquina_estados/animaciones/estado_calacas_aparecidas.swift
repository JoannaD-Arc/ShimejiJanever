//
//  estado_calacas_aparecidas.swift
//  ShimejiJanever
//
//  Created by Jose de la luz Olivares Gandara on 27/04/26.
//

class CalacasAparecidas: Estado{
    var contexto: (any MaquinaEstadosGenerica)?
    static let nombre: String = "calacas_aparecidas"
    
    func inicializar() {
        print("aparisao")
    }
    
    func actualizar(_ evento: String) {
        print("Aparecieron las calacas.")
        contexto?.realizar_cambio_estado(nombre_del_estado_nuevo: ReposoAnimacion.nombre)
    }
    
    func finalizar() {
        
    }
    
    func reaccion(estimulo: String) {
        
    }
    
    
}
