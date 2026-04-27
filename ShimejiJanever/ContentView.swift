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
    }
}

#Preview{
    ContentView()
        .environment(ControladorAplicacion())
}
