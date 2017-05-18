//
//  PromocoesSingleton.swift
//  PromoApp
//
//  Created by Luzenildo Junior on 17/05/17.
//  Copyright © 2017 Luzenildo-Fernando. All rights reserved.
//

import Foundation

final class PromocoesSingleton{
    
    static let shared = PromocoesSingleton()
    
    init() {
    }
    
    var promotionsArray: [Promotions] = []
}
