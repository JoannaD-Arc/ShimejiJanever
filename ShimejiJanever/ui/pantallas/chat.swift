//
//  chat.swift
//  ShimejiJanever
//
//  Created by alumno on 5/4/26.
//

import SwiftUI

struct ChatView: View{
    @State var sesion_chat = ServicioChat()

    var body: some View {
        VStack{
            Button{
                sesion_chat.enviar_mensaje(texto: "Hello mundo.")
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
