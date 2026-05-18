//
//  servicio_agente.swift
//  ShimejiJanever
//
//  Created by Jose de la luz Olivares Gandara on 14/05/26.
//

import FirebaseFirestore
import Combine

@Observable
class ServicioAgente{
//    var mensajes: Peticion? = nil
    var peticion: [Peticion] = []
    
    private var base_de_datos = Firestore.firestore()
    
    func obtener_actualizaciones_de_la_peticion (){
        base_de_datos.collection("mensajes").order(by: "timestamp").addSnapshotListener { (snapshot, error) in
            guard let documento = snapshot?.documents else {return}
            self.peticion = documento.compactMap{elemento in
            try? elemento.data(as: Peticion.self)}
        }
    }
    func crear_peticion(){
        let contexto = Contexto(
            historia: "hola",
            personalidad: "hola 2",
            acciones_disponibles: [],
            estados_disponibles: [],
            estado_emocional: ""
        )
        
        let peticion = Peticion(
            id: UUID().uuidString,
            estado: .creacion,
            contexto: contexto,
            mensaje: "Hola mundo",
            animacion: nil,
            comando_a_ejecutar: nil,
            respuesta: nil
        )
        do{
            var resultado_enviar_peticion = try base_de_datos.collection("peticion").addDocument(from: peticion)
            print("El resultado de enviar la petición es: \(resultado_enviar_peticion)")
        }
        catch {
            print("Tienes un error \(error)")
        }
    }
}
