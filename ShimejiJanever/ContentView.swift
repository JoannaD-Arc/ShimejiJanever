//
//  ContentView.swift
//  ShimejiJanever
//
//  Created by Jose de la luz Olivares Gandara on 24/04/26.
//

import SwiftUI
import RealityKit
import mundo_virtual

struct ContentView: View {
    @State var Alejamiento: Float = 0
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
            VStack{
                switch controlador.estado{
                case .iniciando:
                    Text("Cargando aplicación, por favor, espera.")
                case .todo_cargado:
                    RealityView{ raiz_de_escena in
                        raiz_de_escena.add(controlador.raiz_escena)
                    }
                    .onReceive(NotificationCenter.default.publisher(for: Notification.Name("RealityKit.NotificationTrigger"))){ notificacion in
                        guard let notificacion = notificacion.userInfo?["RealityKit.NotificationTrigger.Identifier"] as? String else { return }
                        
                        controlador.escuchar_comportamiento(notificacion)
                    }
                }
            }
        }
        Slider(value: $Alejamiento, in: 0...5)
            .onChange(of: Alejamiento) {
                controlador.alejar_calacas(Alejamiento: Alejamiento)
            }
        Button{
            Alejamiento = 5
        }label:{
            Text("Alejar Calacas")
                .foregroundStyle(Color.red)
        }
        
        Button{
            controlador.ejecutar_comando(tipo: .activar_animacion, carga_util: "da_un_salto")
        }label:{
            Text("Da un saltito")
                .foregroundStyle(Color.red)
        }
    }
    
    HStack{
        ForEach(controlador.historial_comandos){ comando in
            Text("Comando ejecutado \(comando.carga_util)")
        }
    }
}

#Preview{
    ContentView()
        .environment(ControladorAplicacion())
}
