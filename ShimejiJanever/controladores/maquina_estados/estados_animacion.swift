//
//  estados_animacion.swift
//  ShimejiJanever
//
//  Created by Jose de la luz Olivares Gandara on 27/04/26.
//

class MaquinaEstadosAnimacion: MaquinaEstadosGenerica {
    var controlador_general: (any ProcesarComandos)?
    
    var estados_disponibles: [String: Estado] = [ReposoAnimacion.nombre: ReposoAnimacion(),
                                                 SaltoAnimacion.nombre: SaltoAnimacion(),
                                                 CalacasDesaparecidas.nombre: CalacasDesaparecidas(),
                                                 CalacasAparecidas.nombre: CalacasAparecidas(),
                                                 SonidoFeo.nombre: SonidoFeo(),
                                                 RotacionX.nombre: RotacionX()]
    
    var estado_actual: Estado? = nil
    
    init(){
        estado_actual = estados_disponibles[ReposoAnimacion.nombre]
        estado_actual?.contexto = self
    }
    
    func realizar_cambio_estado(nombre_del_estado_nuevo: String){
        guard var estado_nuevo = estados_disponibles[nombre_del_estado_nuevo] else {
            fatalError("Parece que el estado \(nombre_del_estado_nuevo) no está registrado.")
        }
        
        estado_actual?.finalizar()
        
        estado_nuevo.contexto = self as MaquinaEstadosGenerica
        estado_nuevo.inicializar()
        
        estado_actual = estado_nuevo
    }
    
    func actualizar(_ evento: String){
        estado_actual?.actualizar(evento)
    }
    
    func enviar_peticion(_ comando: Comando) -> Bool{
        print("peticion enviada de \(comando)")
        guard let respuesta = controlador_general?.ejecutar_comando(comando)else{
            return false
        }
        return respuesta
    }
}
