//
//  RepositoryNetwork.swift
//  ChallengeCeiba
//
//  Created by Agustinch on 28/09/2022.
//

import Foundation

enum RepositoriesNetworking {
    case getNewsStartup
}

extension RepositoriesNetworking: TargetType {
    var baseURL: String {
        switch self {
        default:
            return "https://inshorts.deta.dev/"
        }
    }

    var path: String {
        switch self {
        case .getNewsStartup:
            return "news?category=startup"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getNewsStartup:
            return .get

        }
    }

    var task: Task {
        switch self {
        case .getNewsStartup:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        switch self {
        default:
            return [:]
        }
    }

}
