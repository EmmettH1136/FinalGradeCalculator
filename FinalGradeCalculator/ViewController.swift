//
//  ViewController.swift
//  FinalGradeCalculator
//
//  Created by Emmett Hasley on 10/25/18.
//  Copyright © 2018 John Heresy High School. All rights reserved.
//

import UIKit

var grades = [String]()
var grades2 = [String]()
let currentColor = UIColor(red: 1.0, green: 185.0/255.0, blue: 145.0/255.0, alpha: 1.0)
let redColor = UIColor(red: 1.0, green: 112.0/255.0, blue: 83.0/255.0, alpha: 1.0)
let greenColor = UIColor(red: 146.0/255.0, green: 221.0/255.0, blue: 145.0/255.0, alpha: 1.0)

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var picker1: UIPickerView!
    @IBOutlet weak var picker2: UIPickerView!
    @IBOutlet weak var extraCredit: UILabel!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        result.text = ""
        view.backgroundColor = currentColor
        grades = ["A", "B", "C", "D"]
        grades2 = ["A", "B", "C", "D"]
        self.picker1.dataSource = self
        self.picker1.delegate = self
        self.picker2.dataSource = self
        self.picker2.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func calculateGrade(_ current: Float,_ desired: Float, _ final: Float) -> Float {
        let finall : Float = final / 100
        var bigFinal : Float = 0.0
        let top = Float(desired - (1 - finall) * current)
        print(top)
        bigFinal = (top / finall)
        return Float(bigFinal)
        //        Required = (Goal − Current × (100% − Final Weight)) / Final Weight
    }
    @IBAction func whenButtonPressed(_ sender: Any) {
        
        if let bings = textField1.text?.lowercased().trimmingCharacters(in: CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz")){
            if let bangs = textField2.text?.lowercased().trimmingCharacters(in: CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz")){
                if let wangs = textField3.text?.lowercased().trimmingCharacters(in: CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz")){
                    if bings == "" || bangs == "" || wangs == "" {
                        result.text = "Try Again"
                    } else {
                        result.text = String(calculateGrade(Float(bings)!, Float(bangs)!, Float(wangs)!)) + "%"
                        if Float(calculateGrade(Float(bings)!, Float(bangs)!, Float(wangs)!)) > 100.0 {
                            view.backgroundColor = redColor
                            extraCredit.text = "You should ask for extra credit."
                        } else if Float(calculateGrade(Float(bings)!, Float(bangs)!, Float(wangs)!)) <= 100.0 {
                            view.backgroundColor = greenColor
                            extraCredit.text = "Good luck on that test!"
                        }
                    }
                } else {
                    result.text = "Try Again"
                }
                
                
            } else {
                result.text = "Try Again"
            }
            
        } else {
            result.text = "Try Again"
        }
        if result.text == "Try Again" {
            view.backgroundColor = currentColor
            extraCredit.text = ""
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return grades2.count
        } else {
            return grades.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return grades2[row]
        } else {
            return grades[row]
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
            self.textField1.text = grades[row]
            switch textField1.text{
            case "A":
                textField1.text = String(90)
            case .none:
                print("uh oh")
            case "B" :
                textField1.text = String(80)
            case "C" :
                textField1.text = String(70)
            case "D" :
                textField1.text = String(60)
            case .some(_):
                print("Uh idk")
            default :
                print("yuhoh")
        }
        } else {
            self.textField2.text = grades[row]
            switch textField2.text{
            case "A":
                textField2.text = String(90)
            case .none:
                print("uh oh")
            case "B" :
                textField2.text = String(80)
            case "C" :
                textField2.text = String(70)
            case "D" :
                textField2.text = String(60)
            case .some(_):
                print("Uh idk")
            default :
                print("yuhoh")
            }
        }
        
    }
}
