//
//  LoginView.swift
//  firstappB3
//
//  Created by Djino Dissingar on 22/10/2024.
//

import SwiftUI

struct LoginView: View {
    @State var mail : String = ""
    @State var pass : String = ""
    @State var username : String = ""
    @State var tag = 0
    @StateObject var authVm = AuthViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Picker("Compte", selection: $tag) {
                        Text("Inscription").tag(0)
                        Text("Connexion").tag(1)
                    }
                    .pickerStyle(.segmented)
                    
                    //image
                    Image("woman")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 350, height: 150)
                        .cornerRadius(20)
                    if(tag == 0){
                        TextField("Entrer votre nom", text: $username)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    
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
                    Button {
                        if(tag == 0){
                            authVm.SignUp(email: mail, password: pass, useName: username)
                        }else {
                            authVm.signIn(email: mail, password: pass)
                        }
                    } label: {
                        Text("Validation")
                    }

                    
                    
                    
                    
                    
                    
                }
                .padding()
            }
        }
    }
}

#Preview {
    LoginView()
}
