//
//  estado_salto.swift
//  ShimejiJanever
//
//  Created by Jose de la luz Olivares Gandara on 27/04/26.
//


class SaltoAnimacion: Estado{
    var contexto: (any MaquinaEstadosGenerica)? = nil
    
    static let nombre: String = "salto"
    
    func inicializar(){
        print("Saltillo")
    }
    func actualizar(_ evento: String){
        switch evento{
            
        case "boton_cerrar":
            print("Boton cerrar pulsado")
        default:
            
            print("Saltando Guanajuato jeje")
            contexto?.realizar_cambio_estado(nombre_del_estado_nuevo: CalacasDesaparecidas.nombre)
            return
        }
    }
    func finalizar(){}
        
    func reaccion(estimulo: String){}
    
}
