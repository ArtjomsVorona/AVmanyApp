//
//  TempConvertViewController.swift
//  AVmanyApp
//
//  Created by Artjoms Vorona on 01/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import UIKit

class TempConvertViewController: UIViewController {
    
    @IBOutlet weak var celsiusLabel: UILabel!
    
    @IBOutlet weak var tempSlider: UISlider!
    
    @IBOutlet weak var convertedTempLabel: UILabel!
    
    @IBOutlet weak var tempSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tempSliderChanged(_ sender: UISlider, forEvent event: UIEvent) {
        updateTempLabelsForSlider(value: sender.value)
    }
    
    @IBAction func tempSegmentedControllChanged(_ sender: UISegmentedControl) {
        updateTempLabelsForSlider(value: tempSlider.value)
    }
    
    func convertTempFrom(celsius: Int) -> (fahrenheit: Double, kelvin: Double) {
        let fahrenheit = (Double(celsius) * 9 / 5) + 32
        let kelvin = Double(celsius) + 273.15
        return (fahrenheit, kelvin)
    }
    
    func updateTempLabelsForSlider(value: Float) {
        let celsiusTemp = Int(value)
        celsiusLabel.text = "\(celsiusTemp) °C"
        
        //converting temperature and setting labels according to selected segment in UISegmentedControll
        var convertedTempString = ""
        switch tempSegmentedControl.selectedSegmentIndex {
        case 0:
            let fahrenheitTempString = String(format: "%.2F", convertTempFrom(celsius: celsiusTemp).fahrenheit)
            convertedTempString = fahrenheitTempString + " °F"
        default:
            let kelvinTempString = String(format: "%.2F", convertTempFrom(celsius: celsiusTemp).kelvin)
            convertedTempString = kelvinTempString + " °K"
        }
        convertedTempLabel.text = convertedTempString
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TempSID" {
            let vc = segue.destination as! AppInfoViewController
            vc.infoText = "TempConvert converts temperature from Celsius to Fahrenheit or Kelvin."
        }
    }
    

}
