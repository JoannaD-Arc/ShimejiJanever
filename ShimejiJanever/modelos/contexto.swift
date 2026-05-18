//
//  contexto.swift
//  ShimejiJanever
//
//  Created by Jose de la luz Olivares Gandara on 14/05/26.
//

import Foundation

struct Contexto: Codable{
    var historia:                 String
    var personalidad:             String
    var acciones_disponibles:    [String]
    var estados_disponibles:     [String]
    var estado_emocional:         String
}
