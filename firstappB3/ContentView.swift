//
//  ContentView.swift
//  firstappB3
//
//  Created by Djino Dissingar on 22/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State var mail : String = ""
    @State var pass : String = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                //image
                Image("woman")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 350, height: 150)
                    .cornerRadius(20)
                
                
                //le champ pour le mail
                TextField("Entrer votre mail", text: $mail)
                    .border(.black)
                    .textFieldStyle(.roundedBorder)
                
                
                //le champs pour le password
                SecureField("Entrer votre mot de passe", text: $pass)
                    .border(.black)
                    .textFieldStyle(.roundedBorder)
                
                
                //les boutons de manière horizontal
                Spacer()
                HStack{
                    NavigationLink("Connexion") {
                        DashBoardView()
                    }
                    
                    .foregroundColor(.primary)
                    Button("Inscription") {
                        
                    }
                    .foregroundColor(.primary)
                }
                
                
                
                
                
                
            }
            .padding()
        }
        
        
    }
                
}

#Preview {
    ContentView()
}
