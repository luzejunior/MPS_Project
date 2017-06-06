//
//  ObserverProtocol.swift
//  PromoApp
//
//  Created by Luzenildo Junior on 06/06/17.
//  Copyright © 2017 Luzenildo-Fernando. All rights reserved.
//

import Foundation

protocol ObserverObject: class{
    func willChange(promotionTitle: String, newValue: Any?)
}
