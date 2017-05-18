//
//  UserSingleton.swift
//  PromoApp
//
//  Created by Luzenildo Junior on 17/05/17.
//  Copyright © 2017 Luzenildo-Fernando. All rights reserved.
//

import Foundation

final class UserSingleton{
    
    private var userName: String = ""
    private var userEmail: String = ""
    private var userPassword: String = ""
    
    static let shared = UserSingleton()
    
    private init(){
        
    }
    
    func setUserName(name: String){
        self.userName = name
    }
    
    func setUserEmail(email: String){
        self.userEmail = email
    }
    
    func setUserPassword(pass: String){
        self.userPassword = pass
    }
    
    func getUserName() -> String{
        return self.userName
    }
    
    func getUserEmail() -> String{
        return self.userEmail
    }
    
    func getUserPassword() -> String{
        return self.userPassword
    }
}
