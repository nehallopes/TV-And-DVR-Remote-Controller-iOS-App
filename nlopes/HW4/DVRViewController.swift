//
//  DVRViewController.swift
//  HW4
//
//  Created by CDMStudent on 2/16/24.
//

import UIKit

class DVRViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Pwr_status.text = Pwr_val
        State_status.text = "\(state_val)"
    }

    // All my initial values
    var turnOn_remote: Bool = false
    var Pwr_val:String = "Off"
    var state_val:String = "Stopped"

    // Here it will enable all once remote is turned on
    func EnableAll() {
        let Enable_DisEnable = turnOn_remote

        Play_btn.isEnabled = Enable_DisEnable
        Pause_btn.isEnabled = Enable_DisEnable
        Stop_btn.isEnabled = Enable_DisEnable
        Ff_btn.isEnabled = Enable_DisEnable
        Fr_btn.isEnabled = Enable_DisEnable
        Record_btn.isEnabled = Enable_DisEnable
       }
    
    // Here below I have included all the labels
    @IBOutlet weak var Pwr_status: UILabel!

    @IBOutlet weak var State_status: UILabel!
    
    //Here is the power switch
    @IBAction func Pwr_switch(_ sender: Any) {
        turnOn_remote.toggle()
        Pwr_status.text = turnOn_remote ? "On" : "Off"
        EnableAll()
    }
    
    // Here are all the buttons
    @IBOutlet weak var Play_btn: UIButton!
    @IBAction func Play_btn(_ sender: Any) {
        state_val = "Playing"
        State_status.text = "\(state_val)"
    }
    
    @IBOutlet weak var Pause_btn: UIButton!
    @IBAction func Pause_btn(_ sender: Any) {
        if State_status.text == "Playing"{
            state_val = "Paused"
            State_status.text = "\(state_val)"
        }
        else {
            let temp_Ops = "\(state_val)"
            let Display_msg = "Cannot Pause while \(temp_Ops)"
            let Action_sheet = UIAlertController(title: "Invalid Operation", message: Display_msg, preferredStyle: .actionSheet)
            
            Action_sheet.addAction(UIAlertAction(title: "Force", style: .destructive, handler: { _ in
                self.state_val = "Paused"
                self.State_status.text = "\(self.state_val)"
                
                let Force_Ops = UIAlertController(title: "Force Operation", message: "Pause operation succeeded", preferredStyle: .alert)
                Force_Ops.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(Force_Ops, animated: true, completion: nil)
            }))
            
            Action_sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            }))
            
            present(Action_sheet, animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var Stop_btn: UIButton!
    @IBAction func Stop_btn(_ sender: Any) {
        state_val = "Stopped"
        State_status.text = "\(state_val)"
    }
    
    @IBOutlet weak var Ff_btn: UIButton!
    @IBAction func Ff_btn(_ sender: Any) {
        if State_status.text == "Playing"{
            state_val = "Fast Forwarding"
            State_status.text = "\(state_val)"
        }
        else {
            let temp_Ops = "\(state_val)"
            let Display_msg = "Cannot Fast Forward while \(temp_Ops)"
            let Action_sheet = UIAlertController(title: "Invalid Operation", message: Display_msg, preferredStyle: .actionSheet)
            
            Action_sheet.addAction(UIAlertAction(title: "Force", style: .destructive, handler: { _ in
                self.state_val = "Fast Forwarding"
                self.State_status.text = "\(self.state_val)"
                
                let Force_Ops = UIAlertController(title: "Force Operation", message: "Fast Forward operation succeeded", preferredStyle: .alert)
                Force_Ops.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(Force_Ops, animated: true, completion: nil)
            }))
            
            Action_sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            }))
            
            present(Action_sheet, animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var Fr_btn: UIButton!
    @IBAction func Fr_btn(_ sender: Any) {
        if State_status.text == "Playing"{
            state_val = "Fast Rewinding"
            State_status.text = "\(state_val)"
        }
        else {
            let temp_Ops = "\(state_val)"
            let Display_msg = "Cannot Fast Rewind while \(temp_Ops)"
            let Action_sheet = UIAlertController(title: "Invalid Operation", message: Display_msg, preferredStyle: .actionSheet)
            
            Action_sheet.addAction(UIAlertAction(title: "Force", style: .destructive, handler: { _ in
                self.state_val = "Fast Rewinding"
                self.State_status.text = "\(self.state_val)"
                
                let Force_Ops = UIAlertController(title: "Force Operation", message: "Fast Rewind operation succeeded", preferredStyle: .alert)
                Force_Ops.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(Force_Ops, animated: true, completion: nil)
            }))
            
            Action_sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            }))
            
            present(Action_sheet, animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var Record_btn: UIButton!
    @IBAction func Record_btn(_ sender: Any) {
        if State_status.text == "Stopped"{
            state_val = "Recording"
            State_status.text = "\(state_val)"
        }
        else {
            let temp_Ops = "\(state_val)"
            let Display_msg = "Cannot Record while \(temp_Ops)"
            let Action_sheet = UIAlertController(title: "Invalid Operation", message: Display_msg, preferredStyle: .actionSheet)
            
            Action_sheet.addAction(UIAlertAction(title: "Force", style: .destructive, handler: { _ in
                self.state_val = "Recording"
                self.State_status.text = "\(self.state_val)"
                
                let Force_Ops = UIAlertController(title: "Force Operation", message: "Record operation succeeded", preferredStyle: .alert)
                Force_Ops.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(Force_Ops, animated: true, completion: nil)
            }))
            
            Action_sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            }))
            
            present(Action_sheet, animated: true, completion: nil)
        }
    }
}
