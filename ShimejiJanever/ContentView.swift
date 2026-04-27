//
//  ContentView.swift
//  ShimejiJanever
//

import SwiftUI
import RealityKit
import mundo_virtual

struct ContentView: View {
    

    @State var alejamiento: Float = 0
    @Environment(ControladorAplicacion.self) var controlador
    
    
 
    var body: some View {
        
        ZStack {
            
            fondo
            
            VStack {
                
                contenidoPrincipal
                
                controlesDeslizantes
                
                botonesAcciones
                
                historialComandos
                
            }
        }
    }
}




extension ContentView {
    
    // Fondo
    
    var fondo: some View {
        Rectangle()
            .ignoresSafeArea()
    }
    
    
  
    
    var contenidoPrincipal: some View {
        
        VStack {
            
            switch controlador.estado {
                
            case .iniciando:
                
                Text("Cargando aplicación, por favor, espera.")
                
                
            case .todo_cargado:
                
                RealityView { raiz_de_escena in
                    raiz_de_escena.add(controlador.raiz_escena)
                }
                .onReceive(
                    NotificationCenter.default.publisher(
                        for: Notification.Name("RealityKit.NotificationTrigger")
                    )
                ) { notificacion in
                    
                    guard let identificador =
                        notificacion.userInfo?[
                            "RealityKit.NotificationTrigger.Identifier"
                        ] as? String
                    else { return }
                    
                    controlador.escuchar_comportamiento(identificador)
                }
            }
        }
    }
    
    

    var controlesDeslizantes: some View {
        
        Slider(value: $alejamiento, in: 0...5)
            .onChange(of: alejamiento) {
                controlador.alejar_calacas(Alejamiento: alejamiento)
            }
    }
    
    

    
    var botonesAcciones: some View {
        
        HStack {
            
            Button("Alejar Calacas") {
                alejamiento = 5
            }
            .foregroundStyle(Color.red)
            
            
            Button("Da un saltito") {
                controlador.actualizar_estados("da_un_salto")
            }
            .foregroundStyle(Color.red)
            
            
            Button("Esfumar Calacas") {
                controlador.actualizar_estados("esfumar_calacas")
            }
            .foregroundStyle(Color.red)
            
            
            Button("Desesfumar Calacas") {
                controlador.actualizar_estados("desesfumar_calacas")
            }
            .foregroundStyle(Color.red)
            
            
            Button("Sonido Calaca") {
                controlador.actualizar_estados("horn_sonido")
            }
            .foregroundStyle(Color.red)
            
            Button("Rotar Eje X") {
                controlador.actualizar_estados("rotacion_x")
            }
            .foregroundStyle(Color.red)
        }
    }
    
    

    var historialComandos: some View {
        
        HStack {
            
            ForEach(controlador.historial_comandos) { comando in
                
                Text(
                    "Comando ejecutado: \(comando.carga_util)"
                )
                .foregroundStyle(Color.red)
            }
        }
    }
}



#Preview {
    ContentView()
        .environment(ControladorAplicacion())
}
