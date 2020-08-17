//
//  APIClient.swift
//  MobileDataApp
//
//  Created by Le Anh Vu on 16/8/20.
//  Copyright © 2020 Le, AnhVu. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire

protocol APIClientProtocol: class {
    func requestData(_ method: HTTPMethod,
                     path: String,
                     payload: [String: Any]?,
                     headers: [String : String]?) -> Observable<Data>
}

final class APIClient {

    private var endpointUrlString: String = "https://data.gov.sg/"

    private func handleRequest(url: URLConvertible,
                               method: HTTPMethod,
                               parameters: [String: Any]?,
                               headers: [String : String]?) -> Observable<Data> {
        let encoding: ParameterEncoding = method == .get ? URLEncoding.default : JSONEncoding.default
        let result = request(url: url,
                             method: method,
                             parameters: parameters,
                             encoding: encoding,
                             headers: headers)
            .responseData()
            .catchError { (error) -> Observable<(HTTPURLResponse, Data)> in
                if let urlError = (error as? URLError) {
                    return .error(MobileDataError.network(error: urlError))
                }

                return .error(MobileDataError.unexpected(message: error.localizedDescription))
            }
            .flatMap { [weak self] response -> Observable<Data> in
                guard let strongSelf = self else { return .empty() }
                return strongSelf.process(response: response)
            }

        return result
    }

    private func request(url: URLConvertible,
                        method: HTTPMethod,
                        parameters: [String: Any]?,
                        encoding: ParameterEncoding,
                        headers: [String : String]?) -> Observable<DataRequest> {
        return RxAlamofire.request(method, url, parameters: parameters, encoding: encoding, headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
    }

    private func process(response: (HTTPURLResponse, Data)) -> Observable<Data> {
        let data = response.1

        if let errorData = try? JSONDecoder().decode(ErrorData.self, from: data) {
            return .error(MobileDataError.apiError(errorData: errorData))
        }

        return .just(data)
    }

    private func getRequestUrl(path: String) -> URLConvertible? {
        if let url = URL(string: endpointUrlString + path) {
            return url
        }

        assertionFailure("URL should not be nil!")
        return nil
    }
}

extension APIClient: APIClientProtocol {
    func requestData(_ method: HTTPMethod, path: String, payload: [String : Any]?, headers: [String : String]?) -> Observable<Data> {
        guard let url = getRequestUrl(path: path) else { return .error(MobileDataError.invalidURL) }
        return handleRequest(url: url,
                             method: method,
                             parameters: payload,
                             headers: headers)
    }
}
