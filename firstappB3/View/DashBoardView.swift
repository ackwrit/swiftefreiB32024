//
//  DashBoardView.swift
//  firstappB3
//
//  Created by Djino Dissingar on 22/10/2024.
//

import SwiftUI

struct DashBoardView: View {
    @StateObject var userVm = UserViewModel(id: FirebaseManager().getUUIUSerFirebase())
    var body: some View {
        TabView(selection: .constant(0)) {
            Text("Toutes les personnes")
                .tabItem {
                    Image(systemName: "person")
                }
            Text("Tous les dossiers")
                .tabItem {
                    Image(systemName: "folder")
                }
            SettingView(userVm : userVm)
                .tabItem {
                    Image(systemName: "gear")
                }
        }
    }
}

#Preview {
    DashBoardView()
}
