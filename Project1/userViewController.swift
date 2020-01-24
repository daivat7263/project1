//
//  userViewController.swift
//  Project1
//
//  Created by COE-02 on 06/01/20.
//  Copyright © 2020 COE-02. All rights reserved.
//

import UIKit

class userViewController: UIViewController {
    
    
    @IBOutlet weak var imgview: UIImageView!
    
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var emaillbl: UILabel!
    @IBOutlet weak var citylbl: UILabel!
    @IBOutlet weak var genderlbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
