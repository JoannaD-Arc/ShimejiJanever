//
//  diseno_comandos.swift
//  ShimejiJanever
//
//  Created by Jose de la luz Olivares Gandara on 27/04/26.
//
import SwiftUI

protocol ProcesarComandos{
    func ejecutar_comando(tipo: Comandos, carga_util: String) -> Bool
    func ejecutar_comando(_ comanda: Comando) -> Bool
}

enum Comandos{
    case activar_animacion
    case activar_pantalla
}

public struct Comando: Identifiable{
    public let id = UUID()
    let tipo: Comandos
    let carga_util: String
}
