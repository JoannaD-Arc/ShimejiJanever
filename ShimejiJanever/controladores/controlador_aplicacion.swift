//
//  controlador_aplicacion.swift
//  ShimejiJanever
//
//  Created by Jose de la luz Olivares Gandara on 24/04/26.
//

import SwiftUI
import RealityKit
import mundo_virtual

@Observable
@MainActor
public class ControladorAplicacion {
    
    //public var escenario_calaca: Entity? = nil
    public var raiz_escena: Entity = Entity()
    public var estado: EstadosAplicacion = .iniciando
    private var calacas_cargadas: [Entity] = []
    var historial_comandos: [Comando] = []
    var maquina_de_estados: [MaquinaEstadosGenerica] = [MaquinaEstadosAnimacion()]
    var anclas_seguimiento: [AnchorEntity] = []
    
    init() {
        for indice in 0...maquina_de_estados.count - 1{
            maquina_de_estados[indice].controlador_general = self as ProcesarComandos
        }
        Task.detached(priority: .high){
            await self.cargar_calacas()
        }
    }
    
    func cargar_calacas() async {
        defer{
            estado = .todo_cargado
        }
        var contador_de_bucle_for = 0
        
        for calaca in calacas{
            guard let calaca = try? await Entity(named: calaca, in: MundoVirtual) else {
                fatalError("No se ha podido cargar el escenario virtual. \(#function)")
            }
            
            calaca.position.y = Float(contador_de_bucle_for / 5) * 0.2
            calaca.position.y = Float(contador_de_bucle_for % 5) * 0.2
            
            raiz_escena.addChild(calaca)
            calacas_cargadas.append(calaca)
            contador_de_bucle_for += 1
            
            let ancla = AnchorEntity(.image(group: "imagenes", name: "BG3"))
            ancla.addChild(calaca)
            anclas_seguimiento.append(ancla)
        }
        
        


        
    }
    
    func alejar_calacas(Alejamiento: Float){
        for calaca_cargada in calacas_cargadas {
            calaca_cargada.position.z = -Alejamiento
        }
    }
    
    func actualizar_estados(_ mensaje: String){
        for maquina in maquina_de_estados{
            maquina.actualizar(mensaje)
        }
    }
}
