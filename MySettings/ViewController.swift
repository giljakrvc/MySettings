//
//  ViewController.swift
//  MySettings
//
//  Created by Joel Gil on 10/28/19.
//  Copyright © 2019 Joel Gil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtEnrollmentDate: UIDatePicker!
    
    @IBOutlet weak var txtFullName: UITextField!
    
    @IBOutlet weak var txthomeCity: UITextField!
    
    @IBOutlet weak var txtPetName: UITextField!
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
    @IBAction func btnSave(_ sender: Any) {
        
        let defaults: UserDefaults = UserDefaults.standard
              defaults.set(self.txtFullName.text, forKey: "fullname")
              defaults.set(self.txthomeCity.text, forKey: "homecity")
              defaults.set(self.txtPetName.text, forKey: "petname")
              defaults.set(self.txtUsername.text, forKey: "username")
              defaults.set(self.txtPassword.text, forKey: "password")
          let dateFormatter = DateFormatter()
              dateFormatter.dateFormat = "MMM d, yyyy" //Your New Date format as per requirement change it own
              let newDate = dateFormatter.string(from:txtEnrollmentDate.date) //pass Date here
              defaults.set(newDate, forKey: "enrollmentdate")
              print(txtEnrollmentDate.date.description)
              defaults.synchronize()
              clear()
      }
      
      override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
          let defaults: UserDefaults = UserDefaults.standard
                if defaults.string(forKey: "fullname") != nil{
                      txtFullName.text = defaults.string(forKey: "fullname")
                }
                if defaults.string(forKey: "homecity") != nil{
                    txthomeCity.text = defaults.string(forKey: "homecity")
                }
                if defaults.string(forKey: "petname") != nil{
                           txtPetName.text = defaults.string(forKey: "petname")
                }
                if defaults.string(forKey: "username") != nil{
                   txtUsername.text = defaults.string(forKey: "username")
                }
                if defaults.string(forKey: "password") != nil{
                   txtPassword.text = defaults.string(forKey: "password")
                }

                if defaults.string(forKey: "enrollmentdate") != nil{
                    let bdate  = defaults.string(forKey: "enrollmentdate")
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MMM d, yyyy" //Your date format
                    let date = dateFormatter.date(from: bdate!) //according to date format your date string
                    txtEnrollmentDate.setDate(date!, animated: true)
                }
      }
      
     func clear()
     {
            txthomeCity.resignFirstResponder()
            txtFullName.resignFirstResponder()
            txtPetName.resignFirstResponder()
            txtUsername.resignFirstResponder()
            txtPassword.resignFirstResponder()
      }


}

