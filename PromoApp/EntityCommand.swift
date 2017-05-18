//
//  EntityCommand.swift
//  PromoApp
//
//  Created by Luzenildo Junior on 18/05/17.
//  Copyright © 2017 Luzenildo-Fernando. All rights reserved.
//

import Foundation

protocol EntityCommandProt{
    func execute()
}

class AddEntity: EntityCommandProt{
    
    var anyObjArray = [AnyObject]()
    var anyObj: AnyObject?
    
    required init(anyObj: AnyObject?, anyObjArray: [AnyObject]?){
        self.anyObj = anyObj
        self.anyObjArray = anyObjArray!
    }
    
    func execute() {
        anyObjArray.append(self.anyObj!)
    }
}

class RemoveEntity: EntityCommandProt{
    
    var anyObjArray = [AnyObject]()
    var promoIndice: Int
    
    required init(indice: Int?, anyObjArray: [AnyObject]?){
        self.promoIndice = indice!
        self.anyObjArray = anyObjArray!
    }
    
    func execute() {
        anyObjArray.remove(at: promoIndice)
    }
}

class BuscaEntity: EntityCommandProt{
    
    var anyObjArray = [AnyObject]()
    var anyobjSearched: AnyObject!
    var atIndex: Int!
    
    required init(anyObjArray: [AnyObject]?, atIndex: Int?){
        self.anyObjArray = anyObjArray!
        self.atIndex = atIndex!
    }
    
    func execute(){
        self.anyobjSearched = self.execute()
    }
    
    func execute() -> AnyObject?{
        self.anyobjSearched = self.anyObjArray[atIndex]
        return anyobjSearched
    }
}

class EntityCommand{
    var addCommand: EntityCommandProt
    var removeCommand: EntityCommandProt
    var searchCommand: EntityCommandProt
    
    init() {
        self.addCommand = AddEntity(anyObj: nil, anyObjArray: nil)
        self.removeCommand = RemoveEntity(indice: 0, anyObjArray: nil)
        self.searchCommand = BuscaEntity(anyObjArray: nil, atIndex: 0)
    }
    
    func add(anyObj: AnyObject, anyObjArray: [AnyObject]){
        self.addCommand = AddEntity(anyObj: anyObj, anyObjArray: anyObjArray)
        self.addCommand.execute()
    }
    
    func remove(anyObjArray: [AnyObject], atIndex: Int){
        self.removeCommand = RemoveEntity(indice: atIndex, anyObjArray: anyObjArray)
        self.removeCommand.execute()
    }
    
    func search(anyObjArray: [AnyObject], atIndex: Int) -> AnyObject{
        self.searchCommand = BuscaEntity(anyObjArray: anyObjArray, atIndex: atIndex)
        let search = self.searchCommand.execute() as AnyObject
        return search
    }
}
