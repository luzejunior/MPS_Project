//
//  UserPrototype.swift
//  PromoApp
//
//  Created by Luzenildo Junior on 06/06/17.
//  Copyright © 2017 Luzenildo-Fernando. All rights reserved.
//

import Foundation

extension Promotions{
    func clone() -> Promotions{
        return Promotions(description: self.getPromoDescription, title: self.getPromoTitle, price: Float(self.getPromoPrice)!)
    }
}
