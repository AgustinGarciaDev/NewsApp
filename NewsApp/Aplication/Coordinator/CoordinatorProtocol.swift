//
//  CoordinatorProtocol.swift
//  NewsApp
//
//  Created by Agustinch on 15/03/2023.
//

import UIKit

protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get set }
    func start()
}
