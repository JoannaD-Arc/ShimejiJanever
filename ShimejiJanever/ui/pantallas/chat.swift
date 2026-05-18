//
//  chat.swift
//  ShimejiJanever
//
//  Created by alumno on 5/4/26.
//

import SwiftUI

struct ChatView: View{
    @State var sesion_chat = ServicioChat()
    @State var sesion_agente = ServicioAgente()
    @State var mensaje_a_enviar: String = ""
    
    var body: some View {
        VStack{
            ForEach(sesion_chat.mensajes){mensaje in
                Text("El mensaje es: \(mensaje.texto) de parte de: \(mensaje.remitente)")
            }
            TextField("Cuentame que enviar", text: $mensaje_a_enviar)
            Button{
                sesion_agente.crear_peticion()
            }label: {
                Text("Pulsar para mensaje enviar.")
            }
        }
        .onAppear{
            sesion_chat.obtener_mensajes()
        }
    }
}
#Preview {
    ChatView()
}
