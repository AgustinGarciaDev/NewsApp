//
//  NewsListViewModelTest.swift
//  NewsAppTests
//
//  Created by Agustinch on 18/03/2023.
//

import XCTest
@testable import NewsApp

final class NewsListViewModelTest: XCTestCase {
    
    let newResponse = NewsModel(category: "startup", data: [
        InfoNew(author: "", content: "", date: "", id: "", imageUrl: "", readMoreUrl: "", time: "", title: "", url: "")], success: true)

    func test_whenNewListUseCaseRetrievesNewStartup_thenViewModelContainsNew() {
        //Given
        let useCase = NewsListUseCaseMock()
        useCase.expectation = expectation(description: "contains news")
        useCase.newList = NewsModel(category: "startup", data: newResponse.data , success: true)
        let sut = NewsListViewModel(useCase: useCase)
        
        //When
        sut.requestNewsStartup()
        
        //Then
        waitForExpectations(timeout: 5)
        XCTAssertEqual(sut.newsList, newResponse.data)
    }
    
    func test_whenNewListUseCaseReturnError_thenViewModelContainsError() {
        //Given
        let useCase = NewsListUseCaseMock()
        useCase.expectation = expectation(description: "contains error")
        useCase.error = ErrorAPINew.networkFailure
        let sut = NewsListViewModel(useCase: useCase)
        
        //When
        sut.requestNewsStartup()
        
        //Then
        waitForExpectations(timeout: 5)
        XCTAssertNotNil(sut.errorTitle, "Error Red")
    }
    
    
}
