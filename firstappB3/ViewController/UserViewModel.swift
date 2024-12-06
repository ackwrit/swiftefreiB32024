//
//  UserViewModel.swift
//  firstappB3
//
//  Created by Djino Dissingar on 22/10/2024.
//

import Foundation
import Firebase

class UserViewModel : ObservableObject {
    @Published var utilisateur : Utilisateur?
    var manager = FirebaseManager.shared
    
    
    init(id : String) {
        getUserWithId(id : id)
    }
    
    func getUserWithId(id : String){
        manager.userRef.document(id).addSnapshotListener(resultat)
    }
    
    func resultat(snap: DocumentSnapshot?,error :Error?){
        DispatchQueue.main.async{
            guard let snapshot = snap else {return}
            let id = snapshot.documentID
            let datas = snapshot.data() ?? [:]
            let newUser = Utilisateur(id: id, dict: datas)
            self.utilisateur = newUser
            
        }
        
    }
   
}
