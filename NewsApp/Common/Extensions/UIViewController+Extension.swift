//
//  UIViewController+Extension.swift
//  NewsApp
//
//  Created by Agustinch on 16/03/2023.
//

import SafariServices
import UIKit

extension UIViewController {
    func openSafariURL(webUrl: String) {
        if let url = URL(string: webUrl) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
}
