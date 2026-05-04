//
//  ShimejiJaneverApp.swift
//  ShimejiJanever
//
//  Created by Jose de la luz Olivares Gandara on 24/04/26.
//

import SwiftUI
import FirebaseCore

@main
struct ShimejiJaneverApp: App {
    @State var controlador_general = ControladorAplicacion()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SeguimientoImagenes()
                .environment(controlador_general)
        }
    }
}
