//
//  MyAlamofire.swift
//  TemplateProject
//
//  Created by Ersun Alkan on 06/05/15.
//  Copyright (c) 2015 EA. All rights reserved.
//

import UIKit
import Alamofire


    func MyAlamofire()->Manager
    {
        var headers = Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders ?? [:]
        headers["X-Mashape-Key"] = "61LuWzdOjGmshj1VDcIhiJFKIbXzp1BO5sNjsnBKmsJxqlokb0"
        headers["Accept"] = "application/json"
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.HTTPAdditionalHeaders = headers
        return Alamofire.Manager(configuration: configuration)
        
    }


class MyHelper: NSObject
{
    
    
    
   
}
