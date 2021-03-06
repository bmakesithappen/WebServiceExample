//
//  ViewController.swift
//  WebServiceExample
//
//  Created by Bernard Désert on 10/17/17.
//  Copyright © 2017 Bernard Désert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // API Key 883f34fa10bc4cf6dcf044fae47008ad
    // TODO: Add SwiftyJSON https://github.com/SwiftyJSON/SwiftyJSON
    
    
    @IBOutlet weak var forecastLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let manager = AFHTTPSessionManager()
        
        
        manager.get("http://api.openweathermap.org/data/2.5/weather?q=London&mode=json&units=metric&cnt=1&appid=883f34fa10bc4cf6dcf044fae47008ad", // this is a different ap request than the one listed in the lesson please @AHALL
            parameters: nil,
            progress: nil,
            success: { (operation: URLSessionDataTask, responseObject:Any?) in
                if let responseObject = responseObject {
                    print("Response: " + (responseObject as AnyObject).description)
                }
                let json = JSON(responseObject)
                if let forecast = json["weather"][0]["description"].string {
                    self.forecastLabel.text = forecast
                }
                // Here is the code without using Swifty: 
//                if let weatherList = (responseObject as AnyObject)["weather"] as? [AnyObject] {
//                    if let weather = weatherList[0] as? [String:AnyObject] {
//                        if let forecast = weather["description"] as? String {
//                            self.forecastLabel.text = forecast
//                        }
//                    }
//                }
        }) { (operation:URLSessionDataTask?, error:Error) in
            print("Error: " + error.localizedDescription)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

