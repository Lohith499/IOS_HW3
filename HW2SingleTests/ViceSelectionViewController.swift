//
//  MakeSelectionViewController.swift
//  DelegationDemo
//
//  Created by Jonathan Engelsma on 2/10/17.
//  Copyright © 2017 Jonathan Engelsma. All rights reserved.
//

import UIKit

protocol ViceSelectionViewControllerDelegate {
    func indicateSelection(vice: String)
}

class ViceSelectionViewController: UIViewController {

    @IBOutlet weak var picker: UIPickerView!
    
    var pickerData: [String] = [String]()
    var selection : String = "Steak"
    var delegate : ViceSelectionViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerData = ["Steak", "Ice Cream", "Beer", "Omlettes"]
        self.picker.delegate = self
        self.picker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let d = self.delegate {
            d.indicateSelection(vice: selection)
        }
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

extension ViceSelectionViewController : UIPickerViewDataSource, UIPickerViewDelegate {
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
        self.selection = self.pickerData[row]
    }
}

