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

        print("hola mundo 5.")
        switch evento{
            
        case "boton_cerrar":
            print("Boton cerrar pulsado")
        default:
            
            print("cumbia_sonidera")
            contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "sonido_feo"))
            contexto?.realizar_cambio_estado(nombre_del_estado_nuevo: ReposoAnimacion.nombre)
            return
        }
    }
    
    func finalizar() {
        
    }
    
    func reaccion(estimulo: String) {
        
    }
    
    
}
