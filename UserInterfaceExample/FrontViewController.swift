//
//  FrontViewController.swift
//  UserInterfaceExample
//
//  Created by Diogo Rodrigues on 9/16/22.
//  Copyright © 2022 Eric Larson. All rights reserved.
//

import UIKit

class FrontViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var recValue: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var nameView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameField.delegate = self
        
        slider.value = 0
        recValue.text = String(Int(slider.value))

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        var name = self.nameField.text
//        var hello_string = "Hello, " + name!
        self.nameView.text = "Hello, " + self.nameField.text!
        return self.nameField.resignFirstResponder()
    }
    
    @IBAction func changeRecVal(_ sender: Any) {
        slider.maximumValue = 10
        slider.minimumValue = 0
        recValue.text = String(Int(slider.value))
    }
    
}
