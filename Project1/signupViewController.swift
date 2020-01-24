//
//  signupViewController.swift
//  Project1
//
//  Created by COE-02 on 06/01/20.
//  Copyright © 2020 COE-02. All rights reserved.
//

import UIKit

class signupViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource, UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate
{
    var arr:[String] = []
    var db = projectManager()
    var pickerView = UIPickerView()
    
    var Gender = ["Male","Female","Others"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arr.count
    }
    func  pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arr[row]
    
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        city.text = arr[row]
        self.view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        city.inputView = pickerView
    }
    @IBOutlet weak var imgview: UIImageView!
    
    @IBAction func imgbtn(_ sender: UIButton)
    {
        let imgcontroller = UIImagePickerController()
            imgcontroller.delegate = self
            imgcontroller.sourceType = UIImagePickerControllerSourceType.photoLibrary
    self.present(imgcontroller, animated: true , completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imgview.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var namelbl: UITextField!
    @IBOutlet weak var emaillbl: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var conpass: UITextField!
  
    @IBAction func signup(_ sender: UIButton)
    {
        let imgdata = UIImageJPEGRepresentation(imgview.image!, 1.0)
        let gender = Gender[segment.selectedSegmentIndex]
        
        let cmd = "INSERT INTO tbl1  (UserImage,UserName,Emailid,Password,City,Gender) VALUES ('\(imgdata!)','\(namelbl.text!)','\(emaillbl.text!)','\(pass.text!)','\(city.text!)','\(gender)')"
        
        let alertview = UIAlertController(title: "Details", message: "Data is Submit?",preferredStyle: .alert)
        
        let btnResign = UIAlertAction(title: "Ok", style: .cancel)
        {
            (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertview.addAction(btnResign)
        
        self.present(alertview, animated: true)
        {
            print("After View Present")
        }
        if db.RunCommand(cmdText: cmd)
        {
            print("Inserted")
        }
        else
        {
            print("Not Inserted")
        }
        
    }
   
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBAction func switch1(_ sender: UISwitch)
    {
        pass.isSecureTextEntry = !(pass.isSecureTextEntry)
    }
    @IBAction func switch2(_ sender: UISwitch)
    {
        pass.isSecureTextEntry = !(pass.isSecureTextEntry)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arr=["Ahmedabad","Vadodara","Surat","Porbandar","Rajkot","Kheda","Bharuch","Mehasana","Amreli","Panchmahal","Navsari","Dang","Diu","Daman","Kutch","Gandhinagar","Vavol","Patan","Surendranagar","Junagadh"]
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
