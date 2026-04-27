//
//  estado_salto.swift
//  ShimejiJanever
//
//  Created by Jose de la luz Olivares Gandara on 27/04/26.
//


class SaltoAnimacion: Estado{
    func finalizar() {
        
    }
    
    func reaccion(estimulo: String) {
        
    }
    
    
    
    var contexto: (any MaquinaEstadosGenerica)? = nil
    
    static let nombre: String = "salto"
    
    func inicializar(){
        print("Saltillo")
    }
    func actualizar(_ evento: String){
        switch evento{
            
        default:
            print("Estado salto.")
            contexto?.realizar_cambio_estado(nombre_del_estado_nuevo: ReposoAnimacion.nombre)
        }
        
        func finalizar(){
            
        }
        
        func reaccion(estimulo: String){
            
        }
    }
}
