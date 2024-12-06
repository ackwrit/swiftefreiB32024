//
//  AuthViewModel.swift
//  firstappB3
//
//  Created by Djino Dissingar on 22/10/2024.
//

import Foundation
import Firebase
import FirebaseAuth


class AuthViewModel : ObservableObject {
    var manager = FirebaseManager.shared
    
    @Published var isFinished : Bool = false
    @Published var isAuth : Bool = false
    @Published var showError : Bool = false
    var errorMessage : String = ""
    
    var datas : [String:Any] = [:]
    var auth : Auth{
        return manager.auth
    }
    
    
    //constructeur
    init(){
        observeAuthentification()
    }
    
    func observeAuthentification(){
        auth.addStateDidChangeListener(handleListener)
    }
    
    
    func handleListener(auth : Auth, user : User?) -> Void{
        self.isFinished = true
        //notation condensé
        self.isAuth = user != nil
        //notation plus détaillé
        if(user != nil){
            self.isAuth = true
        }else{
            self.isAuth = false
        }
        
    }
    //connexion
    func signIn(email : String, password : String){
        auth.signIn(withEmail: email, password: password,completion: completionSignIn)
    }
    
    func completionSignIn(authDataResult : AuthDataResult?, error : Error?){
        if let erreur = error {
            self.errorMessage = erreur.localizedDescription
            self.showError = true
        }
        
    }
    
    func SignUp(email : String, password : String, useName : String){
        auth.createUser(withEmail: email, password: password) { authDataResult, error in
            if let erreur = error {
                self.errorMessage = erreur.localizedDescription
                self.showError = true
            }
            
            if let data = authDataResult{
                self.isAuth = true
                var uid = authDataResult!.user.uid
                self.datas = ["EMAIL": email,"USERNAME":useName]
                self.manager.createUserFirebase(uuid: uid, datas: self.datas)
            }
            
        }
    }
    
    
   
    
    
    
}
