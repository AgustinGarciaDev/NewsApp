//
//  NewDetailViewModel.swift
//  NewsApp
//
//  Created by Agustinch on 16/03/2023.
//

import Foundation


class NewDetailViewModel: NewDetailViewModelProtocol {    

    var coordinator: Coordinator?

    var infoNew: InfoNew

    init(infoNew: InfoNew) {
        self.infoNew = infoNew
    }

    func configurationUI() -> InfoNew {
        return infoNew
    }

}
