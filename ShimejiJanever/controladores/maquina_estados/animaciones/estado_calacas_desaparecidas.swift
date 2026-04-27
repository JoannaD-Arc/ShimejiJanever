//
//  estado_planetas_desaparecidos.swift
//  ShimejiJanever
//
//  Created by Jose de la luz Olivares Gandara on 27/04/26.
//

class CalacasDesaparecidas: Estado{
    var contexto: (any MaquinaEstadosGenerica)?
    static let nombre: String = "calacas_desaparecidas"
    
    func inicializar() {
        print("desaparisao")
    }
    
    func actualizar(_ evento: String) {
        print("Desaparecieron las calacas.")
        contexto?.realizar_cambio_estado(nombre_del_estado_nuevo: ReposoAnimacion.nombre)
    }
    
    func finalizar() {
        
    }
    
    func reaccion(estimulo: String) {
        
    }
    
    
}
