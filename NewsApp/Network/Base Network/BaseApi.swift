//
//  BaseApi.swift
//  ChallengeCeiba
//
//  Created by Agustinch on 28/09/2022.
//

import Foundation
import Alamofire

enum ErrorAPINew: Error {
    case noResponse
    case networkFailure
}

class BaseAPI<T: TargetType> {

    func fetchData<M: Decodable>(target: T, responseClass: M.Type, completionHandler: @escaping (Result<M, ErrorAPINew>) -> Void) {
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let parameters = buildParams(task: target.task)

        AF.request(target.baseURL + target.path,
                   method: method, parameters: parameters.0,
                   encoding: parameters.1, headers: headers).responseData { (response) in
            
            switch response.result {
            case .success(let data):
                guard let responseObj = try? JSONDecoder().decode(M.self, from: data) else {
                    print("responseObj error")
                    completionHandler(.failure(ErrorAPINew.noResponse))
                    return
                }
                completionHandler(.success(responseObj))
            case .failure:
                completionHandler(.failure(ErrorAPINew.networkFailure))
            }
            
        }
        
     
    }

    private func buildParams(task: Task) -> ([String: Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameters(parameters: let parameters, encoding: let encoding):
            return (parameters, encoding)
        }
    }

}
