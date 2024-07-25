//
//  ConfigurationViewController.swift
//  HW4
//
//  Created by CDMStudent on 2/23/24.
//

import UIKit

class ConfigurationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    var singleton = Singleton.shared
    
    @IBOutlet weak var Config_label: UILabel!
    
    @IBOutlet weak var Btn_label: UILabel!
    
    @IBOutlet weak var Lbl_label: UILabel!
    
    @IBOutlet weak var Ch_label: UILabel!
    
    @IBOutlet weak var Ch_value2: UILabel!
    
    @IBOutlet weak var segmentedControl2: UISegmentedControl!
    
    @IBOutlet weak var Lbl_value: UITextView!
    @IBAction func Lbl_value(_ sender: UITextView) {
        Lbl_value.text = sender.text
    }
    
    @IBOutlet weak var Step_btn: UIStepper!
    @IBAction func Step_btn(_ sender: UIStepper) {
        let val = Int(sender.value)
        Ch_value2.text = "\(val)"
    }
    
    @IBAction func Cancel_btn(_ sender: Any) {
        Ch_value2.text = "1"
        Step_btn.value = 1
        Lbl_value.text = ""
    }
    
    @IBOutlet weak var Save_btn: UIButton!
    @IBAction func Save_btn(_ sender: Any) {
        let Current_index = segmentedControl2.selectedSegmentIndex
        let Current_label = Lbl_value.text ?? ""
        let Current_channel = Int(Step_btn.value)

        if Current_label.count > 0 && Current_label.count < 5 {
            singleton.Change_Ch(atIndex: Current_index, withLabel: Current_label, andChannel: Current_channel)
        }
        else {
            let alert = UIAlertController(title: "Invalid label length", message: "Label must be 1-4 characters long",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
