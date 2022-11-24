//
//  SelectedCodeView.swift
//  MyGoogleAutenthicator
//
//  Created by Mattia Golino on 18/11/22.
//

import SwiftUI

struct SelectedCodeView: View {
    
    @Binding var nomeSito: String
    @Binding var user: String
    @Binding var logoSito: Image
    @State var to: CGFloat = 60
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var count = 60
    @State var randomNumber = String(Int.random(in: 100000...999999))
    
    var body: some View {
        VStack{
            logoSito.resizable().frame(width: 150,height: 150)
            Spacer().frame(height: 50)
            VStack{
                (Text(nomeSito) + Text("' s Key")).font(.title).font(.system(size: 30))
                Text(user).font(.subheadline).font(.system(size: 20))
                Divider()
                VStack{
                    HStack{
                        ForEach(Array(randomNumber.enumerated()), id: \.offset){ char in
                            ZStack{
                                RoundedRectangle(cornerRadius: 5, style: .continuous).fill(Color.PurpleAutenthicator).shadow(radius: 5).frame(width: 40,height: 52)
                                Text(String(char.element)).font(.largeTitle).font(.system(size: 20)).foregroundColor(Color.WhiteAutenthicator)
                            }
                        }
                    }
                    ZStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.WhiteAutenthicator).shadow(radius: 5).frame(width: 242,height: 125)
                            VStack{
                                Text("You still have")
                                ZStack{
                                    Circle().trim(from: 0, to: 1).stroke(Color.BlueAutenthicator.opacity(0.09), style: StrokeStyle(lineWidth: 5, lineCap: .round)).frame(width: 60,height: 60)
                                    Circle().trim(from: 0, to: self.to).stroke(Color.BlueAutenthicator, style: StrokeStyle(lineWidth: 5, lineCap: .round)).frame(width: 60,height: 60).rotationEffect(.init(degrees: -90))
                                    VStack{
                                        Text("\(self.count)").font(.title).font(.system(size: 20))
                                    }
                                }
                                Text("for using this key")
                            }
                        }
                    }.onReceive(self.timer) { (_) in
                        if(self.count != 0){
                            self.count -= 1
                            withAnimation(.default){
                                self.to = CGFloat(self.count) / 60
                            }
                        }else{
                            withAnimation(.default){
                                randomNumber = String(Int.random(in: 100000...999999))
                                self.to = 60
                                self.count = 60
                            }
                        }
                    }
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.gray.opacity(0.2))
        
    }
}
