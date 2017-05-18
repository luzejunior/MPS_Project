//
//  Promotions.swift
//  PromoApp
//
//  Created by Luzenildo Junior on 17/05/17.
//  Copyright © 2017 Luzenildo-Fernando. All rights reserved.
//

import Foundation

class Promotions{
    
    private var promoDescription: String = ""
    private var promoTitle: String = ""
    private var promoPrice: Float = 0.00
    
    public var getPromoDescription: String{
        return self.promoDescription
    }
    
    public var getPromoTitle: String{
        return self.promoTitle
    }
    
    public var getPromoPrice: String{
        let priceString = "R$\(promoPrice)"
        return priceString
    }
    
    init(description: String, title: String, price: Float) {
        self.promoDescription = description
        self.promoTitle = title
        self.promoPrice = price
    }
}
