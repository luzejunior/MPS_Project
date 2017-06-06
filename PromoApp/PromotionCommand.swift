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
    let promocoesSing = PromocoesSingleton.shared
    var promotion: Promotions?
    
    required init(title: String, desc: String, value: Float){
        self.promotion = Promotions(description: desc, title: title, price: value)
    }
    
    func execute(){
        promocoesSing.promotionsArray.append(self.promotion!)
    }
}

class RemovePromotion: ClassCommand{
    let promocoesSing = PromocoesSingleton.shared
    var promoTitle: String
    
    required init(title: String){
        self.promoTitle = title
    }
    
    func execute(){
        var i: Int = 0
        for entry in promocoesSing.promotionsArray{
            if entry.getPromoTitle == self.promoTitle {
                promocoesSing.promotionsArray[i].changeState(state: DeletedState())
                promocoesSing.promotionsArray.remove(at: i)
                break
            }
            i += 1
        }
    }
}

class BuscaPromotion: ClassCommand{
    let promocoesSing = PromocoesSingleton.shared
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

class ChangePromotion: ClassCommand{
    let promocoesSing = PromocoesSingleton.shared
    var promoTitle: String
    var newTitle: String
    var newDescription: String
    var newValue: String
    
    required init(title: String, newTitle: String, newDescription: String, newValue: String){
        self.promoTitle = title
        self.newTitle = newTitle
        self.newDescription = newDescription
        self.newValue = newValue
    }
    
    func execute(){
        for entry in promocoesSing.promotionsArray{
            if entry.getPromoTitle == self.promoTitle {
                if newTitle != ""{
                    entry.setPromoTitle(title: newTitle)}
                if newValue != ""{
                    entry.setPromoPrice(price: newValue)}
                if newDescription != ""{
                    entry.setPromoDesc(desc: newDescription)
                }
            }
        }
    }
}

class PromotionCommand{
    var addCommand: ClassCommand?
    var removeCommand: ClassCommand?
    var searchCommand: ClassCommand?
    var modifyCommand: ClassCommand?
    var memento = promoMemento.shared
    
    init() {}
    
    func add(title: String, desc: String, value: Float){
        self.addCommand = AddPromotion(title: title, desc: desc, value: value)
        self.addCommand!.execute()
    }
    
    func remove(title: String){
        self.removeCommand = RemovePromotion(title: title)
        self.removeCommand!.execute()
    }
    
    func search(title: String) -> Promotions{
        self.searchCommand = BuscaPromotion(title: title)
        let command = self.searchCommand!.execute() as! BuscaPromotion
        return command.promoSearched
    }
    
    func modify(title: String, newTitle: String, newDesc: String, newValue: String){
        let searched = self.search(title: title)
        self.memento.save(memento: searched)
        self.memento.mem_newTitle = newTitle
        self.modifyCommand = ChangePromotion(title: title, newTitle: newTitle, newDescription: newDesc, newValue: newValue)
        self.modifyCommand?.execute()
    }
    
    func undoModification(){
        self.modifyCommand = ChangePromotion(title: memento.mem_newTitle!, newTitle: (memento.memento?.getPromoTitle)!, newDescription: (memento.memento?.getPromoDescription)!, newValue: (memento.memento?.getPromoPrice)!)
    }
}
