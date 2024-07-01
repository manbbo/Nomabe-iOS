//
//  NetworkRequest.swift
//  Nomabe iOS
//
//  Created by Piton on 28/06/24.
//

//import Foundation
//
//class NetworkRequest {
//    static let shared = NetworkRequest()
//    
//    private init() {}
//    
//    func getData(from urlString: String, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
//        guard let url = URL(string: urlString) else {
//            print("Invalid URL")
//            return
//        }
//        
//        let urlRequest = URLRequest(url: url)
//        
//        let task = URLSession.shared.dataTask(with: urlRequest) {
//            data, response, error in completion(data, response, error)
//        }
//        
//        task.resume()
//    }
//}
