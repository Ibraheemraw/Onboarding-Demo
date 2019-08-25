//
//  PhaseFiveController.swift
//  SpottersSignInDemo
//
//  Created by Ibraheem rawlinson on 8/20/19.
//  Copyright © 2019 Ibraheem rawlinson. All rights reserved.
//

import UIKit

struct User {
    let fitnessLevelChoice: String
    let classification: [String]
    let days: [String]
    let times: [String]
    let workOuts: [String]
}



class PhaseFiveController: UIViewController {
    // MARK: - Outlets & Properties
    static public var workouts = [String]()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Actions & Methods
    @IBAction func chestBttnPressed(_ sender: UIButton) {
        PhaseFiveController.workouts.append("chest")
        
    }
    @IBAction func backBttnPressed(_ sender: UIButton) {
        PhaseFiveController.workouts.append("back")
        
    }
    @IBAction func buttBttnPressed(_ sender: UIButton) {
        PhaseFiveController.workouts.append("butt")
        
    }
    @IBAction func absBttnPressed(_ sender: UIButton) {
        PhaseFiveController.workouts.append("abs")
        
    }
    @IBAction func legsPressed(_ sender: UIButton) {
        PhaseFiveController.workouts.append("legs")
        
    }
    @IBAction func armsBttnPressed(_ sender: UIButton) {
        PhaseFiveController.workouts.append("arms")
        
    }
    
    @IBAction func doneBttnPressed(_ sender: UIButton) {
       saveInfo()
    }
    private func saveInfo(){
        let user = User(fitnessLevelChoice: PhaseOneController.fitnessLevelChoice, classification: PhaseTwoController.phaseTwoContent, days: PhaseThreeController.daysOfWeek, times: PhaseFourController.times, workOuts: PhaseFiveController.workouts)
        let alert = UIAlertController(title: "Done", message: "User: \(user)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
