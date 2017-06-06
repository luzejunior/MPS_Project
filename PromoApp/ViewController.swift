//
//  ViewController.swift
//  PromoApp
//
//  Created by Luzenildo Junior on 29/03/17.
//  Copyright © 2017 Luzenildo-Fernando. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let singleton = PromocoesSingleton.shared
    let promCommand = PromotionCommand()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //print("Comecei a rodar")
        
        let promotion = Promotions(description: "Carro Novinho", title: "Fiat Palio", price: 30000.00)
        singleton.promotionsArray.append(promotion)
        
        Facade.addPromotion(title: "Fiat Uno", desc: "Carro Novinho", value: 25000.00)
        //promCommand.add(title: "Carro novo", desc: "Carro Novinho", value: 30000.00)
        
        print(singleton.promotionsArray.count)
        for entry in singleton.promotionsArray{
            print(entry.getPromoTitle)
        }
        
        singleton.promotionsArray[0].changeState(state: ActiveState())
        print(singleton.promotionsArray[0].getState)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

