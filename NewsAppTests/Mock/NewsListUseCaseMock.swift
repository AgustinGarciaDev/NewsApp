//
//  NewsListUseCaseMock.swift
//  NewsAppTests
//
//  Created by Agustinch on 18/03/2023.
//

import Foundation
@testable import NewsApp
import XCTest

class NewsListUseCaseMock: NewsListUseCaseProtocol {
   
    var expectation: XCTestExpectation?
    var error: ErrorAPINew?
    var newList = NewsModel(category: "startup", data: [], success: true)
    
    func getNewsStartup(completionHandler: @escaping (Result<NewsApp.NewsModel, ErrorAPINew>) -> Void) {
        
        if let error = error {
            completionHandler(.failure(error))
        } else {
            completionHandler(.success(newList))
        }
        
        expectation?.fulfill()
    }
}
