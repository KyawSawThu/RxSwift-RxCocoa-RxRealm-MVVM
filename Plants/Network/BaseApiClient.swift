//
//  BaseApiClient.swift
//  Plants
//
//  Created by Riki on 11/16/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class BaseApiClient {
    
    func requestApiData<T>(
        url: String,
        method: HTTPMethod,
        params: Parameters,
        headers: HTTPHeaders,
        value: T.Type
    )->Observable<T> where T: Codable {
        
        return Observable<T>.create { (observer) -> Disposable in
            let request = Alamofire.request(url, method: method, parameters: params, headers: headers).responseJSON { (response) in
                
                switch response.result {
                case .success:
                    if 200 ... 299 ~= response.response?.statusCode ?? 500 {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let data = try! decoder.decode(T.self, from: response.data!)
                        observer.onNext(data)
                        observer.onCompleted()
                    } else {
                        let jsonErr = try! JSONDecoder().decode(ErrorResponse.self, from: response.data!)
                        observer.onError(NSError(domain: jsonErr.message, code: jsonErr.code, userInfo: nil))
                    }
                case .failure(let err):
                    observer.onError(err)
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
