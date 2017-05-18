//
//  EntityCommand.swift
//  PromoApp
//
//  Created by Luzenildo Junior on 17/05/17.
//  Copyright © 2017 Luzenildo-Fernando. All rights reserved.
//

import Foundation

protocol ClassCommand{
    func execute()
}

class AddPromotion: ClassCommand{
    let promocoesSing = PromocoesSingleton()
    var promotion: Promotions?
    
    required init(title: String, desc: String, value: Float){
        self.promotion = Promotions(description: desc, title: title, price: value)
    }
    
    func execute(){
        promocoesSing.promotionsArray.append(self.promotion!)
    }
}

class RemovePromotion: ClassCommand{
    let promocoesSing = PromocoesSingleton()
    var promoTitle: String
    
    required init(title: String){
        self.promoTitle = title
    }
    
    func execute(){
        var i: Int = 0
        for entry in promocoesSing.promotionsArray{
            if entry.getPromoTitle == self.promoTitle {
                promocoesSing.promotionsArray.remove(at: i)
                break
            }
            i += 1
        }
    }
}

class BuscaPromotion: ClassCommand{
    let promocoesSing = PromocoesSingleton()
    var promoTitle: String
    var promoSearched: Promotions!
    
    required init(title: String){
        self.promoTitle = title
    }
    
    func execute(){
        promoSearched = execute()
    }
    
    func execute() -> Promotions?{
        for entry in promocoesSing.promotionsArray{
            if entry.getPromoTitle == self.promoTitle {
                promoSearched = entry
                break
            }
        }
        return promoSearched
    }
}

class PromotionCommand{
    var addCommand: ClassCommand
    var removeCommand: ClassCommand
    var searchCommand: ClassCommand
    
    init() {
        self.addCommand = AddPromotion(title: "", desc: "", value: 0.00)
        self.removeCommand = RemovePromotion(title: "")
        self.searchCommand = BuscaPromotion(title: "")
    }
    
    func add(title: String, desc: String, value: Float){
        self.addCommand = AddPromotion(title: title, desc: desc, value: value)
        self.addCommand.execute()
    }
    
    func remove(title: String){
        self.removeCommand = RemovePromotion(title: title)
        self.removeCommand.execute()
    }
    
    func search(title: String) -> Promotions{
        self.searchCommand = BuscaPromotion(title: title)
        let command = self.searchCommand.execute() as! BuscaPromotion
        return command.promoSearched
    }
}
