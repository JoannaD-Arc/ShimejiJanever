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
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
            RealityView{ raiz_de_escena in
                if let modelo_cubo = try? await Entity(named: "Scene", in: mundo_virtualBundle){
                    
                    modelo_cubo.position.z = Float(Alejamiento)
                    print(Alejamiento)
                    raiz_de_escena.add(modelo_cubo)
                }
                
            }
            
        }
        
        Slider(value: $Alejamiento)
    }
}

#Preview {
    ContentView()
}
