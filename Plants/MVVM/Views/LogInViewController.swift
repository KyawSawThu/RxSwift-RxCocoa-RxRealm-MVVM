//
//  LogInViewController.swift
//  Plants
//
//  Created by Riki on 11/20/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import UIKit
import LGSideMenuController
import FirebaseAuth

class LogInViewController: UIViewController {
    
    static let identifier = "LogInViewController"

    @IBOutlet weak var ivLogo: UIImageView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogIn: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        didUserLogIn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()

    }
    
    fileprivate func initUI() {
        ivLogo.transform = CGAffineTransform(rotationAngle: -120)
        txtEmail.roundCorners(tLeft: 12, tRight: 0, bLeft: 12, bRight: 0)
        txtPassword.roundCorners(tLeft: 12, tRight: 0, bLeft: 12, bRight: 0)
        btnLogIn.roundCorners(tLeft: 0, tRight: 12, bLeft: 0, bRight: 12)
        btnSignUp.roundCorners(tLeft: 12, tRight: 0, bLeft: 12, bRight: 0)
        
        txtPassword.isSecureTextEntry = true
    }
    
    fileprivate func navigateToHome() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LGSideMenuController") as! LGSideMenuController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    fileprivate func signIn(email: String, password: String) {
        if isDataValidate() {
            Auth.auth().signIn(withEmail: email, password: password) { (dataResult, error) in
                if let err = error {
                    AlertDialog.showAlert(message: err.localizedDescription, viewController: self)
                } else {
                    self.navigateToHome()
                }
            }
        } else {
            AlertDialog.showAlert(message: SharedConstants.ErrorMessage.ValidateError, viewController: self)
        }
    }
    
    fileprivate func didUserLogIn() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.navigateToHome()
            }
        }
    }
    
    fileprivate func isDataValidate()-> Bool {
        if txtEmail.text != ""
            && (txtPassword.text!.count) > 7{
            return true
        } else {
            return false
        }
    }
    
    @IBAction func onClickLogIn(_ sender: Any) {
        let email = txtEmail.text!
        let password = txtPassword.text!
        signIn(email: email, password: password)
    }
    
    @IBAction func onClickSignUp(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: SignUpViewController.identifier) as! SignUpViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
}
