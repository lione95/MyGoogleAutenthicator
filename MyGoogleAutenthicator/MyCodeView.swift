//
//  MyCodeView.swift
//  MyGoogleAutenthicator
//
//  Created by Mattia Golino on 18/11/22.
//

import SwiftUI
import VisionKit
import CodeScanner

struct MyCodeView: View {
    
    @State var mySities: [Codes] = [Codes(nomeSito: "Twitch", username: "User1", logoSito: Image("TwitchLogo")), Codes(nomeSito: "Google", username: "User2", logoSito: Image("GoogleLogo")), Codes(nomeSito: "Twitter", username: "User3", logoSito: Image("TwitterLogo")), Codes(nomeSito: "Nintendo", username: "User4", logoSito: Image("NintendoLogo")), Codes(nomeSito: "Epic", username: "User5", logoSito: Image("EpicLogo")), Codes(nomeSito: "NCSOFT", username: "User6", logoSito: Image("NCSOFTLogo")), Codes(nomeSito: "Ubisoft", username: "User7", logoSito: Image("UbisoftLogo")), Codes(nomeSito: "RockStar", username: "User8", logoSito: Image("RockStarLogo"))]
    let layout = [GridItem(.flexible()), GridItem(.flexible()),]
    @State var isPresented = false
    @State var nome = ""
    @State var user = ""
    @State var logo = Image("")
    @State private var cercaSito = ""
    @State var scanCode = false
    
    var scannerSheet: some View{
        CodeScannerView(codeTypes: [.qr], completion: { result in
            if case .success(_) = result {
                mySities.append(Codes(nomeSito: "sito1", username: "myuser", logoSito: Image(systemName: "house")))
                scanCode.toggle()
            }
        })
    }
    
    var body: some View {
        NavigationView(){
            VStack{
                ScrollView(showsIndicators: false){
                    LazyVGrid(columns: layout,spacing: 30){
                        ForEach(mySities) { Sity in
                            ZStack{
                                RoundedRectangle(cornerRadius: 25, style: .continuous).fill(Color.WhiteAutenthicator).shadow(radius: 5)
                                VStack{
                                    Sity.logoSito.resizable().frame(width: 50,height: 50)
                                    Text(Sity.nomeSito)
                                }
                            }.frame(width: 130, height: 150).padding(.top).padding(.horizontal).sheet(isPresented: $isPresented) {
                                SelectedCodeView(nomeSito: $nome,user: $user, logoSito: $logo)
                            }.onTapGesture {
                                isPresented.toggle()
                                nome = Sity.nomeSito
                                user = Sity.username
                                logo = Sity.logoSito
                            }
                        }
                    }
                }
            }.navigationTitle("My Codes").frame(maxWidth: .infinity, maxHeight: .infinity).searchable(text: $cercaSito,  placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for your code"){
                ForEach(searchResults) { Sity in
                    VStack{
                        Text(Sity.nomeSito)
                    }.sheet(isPresented: $isPresented) {
                        SelectedCodeView(nomeSito: $nome,user: $user, logoSito: $logo)
                    }.onTapGesture {
                        isPresented.toggle()
                        nome = Sity.nomeSito
                        user = Sity.username
                        logo = Sity.logoSito
                    }
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        scanCode.toggle()
                    } label: {
                        Image(systemName: "plus.circle").foregroundColor(Color.black)
                    }.sheet(isPresented: $scanCode) {
                        self.scannerSheet
                    }

                }
            }.background(Color.gray.opacity(0.2))
        }
    }
    
    var searchResults: [Codes] {
           if cercaSito.isEmpty {
               return mySities
           } else {
               return mySities.filter {$0.nomeSito == cercaSito}
           }
    }
}
