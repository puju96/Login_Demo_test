//
//  DataServiceManager.swift
//  Login_Demo_Exercise
//
//  Created by Apple on 18/03/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class DataServiceManager {
    
    static let Global = DataServiceManager()
    
    
    
    func authenticateUser(emailId : String , password : String) -> String
    {
        let url = Constants.loginUrl + "{" + emailId + ":" + password + "}"
        
        Alamofire.request(url, method: .post).responseJSON { (responseData) in
            
            if let headerFields = responseData.response?.allHeaderFields as? [String: String], let URL = responseData.request?.url
                   {
                        let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: URL)
                    print(cookies.count)
                    
                   }
        }
        return Constants.APIKey1
}

}
