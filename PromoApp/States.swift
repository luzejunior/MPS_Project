//
//  States.swift
//  PromoApp
//
//  Created by Luzenildo Junior on 06/06/17.
//  Copyright © 2017 Luzenildo-Fernando. All rights reserved.
//

import Foundation

protocol State {
    var state: String{get set}
}

class ActiveState: State {
    var state: String = "Ativo"
}

class InactiveState: State {
    var state: String = "Inactive"
}

class DeletedState: State {
    var state: String = "Deleted"
}

class InProgressState: State{
    var state: String = "Em Progresso"
}
