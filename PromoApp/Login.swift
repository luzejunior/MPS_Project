//
//  Login.swift
//  PromoApp
//
//  Created by Luzenildo Junior on 18/05/17.
//  Copyright © 2017 Luzenildo-Fernando. All rights reserved.
//

import Foundation

protocol loginStrategy {
    func SignIn() -> Bool
    func LogOut() -> Bool
}

final class TwitterLogin: loginStrategy {
    func SignIn() -> Bool {
        return true
    }
    
    func LogOut() -> Bool {
        return true
    }
}

final class FacebookLogin: loginStrategy {
    func SignIn() -> Bool {
        return true
    }
    
    func LogOut() -> Bool {
        return true
    }
}

final class Login {
    private var strategy: loginStrategy? = nil
    
    init(strategy: loginStrategy){
        self.strategy = strategy
    }
    
    func SignIn() -> Bool{
        return (self.strategy?.SignIn())!
    }
    
    func LogOut() -> Bool{
        return (self.strategy?.LogOut())!
    }
}
