//
//  controlador_notificacion.swift
//  ShimejiJanever
//
//  Created by Jose de la luz Olivares Gandara on 26/04/26.
//

import SwiftUI
import RealityKit

extension ControladorAplicacion{
    func activar_comportamiento(_ nombre: String){
        print("Activando animacion:", nombre)
        raiz_escena.scene?.enviar_notificacion(nombre)
    }
    
    func escuchar_comportamiento(_ nombre: String){
        actualizar_estados(nombre)
    }
    
}


