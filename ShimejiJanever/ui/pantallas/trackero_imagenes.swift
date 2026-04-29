//
//  trackero_imagenes.swift
//  ShimejiJanever
//
//  Created by alumno on 4/27/26.
//

import SwiftUI
import RealityKit
import mundo_virtual

struct SeguimientoImagenes: View {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        switch controlador.estado{
        case .iniciando:
            Text("Cargando...")
        case .todo_cargado:
            RealityView{ contenido in
                contenido.camera = .spatialTracking
                
                // let ancla = AnchorEntity(.image(group: "imagenes", name: "BG3"))
                let modelo_debug = ModelEntity(mesh: .generateBox(size: 0.75),
                 materials: [SimpleMaterial(color: .green, isMetallic: true)])
                /*if let modelo_a_colocar = try? await Entity(named: "Scene1", in: MundoVirtual){
                    ancla.addChild(modelo_a_colocar)
                }else{
                    ancla.addChild(modelo_debug)
                }*/
                /*if let modelo_problematico = try? await Entity(named: "Scene2", in: MundoVirtual){
                     contenido.add(modelo_problematico)
                }*/
               // contenido.add(ancla)
                
                for ancla in controlador.anclas_seguimiento{
                    contenido.add(ancla)
                }
            }
            .gesture(SpatialTapGesture().targetedToAnyEntity().onEnded({
                    entidad_apachurrada in
                    print("Se ha pulsado \(entidad_apachurrada)")
                }))
        }
        
       
    }
}
#Preview {
    SeguimientoImagenes()
}
