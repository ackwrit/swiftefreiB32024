//
//  Utilisateur.swift
//  firstappB3
//
//  Created by Djino Dissingar on 22/10/2024.
//

import Foundation
struct Utilisateur : Identifiable {
    //attributs
    var id : String
    var _userName : String?
    var _email : String?
    var _birthday : Date?
    var _avatar : String?
    
    
    
    var userName : String {
        return _userName ?? ""
    }
    
    var email : String {
        return _email ?? ""
    }
    
    var birthday : Date {
        return _birthday ?? Date()
    }
    var avatar : String {
        return _avatar ?? ""
    }
    
    init(id : String , dict : [String:Any]) {
        self.id = id
        self._userName = dict["USERNAME"] as? String
        self._email = dict["EMAIL"] as? String
        self._birthday = dict["BIRTHDAY"] as? Date
        self._avatar = dict["AVATAR"] as? String
        
    }
    
    
    
    
    
    
    
    
    
    
    
}
