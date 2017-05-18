//
//  EntityCommand.swift
//  PromoApp
//
//  Created by Luzenildo Junior on 18/05/17.
//  Copyright © 2017 Luzenildo-Fernando. All rights reserved.
//

import Foundation

protocol EntityCommandProt{
    func execute() -> [AnyObject]
}

class AddEntity: EntityCommandProt{
    
    var anyObjArray = [AnyObject]()
    var anyObj: AnyObject?
    
    required init(anyObj: AnyObject?, anyObjArray: [AnyObject]?){
        self.anyObj = anyObj
        if anyObjArray != nil{
            self.anyObjArray = anyObjArray!
        }
    }
    
    func execute() -> [AnyObject]{
        self.anyObjArray.append(self.anyObj!)
        return self.anyObjArray
    }
}

class RemoveEntity: EntityCommandProt{
    
    var anyObjArray = [AnyObject]()
    var promoIndice: Int
    
    required init(indice: Int?, anyObjArray: [AnyObject]?){
        self.promoIndice = indice!
        if anyObjArray != nil{
            self.anyObjArray = anyObjArray!
        }
    }
    
    func execute() -> [AnyObject]{
        anyObjArray.remove(at: promoIndice)
        return self.anyObjArray
    }
}

class BuscaEntity: EntityCommandProt{
    
    var anyObjArray = [AnyObject]()
    var anyobjSearched: AnyObject!
    var atIndex: Int!
    
    required init(anyObjArray: [AnyObject]?, atIndex: Int?){
        if anyObjArray != nil{
            self.anyObjArray = anyObjArray!
        }
        self.atIndex = atIndex!
    }
    
    func execute() -> [AnyObject]{
        self.anyobjSearched = self.anyObjArray[atIndex]
        return anyObjArray
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
    
    func add(anyObj: AnyObject, anyObjArray: [AnyObject]) -> [AnyObject]{
        self.addCommand = AddEntity(anyObj: anyObj, anyObjArray: anyObjArray)
        return self.addCommand.execute()
    }
    
    func remove(anyObjArray: [AnyObject], atIndex: Int) -> [AnyObject]{
        self.removeCommand = RemoveEntity(indice: atIndex, anyObjArray: anyObjArray)
        return self.removeCommand.execute()
    }
    
    func search(anyObjArray: [AnyObject], atIndex: Int) -> AnyObject{
        self.searchCommand = BuscaEntity(anyObjArray: anyObjArray, atIndex: atIndex)
        let search = self.searchCommand.execute() as AnyObject
        return search
    }
}
