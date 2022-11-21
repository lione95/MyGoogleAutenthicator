//
//  dataStracture.swift
//  MyGoogleAutenthicator
//
//  Created by Mattia Golino on 18/11/22.
//

import Foundation
import SwiftUI

struct Codes: Identifiable{
    
    var id = UUID()
    var nomeSito: String
    var username: String
    var logoSito: Image
    
    init(id: UUID = UUID(), nomeSito: String, username: String, logoSito: Image) {
        self.id = id
        self.nomeSito = nomeSito
        self.username = username
        self.logoSito = logoSito
    }
}

extension Codes: Comparable {
    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.nomeSito < rhs.nomeSito
    }
}


extension Color {
    static let BlueAutenthicator = Color("BlueAutenthicator")
    static let WhiteAutenthicator = Color("WhiteAutenthicator")
}
