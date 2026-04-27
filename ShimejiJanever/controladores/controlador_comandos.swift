//
//  controlador_comandos.swift
//  ShimejiJanever
//
//  Created by Jose de la luz Olivares Gandara on 27/04/26.
//
import SwiftUI


extension ControladorAplicacion: ProcesarComandos{
    func ejecutar_comando(tipo: Comandos, carga_util: String) -> Bool {
        switch tipo{
        case .activar_animacion:
                activar_comportamiento(carga_util)
                self.historial_comandos.append(Comando(tipo: tipo, carga_util: carga_util))
            
                return true
        default:
            fatalError("[\(#file): \(#function)] Esto no ha sido implementado todavia. \(tipo)")
            return false
        }
        
        return false
    }
    
    func ejecutar_comando(_ comanda: Comando) -> Bool {
        switch comanda.tipo{
        case .activar_animacion:
            activar_comportamiento(comanda.carga_util)
            historial_comandos.append(comanda)
            
                return true
        default:
            fatalError("[\(#file): \(#function)] Esto no ha sido implementado todavia. \(comanda.tipo)")
            return false
        }
        
        return false
    }
}
