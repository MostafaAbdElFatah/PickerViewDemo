//
//  ViewController.swift
//  PickerViewDomo
//
//  Created by Mostafa on 7/15/17.
//  Copyright © 2017 Mostafa. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIPickerViewDataSource ,UIPickerViewDelegate {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myPiker: UIPickerView!
    @IBOutlet weak var myToolbar: UIToolbar!
    var myData:[String] = ["hello","Welcome","Hi","Happy","Very Happy","Thank","Please"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myPiker.dataSource = self
        self.myPiker.delegate = self
        self.myPiker.isHidden = true
        self.myToolbar.isHidden = true
        self.myLabel.text = UserDefaults.standard.object(forKey: "mylabel") as? String
    }

    @IBAction func ShowAlert_btn(_ sender: UIButton) {
        let alertController = UIAlertController(title: "AlertControler Title", message: "Do You Clicked Button Add Really", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Add", style: .default) { (ACTION) -> Void in
            let textField = alertController.textFields![0] as UITextField
            let word = textField.text!
            self.myData.append(word)
            self.myPiker.reloadAllComponents()
        }
        alertController.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (ACTION) -> Void in
            
        }
        alertController.addAction(cancelAction)
        alertController.addTextField { (textfield: UITextField) -> Void in
            textfield.placeholder = "Add New Word"
        }
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func GoogleLoc_btnClicked(_ sender: UIButton) {
        self.myPiker.isHidden   = false
        self.myToolbar.isHidden = false
    }
    
    @IBAction func Done_btnClicked(_ sender: UIBarButtonItem) {
        let text = self.myData[self.myPiker.selectedRow(inComponent: 0)] as String
        self.myLabel.text = text
        UserDefaults.standard.setValue(text, forKey: "mylabel")
        self.myPiker.isHidden = true
        self.myToolbar.isHidden = true
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.myData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.myData[row]
    }
    
}

