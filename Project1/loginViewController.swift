//
//  ViewController.swift
//  Project1
//
//  Created by COE-02 on 02/01/20.
//  Copyright © 2020 COE-02. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    
    var dbObj:projectManager?
    
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbObj = projectManager()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

