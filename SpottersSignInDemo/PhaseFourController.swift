//
//  PhaseFourController.swift
//  SpottersSignInDemo
//
//  Created by Ibraheem rawlinson on 8/20/19.
//  Copyright © 2019 Ibraheem rawlinson. All rights reserved.
//

import UIKit

class PhaseFourController: UIViewController {
    // MARK: - Outlets & Properties
    static public var times = [String]()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Actions & Methods
    @IBAction func morningBttnPressed(_ sender: UIButton) {
        PhaseFourController.times.append("morning")
    }
    @IBAction func noonBttnPressed(_ sender: UIButton) {
        PhaseFourController.times.append("noon")
    }
    @IBAction func nightBttnPressed(_ sender: UIButton) {
        PhaseFourController.times.append("night")
    }

}
