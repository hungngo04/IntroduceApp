//
//  ViewController.swift
//  IntroduceStudent
//
//  Created by Tien Hung on 20/12/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var schoolYearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    @IBOutlet weak var numberOfPetsStepper: UIStepper!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    
    let defaults = UserDefaults.standard
    
    @IBAction func stepper(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func introduceDidTapped(_ sender: UIButton) {
        let year = schoolYearSegmentedControl.titleForSegment(at:schoolYearSegmentedControl.selectedSegmentIndex)
        
        let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I am currently in my \(year!) year. I own \(numberOfPetsLabel.text!) dogs. It is \(morePetsSwitch.isOn) that I want more pets."
        
        saveUserIntroductionName();
        
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)

        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
    struct Keys {
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let schoolName = "schoolName"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkForSavedName()
    }
    
    func saveUserIntroductionName() {
        defaults.set(firstNameTextField.text!, forKey: Keys.firstName);
        defaults.set(lastNameTextField.text!, forKey: Keys.lastName);
        defaults.set(schoolNameTextField.text!, forKey: Keys.schoolName);
    }
    
    func checkForSavedName() {
        let firstName = defaults.value(forKey: Keys.firstName) as? String ?? ""
        let lastName = defaults.value(forKey: Keys.lastName) as? String ?? ""
        let schoolName = defaults.value(forKey: Keys.schoolName) as? String ?? ""
    
        firstNameTextField.text = firstName
        lastNameTextField.text = lastName
        schoolNameTextField.text = schoolName
    }
}

