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
            
        case "boton_cerrar":
            contexto?.enviar_peticion(Comando(tipo: .activar_animacion, carga_util: "da_un_salto"))
            contexto?.realizar_cambio_estado(nombre_del_estado_nuevo: SaltoAnimacion.nombre)
        default:
            print("Comando no especificado.")
            
        }

    }
    
    func finalizar(){
        
    }
    
    func reaccion(estimulo: String){
        
    }
}
