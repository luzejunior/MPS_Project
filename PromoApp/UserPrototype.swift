//
//  UserPrototype.swift
//  PromoApp
//
//  Created by Luzenildo Junior on 06/06/17.
//  Copyright © 2017 Luzenildo-Fernando. All rights reserved.
//

import Foundation

extension User{
    func clone() -> User{
        return User(userName: self.getUserName(), userEmail: self.getUserEmail(), userPassword: self.getUserPassword(), userCPF: self.getUserCPF(), userCity: self.getUserCity(), userDataNasc: self.getDataNascimento())
    }
}
