import UIKit

class PhaseOneController: UIViewController {
    // MARK: - Outlets & Properties
    static public var fitnessLevelChoice = String()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Actions & Methods
    private func usersChoice(userChoice choice: String){
        PhaseOneController.fitnessLevelChoice = choice
    }

    @IBAction func beginnerBttnPressed(_ sender: UIButton) {
        usersChoice(userChoice: "beginner")
    }

    @IBAction func intermediateBttnPressed(_ sender: UIButton) {
        usersChoice(userChoice: "intermediate")
    }

    @IBAction func expertBttnPressed(_ sender: UIButton) {
        usersChoice(userChoice: "expert")
    }
    
}
