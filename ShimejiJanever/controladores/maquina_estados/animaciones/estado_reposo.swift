//
//  estado_reposo.swift
//  ShimejiJanever
//
//  Created by Jose de la luz Olivares Gandara on 27/04/26.
//


class ReposoAnimacion: Estado{
    
    var contexto: (any MaquinaEstadosGenerica)? = nil
    
    static let nombre: String = "reposo"
    
    func inicializar(){
        
    }
    func actualizar(_ evento: String){
        print("\(#function) recibiendo información de tipo evento con datos \(evento)")
        switch evento{
            
        case "da_un_salto":
            contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "da_un_salto"))
            contexto?.realizar_cambio_estado(nombre_del_estado_nuevo: SaltoAnimacion.nombre)
        case "esfumar_calacas":
            contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "esfumar_calacas"))
            contexto?.realizar_cambio_estado(nombre_del_estado_nuevo: CalacasDesaparecidas.nombre)
        case "desesfumar_calacas":
            contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "desesfumar_calacas"))
            contexto?.realizar_cambio_estado(nombre_del_estado_nuevo: CalacasAparecidas.nombre)
        case "horn_sonido":
            contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "horn_sonido"))
            contexto?.realizar_cambio_estado(nombre_del_estado_nuevo: SonidoFeo.nombre)
        case "rotacion_x":
            contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "rotacion_x"))
            contexto?.realizar_cambio_estado(nombre_del_estado_nuevo: RotacionX.nombre)
        default:
            print("Comando no especificado.")
            
        }

    }
    
    func finalizar(){
        
    }
    
    func reaccion(estimulo: String){
        
    }
}
