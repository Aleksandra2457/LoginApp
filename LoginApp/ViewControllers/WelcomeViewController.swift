//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Александра Лесовская on 16.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var welcomeUserLabel: UILabel!
    
    // MARK: - Public Properties
    var user: User!
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeUserLabel.text = "Welcome, \(user.person.fullName)!"
        tabBarItem.title = "Home"
        setupGradient()
    }
    
    // MARK: - Private Methods
    private func setupGradient() {
        let topColor = UIColor(
            red: 221 / 255,
            green: 206 / 255,
            blue: 255 / 255,
            alpha: 1
        ).cgColor
        let bottomColor = UIColor(
            red: 54 / 255,
            green: 0 / 255,
            blue: 110 / 255,
            alpha: 0.5
        ).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [topColor, bottomColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
