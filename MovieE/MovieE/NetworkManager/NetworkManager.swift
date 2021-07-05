//
//  NetworkManager.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 3/07/21.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func getRequest(url: String, completion: @escaping (Data) -> ()) {
        Alamofire.request(url, method: .get, encoding: URLEncoding.default)
            .responseJSON { result in
                guard result.result.isSuccess, let data = result.data else {
                    //Error case
                    return
                }
                completion(data)
            }
    }
    
    private init() {}
}
