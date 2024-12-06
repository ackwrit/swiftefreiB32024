//
//  FirebaseManager.swift
//  firstappB3
//
//  Created by Djino Dissingar on 22/10/2024.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class FirebaseManager{
    //attributs
    static let shared = FirebaseManager()
    var auth : Auth
    var cloudFirestore : Firestore
    
    var userRef : CollectionReference{
        return cloudFirestore.collection("UTILISATEURS")
    }
    
    
    
    
    init(){
        auth = Auth.auth()
        cloudFirestore = Firestore.firestore()
        
    }
    
    
    
    //méthode
    //creer un utilisateur
    func createUserFirebase(uuid : String ,datas : [String:Any]){
        userRef.document(uuid).setData(datas)
        
    }
    
    
    //mettre à jour un utilisateur
    func updateUserFirebase(uuid : String ,datas : [String:Any]){
        userRef.document(uuid).updateData(datas)
        
    }
    
    
    
    //se déconnecter
    func logoutFirebase(){
        do{
            try auth.signOut()
        }catch{
            print("erreur de déconnexion")
        }
    }
    
    
    //récupérer l'uuid d'un utilisateur
    func getUUIUSerFirebase()->String{
        return auth.currentUser?.uid ?? ""
    }
    
    
    
}
