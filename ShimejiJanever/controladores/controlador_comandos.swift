//
//  controlador_comandos.swift
//  ShimejiJanever
//
//  Created by Jose de la luz Olivares Gandara on 27/04/26.
//
import SwiftUI

enum Comandos{
    case activar_animacion
}

public struct Comando: Identifiable{
    public let id = UUID()
    let tipo: Comandos
    let carga_util: String
}

extension ControladorAplicacion{
    func ejecutar_comando(tipo: Comandos, carga_util: String) -> Bool {
        switch tipo{
        case .activar_animacion:
                activar_comportamiento(carga_util)
                self.historial_comandos.append(Comando(tipo: tipo, carga_util: carga_util))
            
                return true
        }
        
        return false
    }
}
