//
//  ViewController.swift
//  HW4
//
//  Created by Rohan Panchal on 1/29/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Pwr_status.text = Pwr_val
        
        Ch_num.text = "\(Ch_value)"
        
        segmentedControl.accessibilityIdentifier = "Favorite_Channel_Segmented_Control"
        
        Vol_Value(Vol_val)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Seg_initials()
    }
    
     // All my initial values
    var Ch_value:Int = 50
    var turnOn_remote: Bool = false
    var Pwr_val:String = "Off"
    var cnt_Ch_num: [Int] = []

       // Here is the function I used for displaying channels
    func ShowChannel(displayy: String) {
        if let nxt_Num = Int(displayy){
            cnt_Ch_num.append(nxt_Num)
            
            if cnt_Ch_num.count == 2 {
                Ch_value = cnt_Ch_num[0] * 10 + cnt_Ch_num[1]
                Ch_num.text = String(format: "%02d", Ch_value)
                cnt_Ch_num.removeAll()
            }
        }
    }

     // Here it will enable all once remote power is turned on
    func EnableAll() {
        let Enable_DisEnable = turnOn_remote

        Vol_val.isEnabled = Enable_DisEnable
        btn_0.isEnabled = Enable_DisEnable
        btn_1.isEnabled = Enable_DisEnable
        btn_2.isEnabled = Enable_DisEnable  
        btn_3.isEnabled = Enable_DisEnable
        btn_4.isEnabled = Enable_DisEnable
        btn_5.isEnabled = Enable_DisEnable
        btn_6.isEnabled = Enable_DisEnable
        btn_7.isEnabled = Enable_DisEnable
        btn_8.isEnabled = Enable_DisEnable
        btn_9.isEnabled = Enable_DisEnable
        ch_up.isEnabled = Enable_DisEnable
        ch_down.isEnabled = Enable_DisEnable
        segmentedControl.isEnabled = Enable_DisEnable
       }
    
       // Here below I have included all the labels
    @IBOutlet weak var Pwr_status: UILabel!
    
    @IBOutlet weak var Speaker_val: UILabel!
    
    @IBOutlet weak var Ch_num: UILabel!
    
      // Here below I have put segmentedcontrol
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        Update_fav(withIndex: sender.selectedSegmentIndex)
    }
    
    func Seg_initials() {
        for (index, channel) in Singleton.shared.Fav_Ch.enumerated() {
            segmentedControl.setTitle(channel.Seg_label, forSegmentAt: index)
        }
        segmentedControl.selectedSegmentIndex = 0
    }

    func Update_fav(withIndex index: Int) {
        guard index >= 0 && index < Singleton.shared.Fav_Ch.count else {
            return
        }
        
        Ch_value = Singleton.shared.Fav_Ch[index].Seg_ch
        Ch_num.text = "\(Ch_value)"
        
        let Ch_label = Singleton.shared.Fav_Ch[index].Seg_label
        Singleton.shared.Change_Ch(atIndex: index, withLabel: Ch_label, andChannel: Ch_value)
        segmentedControl.setTitle(Ch_label, forSegmentAt: index)
    }
    
    //Here is the power switch
    @IBAction func pwr_switch(_ sender: Any) {
        turnOn_remote.toggle()
        Pwr_status.text = turnOn_remote ? "On" : "Off"
        EnableAll()
    }
    
     // Here is the volume slider
    @IBOutlet weak var Vol_val: UISlider!
    @IBAction func Vol_Value(_ sender: UISlider) {
        let Spk_val = Int(sender.value)
        Speaker_val.text = "\(Spk_val)"
    }
    
     // Here are all the buttons below
    @IBOutlet weak var btn_0: UIButton!
    @IBAction func btn_0(_ sender: Any) {
        ShowChannel(displayy : "0")
    }
    
    @IBOutlet weak var btn_1: UIButton!
    @IBAction func btn_1(_ sender: Any) {
        ShowChannel(displayy : "1")
    }
    
    @IBOutlet weak var btn_2: UIButton!
    @IBAction func btn_2(_ sender: Any) {
        ShowChannel(displayy : "2")
    }
    
    @IBOutlet weak var btn_3: UIButton!
    @IBAction func btn_3(_ sender: Any) {
        ShowChannel(displayy : "3")
    }
    
    @IBOutlet weak var btn_4: UIButton!
    @IBAction func btn_4(_ sender: Any) {
        ShowChannel(displayy : "4")
    }
    
    @IBOutlet weak var btn_5: UIButton!
    @IBAction func btn_5(_ sender: Any) {
        ShowChannel(displayy : "5")
    }
    
    @IBOutlet weak var btn_6: UIButton!
    @IBAction func btn_6(_ sender: Any) {
        ShowChannel(displayy : "6")
    }
    
    @IBOutlet weak var btn_7: UIButton!
    @IBAction func btn_7(_ sender: Any) {
        ShowChannel(displayy : "7")
    }
    
    @IBOutlet weak var btn_8: UIButton!
    @IBAction func btn_8(_ sender: Any) {
        ShowChannel(displayy : "8")
    }
    
    @IBOutlet weak var btn_9: UIButton!
    @IBAction func btn_9(_ sender: Any) {
        ShowChannel(displayy : "9")
    }
    
    @IBOutlet weak var ch_up: UIButton!
    @IBAction func ch_up(_ sender: Any) {
        Ch_value = Ch_value + 1
        if Ch_value <= 99 {
            Ch_num.text = "\(Ch_value)"
        }
        else {
            Ch_value = 01
            Ch_num.text = "\(Ch_value)"
        }
        cnt_Ch_num.removeAll()
    }
    
    @IBOutlet weak var ch_down: UIButton!
    @IBAction func ch_down(_ sender: Any) {
        Ch_value = Ch_value - 1
        if Ch_value >= 01 {
            Ch_num.text = "\(Ch_value)"
        }
        else {
            Ch_value = 99
            Ch_num.text = "\(Ch_value)"
        }
        cnt_Ch_num.removeAll()
    }
}

