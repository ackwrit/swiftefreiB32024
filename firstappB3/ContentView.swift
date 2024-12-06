//
//  ContentView.swift
//  firstappB3
//
//  Created by Djino Dissingar on 22/10/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var  authVm : AuthViewModel = AuthViewModel()
    
    
    
    var body: some View {
        if(authVm.isFinished){
            if(authVm.isAuth){
                DashBoardView()
            }else{
                LoginView()
            }
        }else {
            Text("En chargement...")
        }
        
        
    }
                
}

#Preview {
    ContentView()
}
