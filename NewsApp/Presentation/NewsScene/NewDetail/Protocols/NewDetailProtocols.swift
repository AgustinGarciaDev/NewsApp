//
//  NewDetailProtocols.swift
//  NewsApp
//
//  Created by Agustinch on 16/03/2023.
//

import Foundation


protocol NewDetailViewModelProtocol {
    var coordinator: Coordinator? {get set}
    var view: NewDetailViewUpdatedProtocol? {get set}
    func configurationUI() -> InfoNew
}

protocol NewDetailViewUpdatedProtocol {
   // func configurationUI(with new: InfoNew)
}
