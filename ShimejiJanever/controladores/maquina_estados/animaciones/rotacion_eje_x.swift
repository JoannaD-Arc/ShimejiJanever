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
        print("hola mundo 4.")
        switch evento{
            
        case "boton_cerrar":
            print("Boton cerrar pulsado")
        default:
            
            print("roto en x")
            contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "rotacion_x"))
            contexto?.realizar_cambio_estado(nombre_del_estado_nuevo: SonidoFeo.nombre)
            return
        }
        
    }
    
    func finalizar() {
        
    }
    
    func reaccion(estimulo: String) {
        
    }
    
    
}
