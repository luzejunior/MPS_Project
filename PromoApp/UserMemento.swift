//
//  UserMemento.swift
//  PromoApp
//
//  Created by Luzenildo Junior on 06/06/17.
//  Copyright © 2017 Luzenildo-Fernando. All rights reserved.
//

import Foundation

typealias Memento = User

protocol abstractMemento{
    var memento: Memento{get set}
}

class userMemento: abstractMemento{
    var memento: Memento
    
    init(user: User) {
        self.memento = user
    }
    
    func undo() -> Memento{
        return self.memento
    }
}
