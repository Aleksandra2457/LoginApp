//
//  AboutMeViewController.swift
//  LoginApp
//
//  Created by Александра Лесовская on 16.03.2022.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var personalInfoLabel: UILabel!
    
    // MARK: - Public Properties
    var user: User!
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        personalInfoLabel.text = "\(user.person.description)"
    }

}
