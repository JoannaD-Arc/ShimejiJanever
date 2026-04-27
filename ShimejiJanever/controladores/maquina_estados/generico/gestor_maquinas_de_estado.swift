//
//  gestor_maquinas_de_estado.swift
//  ShimejiJanever
//
//  Created by Jose de la luz Olivares Gandara on 27/04/26.
//

protocol MaquinaEstadosGenerica{
    var controlador_general: ProcesarComandos? {get set}
    
    func realizar_cambio_estado(nombre_del_estado_nuevo:String) -> Void
    
    func actualizar(_ evento:String) -> Void
    
    func enviar_peticion(_ comando: Comando) -> Bool
}
