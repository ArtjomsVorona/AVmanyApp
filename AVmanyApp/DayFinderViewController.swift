//
//  DayFinderViewController.swift
//  AVmanyApp
//
//  Created by Artjoms Vorona on 01/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import UIKit

class DayFinderViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var weekdayLabel: UILabel!
    
    @IBOutlet weak var findButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayTextField.delegate = self
        monthTextField.delegate = self
        yearTextField.delegate = self
    }

    @IBAction func findButtonTapped(_ sender: UIButton) {
        guard let day = Int(dayTextField.text!) else {
            basicAlert(title: "", message: "Day field is empty.")
            return
        }
        guard let month = Int(monthTextField.text!) else {
            basicAlert(title: "", message: "Month field is empty.")
            return
        }
        guard let year = Int(yearTextField.text!) else {
            basicAlert(title: "", message: "Year field is empty.")
            return
        }
        
        switch findButton.titleLabel?.text {
        case "Find":
            findButton.setTitle("Clear", for: .normal)
            if day >= 1 && day <= 31 && month >= 1 && month <= 12 {
                weekdayLabel.text = findWeekday(day: day, month: month, year: year)
            } else {
                basicAlert(title: "Wrong date!", message: "Please enter correct date.")
            }
        default:
            findButton.setTitle("Find", for: .normal)
            clearFields()
        }
    }
    
    func findWeekday(day: Int, month: Int, year: Int) -> String {
        var dateComponents = DateComponents()
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        let calendar = Calendar.current
        if let dateToFind = calendar.date(from: dateComponents) {
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateFormat = "EEEE"
            let weekday = dateFormatter.string(from: dateToFind)
            
            dateFormatter.dateStyle = .medium
            let dateString = dateFormatter.string(from: dateToFind)
            
            return weekday + " " + dateString
        } else {
            return "Unable to find date"
        }
    }
    
    func clearFields() {
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        weekdayLabel.text = "Find weekday for any date"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DayFinderSID" {
            let vc = segue.destination as! AppInfoViewController
            vc.infoText = "DayFinder helps to find exact weekday for the given date."
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        findButton.setTitle("Find", for: .normal)
    }
    

}
