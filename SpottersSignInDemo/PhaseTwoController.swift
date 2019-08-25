//
//  PhaseTwoController.swift
//  SpottersSignInDemo
//
//  Created by Ibraheem rawlinson on 8/20/19.
//  Copyright © 2019 Ibraheem rawlinson. All rights reserved.
//

import UIKit

class PhaseTwoController: UIViewController {
    // MARK: - Outlets & Properties
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var bodyTypeField: UITextField!
    @IBOutlet weak var dateOfBirthField: UITextField!
    @IBOutlet weak var fitnessGoalField: UITextField!
    private var pickerView = UIPickerView()
    private var datePicker = UIDatePicker()
    private let genders = ["Male","Female","Other"]
    private let bodyTypes = ["Endomorph", "Mesomorph", "Ectomorph"]
    private let goals = ["Build Muscle","Lose Weight","General Fitness"]
    public var currentList = [String]()
    public var currentCategory: UITextField!
    public var gender = ""
    public var bodyType = ""
    public var dateOfBirth = ""
    public var fitnessGoal = ""
    static public var phaseTwoContent = [String]()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        callMethods()
    }
    // MARK: - Actions & Methods
    private func callMethods(){
        setupDatePicker()
        setDelegate()
        setInputView()
        createToolBar()
    }
    private func setupDatePicker(){
        datePicker.datePickerMode = .date
        addDatePickerTarget()
        setupTapGesture()
        dateOfBirthField.inputView = datePicker
    }
    private func addDatePickerTarget(){
        datePicker.addTarget(self, action: #selector(datePickerDidChange), for: .valueChanged)
    }
    @objc private func datePickerDidChange(datePicker picker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateOfBirthField.text = dateFormatter.string(from: picker.date)
        dateOfBirth = dateOfBirthField.text!
        print(dateOfBirth)
        view.endEditing(true)
    }
    private func setupTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewDidTapped))
        view.addGestureRecognizer(tapGesture)
    }
    @objc private func viewDidTapped(){
        view.endEditing(true)
    }
    private func setDelegate(){
        genderField.delegate = self
        bodyTypeField.delegate = self
        fitnessGoalField.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    private func setInputView(){
        genderField.inputView = pickerView
        bodyTypeField.inputView = pickerView
        fitnessGoalField.inputView = pickerView
    }
    private func createToolBar(){
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        let doneBttn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBttnPressed))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBttn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBttnPressed))
        toolBar.setItems([cancelBttn,flexSpace,doneBttn], animated: false)
        genderField.inputAccessoryView = toolBar
        bodyTypeField.inputAccessoryView = toolBar
        fitnessGoalField.inputAccessoryView = toolBar
    }
    @objc private func doneBttnPressed(){
        self.gender = genderField?.text ?? "No GenderValue"
        self.bodyType = bodyTypeField?.text ?? "No BodyType Value"
        self.fitnessGoal = fitnessGoalField?.text ?? "No Fitness Value"
        currentCategory.resignFirstResponder()
        dateOfBirthField.resignFirstResponder()
    }
    
    @objc private func cancelBttnPressed(){
        currentCategory.text = ""
    }
    private func saveInputs(fieldOne gender: String,fieldTwo bodyType: String,fieldThree dob: String,fieldFour fitnessGoal: String){
        PhaseTwoController.phaseTwoContent.append(gender)
        PhaseTwoController.phaseTwoContent.append(bodyType)
        PhaseTwoController.phaseTwoContent.append(dob)
        PhaseTwoController.phaseTwoContent.append(fitnessGoal)
    }
    
    @IBAction func saveBttnPressed(_ sender: UIButton) {
        saveFields()
    }
    private func saveFields(){
        guard let gender = genderField.text, let bodyType = bodyTypeField.text, let fitnessGoal = fitnessGoalField.text, !gender.isEmpty, !bodyType.isEmpty, !fitnessGoal.isEmpty else {
            print("Error with one of the values")
            return
        }
        self.gender = gender
        self.bodyType = bodyType
        self.fitnessGoal = fitnessGoal
       print("\(self.gender), \(self.bodyType), \(self.fitnessGoal), \(self.dateOfBirth)")
        saveInputs(fieldOne: self.gender, fieldTwo: self.bodyType, fieldThree: self.dateOfBirth, fieldFour: self.fitnessGoal)
    }
}

extension PhaseTwoController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        currentCategory = textField
        switch textField {
        case genderField:
            currentList = genders
        case bodyTypeField:
            currentList = bodyTypes
        case fitnessGoalField:
            currentList = goals
        default:
            print("Detfault")
        }
        pickerView.reloadAllComponents()
        return true
    }
    
}

extension PhaseTwoController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currentList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let setNewTitle = currentList[row]
        return setNewTitle
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentCategory.text = currentList[row]
    }
}

extension PhaseTwoController: UIPickerViewDelegate {
    
}
