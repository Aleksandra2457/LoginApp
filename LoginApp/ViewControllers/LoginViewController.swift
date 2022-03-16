//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Александра Лесовская on 16.03.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var forgotUserNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    // MARK: - Private Properties
    let user = User.getUserData()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        forgotUserNameButton.titleLabel?.adjustsFontSizeToFitWidth = true
        forgotPasswordButton.titleLabel?.adjustsFontSizeToFitWidth = true
        passwordTextField.enablesReturnKeyAutomatically = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as? UITabBarController
        guard let viewControllers = tabBarController?.viewControllers else { return }
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutMeVC = navigationVC.topViewController as? AboutMeViewController
                navigationVC.tabBarItem.title = "\(user.person.name) \(user.person.surname)"
                aboutMeVC?.user = user
            }
        }
    }
    
    // hiding the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        checkUserNameAndPassword()
    }
    
    @IBAction func oneOfForgotButtonsPressed(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your name is \(user.login) 😌")
        : showAlert(title: "Oops!", message: "Your password is \(user.password) 😌")
    }
    
    @IBAction func unwindFor(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
    // MARK: - Public Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            checkUserNameAndPassword()
        }
        return true
    }
    
    // MARK: - Private Methods
    private func checkUserNameAndPassword() {
        if userNameTextField.text == user.login && passwordTextField.text == user.password {
            performSegue(withIdentifier: "ToWelcomeViewController", sender: UIButton.self)
        } else {
            showAlert(
                title: "Invalid login or password",
                message: "Please enter correct login or password",
                textField: passwordTextField
            )
        }
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}
