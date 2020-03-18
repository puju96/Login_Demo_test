//
//  WebViewController.swift
//  Login_Demo_Exercise
//
//  Created by Apple on 18/03/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController  {

   
    @IBOutlet weak var webView: WKWebView!
    var token : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webUrl = Constants.weburl + token
      
           let request = URLRequest(url: URL(string:webUrl )!)

           webView?.load(request)
        
    }
    

    @IBAction func logOutPressed(_ sender: Any) {
        
       let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        navigationController?.popToRootViewController(animated: true)
    }
    

}
