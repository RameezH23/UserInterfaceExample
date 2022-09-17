//
//  FrontViewController.swift
//  UserInterfaceExample
//
//  Created by Diogo Rodrigues on 9/16/22.
//  Copyright © 2022 Eric Larson. All rights reserved.
//

import UIKit

class FrontViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var selectionBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pickerView.delegate=self
        pickerView.dataSource=self
    }
    
//    @IBAction func selectPressed(_ sender: UIButton) {
//        
//    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ["1","2","3","4","5","6","7","8","9","10"][row]
    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//    }
}
