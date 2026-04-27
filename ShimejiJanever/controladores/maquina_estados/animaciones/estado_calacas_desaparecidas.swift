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
        switch evento{
            
        case "boton_cerrar":
            print("Boton cerrar pulsado")
        default:
            
            print("Desaparezco")
            contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "esfumar_calacas"))
            contexto?.realizar_cambio_estado(nombre_del_estado_nuevo: CalacasAparecidas.nombre)
            return
        }
        
        
    }
    
    func finalizar() {
        
    }
    
    func reaccion(estimulo: String) {
        
    }
    
    
}
