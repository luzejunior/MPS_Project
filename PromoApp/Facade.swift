//
//  Facade.swift
//  PromoApp
//
//  Created by Luzenildo Junior on 18/05/17.
//  Copyright © 2017 Luzenildo-Fernando. All rights reserved.
//

import Foundation

public class Facade{
    
    private static let singleton = PromocoesSingleton()
    private static let commands = EntityCommand()
    
    public class func addPromotion(title: String, desc: String, value: Float){
        let newPromotion = Promotions(description: desc, title: title, price: value)
        commands.add(anyObj: newPromotion, anyObjArray: singleton.promotionsArray)
    }
    
    public class func removePromotion(title: String){
        var i: Int = 0
        for entry in singleton.promotionsArray{
            if entry.getPromoTitle == title {
                commands.remove(anyObjArray: singleton.promotionsArray, atIndex: i)
                break
            }
            i += 1
        }
    }
    
    class func buscaPromotion(title: String) -> Promotions? {
        var i: Int = 0
        while i < singleton.promotionsArray.count{
            let searchedPromotion = commands.search(anyObjArray: singleton.promotionsArray, atIndex: i) as! Promotions
            if searchedPromotion.getPromoTitle == title{
                return searchedPromotion
            }else{
                i += 1
            }
        }
        return nil
    }
}
