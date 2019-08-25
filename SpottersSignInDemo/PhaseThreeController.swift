import UIKit

class PhaseThreeController: UIViewController {
    // MARK: - Outlets & Properties
    static public var daysOfWeek = [String]()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Actions & Methods
    
    @IBAction func monBttnPressed(_ sender: UIButton) {
        PhaseThreeController.daysOfWeek.append("Mon")
    }
    @IBAction func tueBttnPressed(_ sender: UIButton) {
        PhaseThreeController.daysOfWeek.append("Tue")
    }
    
    @IBAction func wedBttnPressed(_ sender: UIButton) {
        PhaseThreeController.daysOfWeek.append("Wed")
    }
    @IBAction func thurBttnPressed(_ sender: UIButton) {
        PhaseThreeController.daysOfWeek.append("Thur")
    }
    @IBAction func friBttnPressed(_ sender: UIButton) {
        PhaseThreeController.daysOfWeek.append("Fri")
    }
    @IBAction func satBttnPressed(_ sender: UIButton) {
        PhaseThreeController.daysOfWeek.append("Sat")
    }
    @IBAction func sunBttnPressed(_ sender: UIButton) {
        PhaseThreeController.daysOfWeek.append("Sun")
    }

}
