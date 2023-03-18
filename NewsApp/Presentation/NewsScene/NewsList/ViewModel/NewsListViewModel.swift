//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by Agustinch on 15/03/2023.
//

import Foundation


final class NewsListViewModel: NewsListViewModelProtocol {
  
    var newsList: [InfoNew] = [InfoNew]()
    var coordinator: Coordinator?
    var view: NewsListViewUpdatedProtocol?
    
    private var useCase: NewsListUseCaseProtocol
 
    init(useCase: NewsListUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func getNewsList() -> [InfoNew] {
       return newsList
    }
    
    func requestNewsStartup() {
        LoadingView.show()
        useCase.getNewsStartup { [weak self] result in
            switch result {
            case .success(let result):
                print(result)
                LoadingView.hide()
                self?.newsList = result.data
                self?.view?.updatedTableView()
            case .failure(let error):
                LoadingView.hide()
               print(error)
            }
        }
    }
    
    func didSelectItem(at index: Int) {
        coordinator?.showNewDetail(with: newsList[index])
    }
}
