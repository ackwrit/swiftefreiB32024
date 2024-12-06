//
//  SettingView.swift
//  firstappB3
//
//  Created by Djino Dissingar on 06/12/2024.
//

import SwiftUI

struct SettingView: View {
    @State var prenom: String = ""
    @State var nom: String = ""
    @StateObject var userVm: UserViewModel
    var body: some View {
        VStack{
            Image("woman")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 400,height: 200)
            
            Text(userVm.utilisateur?.userName ?? "")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .font(.largeTitle)
            List{
                Section {
                    HStack {
                        TextField("Mon prénom", text: $prenom)
                        Button {
                            print("modifier")
                        } label: {
                            Image(systemName: "plus")
                        }

                    }
                }
                
                
                Section {
                    HStack {
                        TextField("Mon nom", text: $nom)
                        Button {
                            print("modifier")
                        } label: {
                            Image(systemName: "plus")
                        }

                    }
                }
            }
            
        }
    }
}


