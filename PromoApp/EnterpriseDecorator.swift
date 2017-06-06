//
//  EnterpriseUserDecorator.swift
//  PromoApp
//
//  Created by Luzenildo Junior on 06/06/17.
//  Copyright © 2017 Luzenildo-Fernando. All rights reserved.
//

import Foundation

class EnterpriseUserDecorator{
    
    private var normalUser: User?
    private var userStoreAddress: String = ""
    private var userStoreTelephone: String = ""
    private var userStoreCNPJ: String = ""
    
    init(user: User, storeAdd: String, storeTel: String, storeCNPJ: String) {
        self.normalUser = user
        self.userStoreAddress = storeAdd
        self.userStoreTelephone = storeTel
        self.userStoreCNPJ = storeCNPJ
    }
    
    public var getUserStoreAddres: String{
        return self.userStoreAddress
    }
    
    public var getUserStoreTel: String{
        return self.getUserStoreTel
    }
    
    public var getUserStoreCNPJ: String{
        return self.getUserStoreCNPJ
    }
}
