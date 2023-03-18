//
//  NewsModel.swift
//  NewsApp
//
//  Created by Agustinch on 16/03/2023.
//

import Foundation

struct NewsModel: Decodable, Equatable {
    let category: String
    let data: [InfoNew]
    let success: Bool?
}

// MARK: - InfoNews
struct InfoNew: Decodable, Equatable {
    let author, content: String?
    let date: String?
    let id: String?
    let imageUrl: String?
    let readMoreUrl: String?
    let time, title: String?
    let url: String?
}
