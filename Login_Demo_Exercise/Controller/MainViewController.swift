//
//  ViewController.swift
//  Login_Demo_Exercise
//
//  Created by Apple on 18/03/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    var token : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UserDefaults.standard.string(forKey: Constants.isLoggedInKey) != nil)
             {
                 performSegue(withIdentifier: "webViewSegue", sender: nil)
             }
        
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.userId.text = ""
        self.password.text = ""
    }

    @IBAction func LoginBtnPressed(_ sender: Any) {
        self.token =   DataServiceManager.Global.authenticateUser(emailId: userId.text!, password: password.text!)
        
        UserDefaults.standard.set(true, forKey: Constants.isLoggedInKey)
        UserDefaults.standard.set(token, forKey: Constants.APIkey)
     
        
        performSegue(withIdentifier: "webViewSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "webViewSegue" {
            let controller = segue.destination as! WebViewController
            controller.token = self.token
        }
    }
}

