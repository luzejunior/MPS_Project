//
//  UserSingleton.swift
//  PromoApp
//
//  Created by Luzenildo Junior on 17/05/17.
//  Copyright © 2017 Luzenildo-Fernando. All rights reserved.
//

import Foundation

final class UserSingleton{
    
    static let shared = UserSingleton()
    
    private init(){
    }
    
    var user: AnyObject?
}
