//
//  AlertDialog.swift
//  Plants
//
//  Created by Riki on 11/21/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import UIKit

class AlertDialog {
    static func showAlert(message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        viewController.present(alert, animated: true, completion: nil)
    }
}
