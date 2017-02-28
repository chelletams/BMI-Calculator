//
//  ViewController.swift
//  BMICalculator
//
//  Created by Yui Tamaki on 2/13/17.
//  Copyright © 2017 Yui Tamaki. All rights reserved.
//

import UIKit

class BMICalculator {
    var height:Double
    var weight:Double
    var bmi:Double = 0
    var conversionFactor:Double = 703.0704
    
    init (height:Double, weight:Double) {
        self.height = height
        self.weight = weight
    }
    
    func bmiMetric() -> Double {
        return weight / (height * height)
    }
    
    func bmiUS() -> Double {
        bmi = (weight / (height * height)) * conversionFactor
        return bmi
    }
}

class ViewController: UIViewController, UITextFieldDelegate {
    //MARK: Properties
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var metricSwitch: UISwitch!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var bmiImageView: UIImageView!

    override func viewDidLoad() {
        //Hide keyboard when user taps anywhere outside the text field
        super.viewDidLoad(self.hideKeyboard())
        
        bmiImageView.image = UIImage (named: "normal")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    @IBAction func metricSwitchToggle(_ sender: UISwitch) {
        if sender.isOn {
            heightTextField.text = ""
            weightTextField.text = ""
            resultLabel.text = ""
            heightTextField.placeholder = "m"
            weightTextField.placeholder = "kg"
            bmiImageView.image = UIImage (named: "normal")
        } else {
            heightTextField.text = ""
            weightTextField.text = ""
            resultLabel.text = ""
            heightTextField.placeholder = "in"
            weightTextField.placeholder = "lb"
            bmiImageView.image = UIImage (named: "normal")
        }
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        let weight = Double(weightTextField.text!)
        let height = Double(heightTextField.text!)
        let bmi = BMICalculator(height:height!, weight:weight!)
        var str = ""
        //let str = String(format: "Normal Range", bmi)
        //bmi = weight! / (height! * height!)
        
        if metricSwitch.isOn {
            if bmi.bmiMetric() >= 0 && bmi.bmiMetric() < 16.00 {
                str = String(format: "%.2f Severe Thinness", bmi.bmiMetric())
                bmiImageView.image = UIImage (named: "severeThinness")
            }
            else if bmi.bmiMetric() >= 16.00 && bmi.bmiMetric() <= 16.99 {
                str = String(format: "%.2f Moderate Thinness", bmi.bmiMetric())
                bmiImageView.image = UIImage (named: "moderateThinness")
            }
            else if bmi.bmiMetric() >= 17.00 && bmi.bmiMetric() <= 18.49 {
                str = String(format: "%.2f Mild Thinness", bmi.bmiMetric())
                bmiImageView.image = UIImage (named: "mildThinness")
            }
            else if bmi.bmiMetric() >= 18.50 && bmi.bmiMetric() <= 24.99 {
                str = String(format: "%.2f Normal Range", bmi.bmiMetric())
                bmiImageView.image = UIImage (named: "normal")
            }
            else if bmi.bmiMetric() >= 25.00 && bmi.bmiMetric() <= 29.99 {
                str = String(format: "%.2f Overweight", bmi.bmiMetric())
                bmiImageView.image = UIImage (named: "overweight")
            }
            else if bmi.bmiMetric() >= 30.00 && bmi.bmiMetric() <= 34.99 {
                str = String(format: "%.2f Obese Class I (Moderate)", bmi.bmiMetric())
                bmiImageView.image = UIImage (named: "obeseI")

            }
            else if bmi.bmiMetric() >= 35.00 && bmi.bmiMetric() <= 39.99 {
                str = String(format: "%.2f Obese Class II (Severe)", bmi.bmiMetric())
                bmiImageView.image = UIImage (named: "obeseI")
            }
            else if bmi.bmiMetric() > 39.99 {
                str = String(format: "%.2f Obese Class III (Very Severe)", bmi.bmiMetric())
                bmiImageView.image = UIImage (named: "obeseI")
            }
        } else {
            if bmi.bmiUS() >= 0 && bmi.bmiUS() < 16.00 {
                str = String(format: "%.2f Severe Thinness", bmi.bmiUS())
                bmiImageView.image = UIImage (named: "severeThinness")
            }
            else if bmi.bmiUS() >= 16.00 && bmi.bmiUS() <= 16.99 {
                str = String(format: "%.2f Moderate Thinness", bmi.bmiUS())
                bmiImageView.image = UIImage (named: "moderateThinness")
            }
            else if bmi.bmiUS() >= 17.00 && bmi.bmiUS() <= 18.49 {
                str = String(format: "%.2f Mild Thinness", bmi.bmiUS())
                bmiImageView.image = UIImage (named: "mildThinness")
            }
            else if bmi.bmiUS() >= 18.50 && bmi.bmiUS() <= 24.99 {
                str = String(format: "%.2f Normal Range", bmi.bmiUS())
                bmiImageView.image = UIImage (named: "normal")
            }
            else if bmi.bmiUS() >= 25.00 && bmi.bmiUS() <= 29.99 {
                str = String(format: "%.2f Overweight", bmi.bmiUS())
                bmiImageView.image = UIImage (named: "overweight")
            }
            else if bmi.bmiUS() >= 30.00 && bmi.bmiUS() <= 34.99 {
                str = String(format: "%.2f Obese Class I (Moderate)", bmi.bmiUS())
                bmiImageView.image = UIImage (named: "obeseI")
            }
            else if bmi.bmiUS() >= 35.00 && bmi.bmiUS() <= 39.99 {
                str = String(format: "%.2f Obese Class II (Severe)", bmi.bmiUS())
                bmiImageView.image = UIImage (named: "obeseI")
            }
            else if bmi.bmiUS() > 39.99 {
                str = String(format: "%.2f Obese Class III (Very Severe)", bmi.bmiUS())
                bmiImageView.image = UIImage (named: "obeseI")
            }
        }
        
        resultLabel.text = str
    }
    
}

/*Source code from http://stackoverflow.com/questions/32281651/how-to-dismiss-keyboard-when-touching-anywhere-outside-uitextfield-in-swift/32281860
 */
extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

