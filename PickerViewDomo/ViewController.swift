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
        self.myPiker.hidden = true
        self.myToolbar.hidden = true
        self.myLabel.text = NSUserDefaults.standardUserDefaults().objectForKey("mylabel") as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func ShowAlert_btn(sender: UIButton) {
        let alertController = UIAlertController(title: "AlertControler Title", message: "Do You Clicked Button Add Really", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "Add", style: .Default) { (ACTION) -> Void in
            let textField = alertController.textFields![0] as UITextField
            let word = textField.text!
            self.myData.append(word)
            self.myPiker.reloadAllComponents()
        }
        alertController.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (ACTION) -> Void in
            
        }
        alertController.addAction(cancelAction)
        alertController.addTextFieldWithConfigurationHandler { (textfield: UITextField) -> Void in
            textfield.placeholder = "Add New Word"
        }
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func GoogleLoc_btnClicked(sender: UIButton) {
        self.myPiker.hidden   = false
        self.myToolbar.hidden = false
    }
    
    @IBAction func Done_btnClicked(sender: UIBarButtonItem) {
        self.myLabel.text = self.myData[self.myPiker.selectedRowInComponent(0)]
        NSUserDefaults.standardUserDefaults().setValue(self.myLabel.text, forKey: "mylabel")
        self.myPiker.hidden = true
        self.myToolbar.hidden = true
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.myData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.myData[row]
    }
}

