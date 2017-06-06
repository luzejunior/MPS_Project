//
//  StateObserver.swift
//  PromoApp
//
//  Created by Luzenildo Junior on 06/06/17.
//  Copyright © 2017 Luzenildo-Fernando. All rights reserved.
//

import Foundation

final class StateObserver: ObserverObject{
    
    func willChange(promotionTitle: String, newValue: Any?) {
        let value = newValue as! State
        
        if value.state == ActiveState().state{
            print("Parabéns, o status da sua promoção mudou para Ativo!")
        }
        
        if value.state == InactiveState().state{
            print("Infelizmente a sua promoção continua inativa.")
        }
        
        if value.state == DeletedState().state{
            print("A sua promoção foi deletada")
        }
    }
}
