//
//  ViewController.swift
//  SwiftyDB
//
//  Created by Øyvind Grimnes on 08/17/2016.
//  Copyright (c) 2016 Øyvind Grimnes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let configuration: Configuration = {
        var configuration = Configuration(databaseName: "database.sqlite")
        
        configuration.mode = .sandbox
        
        return configuration
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        try? NSFileManager.defaultManager().removeItemAtPath(configuration.databasePath)
        
        let swifty = Swifty(configuration: configuration)
    
//        swifty.delete(Dog.self, resultHandler: nil)
        
        let dogs: [Dog] = (0 ..< 1200).map { _ in Dog() }
        
        let addStart = NSDate()
        swifty.add(dogs) { result in
            print("Added:", -addStart.timeIntervalSinceNow, result)
            
            let start = NSDate()
            
            swifty.get(Dog.self).filter("age" < 50).sortBy("name", ascending: false) { result in
                print(result.value?.count)
                print("Get:", -start.timeIntervalSinceNow)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

