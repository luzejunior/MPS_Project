//
//  User.swift
//  PromoApp
//
//  Created by Luzenildo Junior on 06/06/17.
//  Copyright © 2017 Luzenildo-Fernando. All rights reserved.
//

import Foundation

public class User{
    
    private var userName: String = ""
    private var userEmail: String = ""
    private var userPassword: String = ""
    private var CPF_Number: String = ""
    private var city: String = ""
    private var dataNascimento: String = ""
    private var isAdm: Bool = false
    
    init(userName: String, userEmail: String, userPassword: String, userCPF: String, userCity: String, userDataNasc: String) {
        self.userName = userName
        self.userEmail = userEmail
        self.userPassword = userPassword
        self.CPF_Number = userCPF
        self.city = userCity
        self.dataNascimento = userDataNasc
    }
    
    func setUserName(userName: String){
        self.userName = userName
    }
    
    func setUserEmail(userEmail: String){
        self.userEmail = userEmail
    }
    
    func setUserPass(userPass: String){
        self.userPassword = userPass
    }
    
    func setUserCPF(userCPF: String){
        self.CPF_Number = userCPF
    }
    
    func setUserCity(userCity: String){
        self.city = userCity
    }
    
    func setUserDataNasc(dataNasc: String){
        self.dataNascimento = dataNasc
    }
    
    func getUserName() -> String{
        return self.userName
    }
    
    func getUserEmail() -> String{
        return self.userEmail
    }
    
    func getUserPassword() -> String{
        return self.userPassword
    }
    
    func getUserCPF() -> String{
        return self.CPF_Number
    }
    
    func getUserCity() -> String{
        return self.city
    }
    
    func getDataNascimento() -> String{
        return self.dataNascimento
    }
    
    func changeADM(){
        self.isAdm = true
    }
}
