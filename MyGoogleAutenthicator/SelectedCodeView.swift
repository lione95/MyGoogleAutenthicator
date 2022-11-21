//
//  SelectedCodeView.swift
//  MyGoogleAutenthicator
//
//  Created by Mattia Golino on 18/11/22.
//

import SwiftUI

struct SelectedCodeView: View {
    
    @Binding var nomeSito: String
    @Binding var logoSito: Image
    var randomNumber = Int.random(in: 100000...999999)
    
    var body: some View {
        VStack{
            logoSito.resizable().frame(width: 50,height: 50)
            Text(nomeSito)
            Text(String(randomNumber))
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.BlueAutenthicator)
    }
}
