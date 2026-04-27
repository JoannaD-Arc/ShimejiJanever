//
//  estado_generico.swift
//  ShimejiJanever
//
//  Created by Jose de la luz Olivares Gandara on 27/04/26.
//

protocol Estado{
    
    var contexto: MaquinaEstadosGenerica? { get set }
    
    func inicializar() -> Void
    
    func actualizar(_ evento: String) -> Void
    
    func finalizar() -> Void
    
    func reaccion(estimulo: String) -> Void
}


