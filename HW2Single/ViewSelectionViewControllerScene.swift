//
//  ViewSelectionViewControllerScene.swift
//  HW2Single
//
//  Created by Lohith Nimmal on 5/16/18.
//  Copyright © 2018 Brian. All rights reserved.
//

import UIKit


protocol ViewSelectionViewControllerSceneDelegate {
    func settingsChanged(distanceUnits: String, bearingUnits: String)
}




class ViewSelectionViewControllerScene: UIViewController {

    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var bunits: UILabel!
    @IBOutlet weak var dunits: UILabel!
    @IBOutlet weak var picker1: UIPickerView!
    var pickerData : [String] = [String] ()
    var pickerData1 : [String] = [String] ()
    var selection : String = "Miles"
    var belection : String = "Degrees"
    var delegate : ViewSelectionViewControllerSceneDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerData = [ "Kilometers" , "Miles"]
        self.pickerData1 = [ "Degress" , "Mils"]
        self.picker.delegate = self
        self.picker.dataSource = self
        
        
        
        dunits.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewSelectionViewControllerScene.tapFunction))
        dunits.isUserInteractionEnabled = true
        dunits.addGestureRecognizer(tap)
        
        
        bunits.isUserInteractionEnabled = true
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(ViewSelectionViewControllerScene.tapFunction1))
        bunits.isUserInteractionEnabled = true
        bunits.addGestureRecognizer(tap1)
        
        // Do any additional setup after loading the view.
    }

    @objc func tapFunction(sender:UITapGestureRecognizer) {
        
        self.pickerData = [ "Kilometers" , "Miles"]
        picker.reloadAllComponents()
        print( "distance clicked")
    }
    
    @objc func tapFunction1(sender:UITapGestureRecognizer) {
        
        self.pickerData = [ "Degrees" , "Mils"]
        picker.reloadAllComponents()
        print ( "Bearing Clicked")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue : UIStoryboardSegue, sender : Any?)
    {
        guard let vc = segue.destination as? ViewController else { return}
        vc.dstring = dunits.text!
        vc.bstring = bunits.text!
        
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let d = self.delegate {
            dunits.text = selection
            bunits.text = belection
            d.settingsChanged(distanceUnits: selection, bearingUnits: belection )
        }
    }
    
}


extension ViewSelectionViewControllerScene : UIPickerViewDataSource, UIPickerViewDelegate {
    // The number of columns of data
    func numberOfComponents(in: UIPickerView) -> Int
    {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return self.pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
        if (self.pickerData[0] == "Kilometers"){
            dunits.text = self.pickerData[row]
            self.selection = self.pickerData[row]
        } else{
            bunits.text = self.pickerData[row]
            self.belection = self.pickerData[row]
            
        }
    }
}

