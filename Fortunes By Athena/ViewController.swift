//
//  ViewController.swift
//  Fortunes By Athena
//
//  Created by Dominic Minischetti III on 10/7/18.
//  Copyright © 2018 minischetti. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var heroPicker: UIPickerView!
    
    @IBOutlet weak var fortuneLabel: UILabel!

    var selectedHero: Hero?;
    
    var currentFortune: String?;

    var heroes: [Hero] = [
        Hero(
            name: "Ana",
             image: "IMAGEPATH",
             fortunes: [
                "Ana's first fortune.",
                "Ana's second fortune.",
                "Ana's third fortune."
            ]),
        Hero(name: "Winston",
             image: "IMAGEPATH",
             fortunes: [
                "Winston's first fortune.",
                "Winston's second fortune.",
                "Winston's third fortune."
            ])
    ]
    
    //    Number of columns in picker view... for example, time has three (hours, minutes, seconds)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return heroes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return heroes[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        selectedHero = heroes[row];
    }

    func generateFortune() {
        let fortuneCount: Int = selectedHero?.fortunes.count ?? 0
        let randomFortune: Int = Int.random(in: 0 ... fortuneCount)
        fortuneLabel.text = selectedHero?.fortunes[randomFortune]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        heroPicker.delegate = self
        heroPicker.dataSource = self
    }


}

