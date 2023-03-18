//
//  Alertable.swift
//  NewsApp
//
//  Created by Agustinch on 18/03/2023.
//

import UIKit

public protocol Alertable {}
public extension Alertable where Self: UIViewController {

    func showAlert(title: String = "", message: String, preferredStyle: UIAlertController.Style = .alert, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: completion)
    }
}
