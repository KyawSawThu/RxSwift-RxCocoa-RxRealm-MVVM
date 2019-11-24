//
//  SignUpViewController.swift
//  Plants
//
//  Created by Riki on 11/21/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    static let identifier = "SignUpViewController"
    
    @IBOutlet weak var ivLogo: UIImageView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        
    }
    
    fileprivate func initUI() {
        ivLogo.transform = CGAffineTransform(rotationAngle: 120)
        txtName.roundCorners(tLeft: 0, tRight: 12, bLeft: 0, bRight: 12)
        txtEmail.roundCorners(tLeft: 0, tRight: 12, bLeft: 0, bRight: 12)
        txtPassword.roundCorners(tLeft: 0, tRight: 12, bLeft: 0, bRight: 12)
        txtConfirmPassword.roundCorners(tLeft: 0, tRight: 12, bLeft: 0, bRight: 12)
        btnSignUp.roundCorners(tLeft: 12, tRight: 0, bLeft: 12, bRight: 0)
        btnBack.underline()
        
        txtPassword.isSecureTextEntry = true
        txtConfirmPassword.isSecureTextEntry = true
        
    }
    
    @IBAction func onClickSignUp(_ sender: Any) {
        if isDataValidate() {
            let name = txtName.text!
            let email = txtEmail.text!
            let password = txtPassword.text!
            
            Auth.auth().createUser(withEmail: email, password: password) { (dataResult, error) in
                if let err = error {
                    AlertDialog.showAlert(message: err.localizedDescription, viewController: self)
                } else if let data = dataResult {
                    let newAccount = Account(id: data.user.uid, name: name, email: email)
                    newAccount.save()
                    self.signIn(email: email, password: password)
                }
            }
            
        } else {
            AlertDialog.showAlert(message: SharedConstants.ErrorMessage.ValidateError, viewController: self)
        }
    }
    
    fileprivate func isDataValidate()-> Bool {
        if txtName.text != ""
            && txtEmail.text != ""
            && (txtPassword.text!.count) > 7
            && txtPassword.text == txtConfirmPassword.text
        {
            return true
        } else {
            return false
        }
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    fileprivate func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (dataResult, error) in
            if let err = error {
                AlertDialog.showAlert(message: err.localizedDescription, viewController: self)
            } else {
                print("Success.")
            }
        }
    }
    
    
}
