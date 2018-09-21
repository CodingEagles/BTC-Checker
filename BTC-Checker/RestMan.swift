//
//  RestManager.swift
//  RestInPepperoni
//
//  Created by CodingEagles on 19/09/2018.
//  Copyright © 2018 CodingEagles. All rights reserved.
//
import Foundation

enum HTTPMethods: String {
    case GET
    case POST
    case PUT
    case DELETE
}

class RestMan {
    
    static let shared = RestMan()
    private init () {}
    
    func get<T:Codable>(url: String, type: T.Type, completion: @escaping (_ result: T?,_ error: Error?) -> Void) {
        if let getURL = URL(string: url) {
            var request = URLRequest(url: getURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) {
                (data, response, error) in
                guard error == nil else {
                    print("GET Request in \(getURL) Error: \(String(describing: error))")
                    return
                }
                
                if let receivedData = data {
                    do {
                        let results = try JSONDecoder().decode(type, from: receivedData)
                        
                        DispatchQueue.global(qos: .background).async {
                            completion(results, nil)
                        }
                    } catch {
                        DispatchQueue.global(qos: .background).async {
                            completion(nil, error)
                        }
                    }
                }
            }
            DispatchQueue.global(qos: .background).async {
                task.resume()
            }
        }
    }
    
    func post<T:Codable>(url: String, type: T.Type, completion: @escaping (_ result: T?,_ error: Error?) -> Void) {
        if let postURL = URL(string: url) {
            var request = URLRequest(url: postURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
            request.httpMethod = "POST"
            
            
            
            let task = URLSession.shared.dataTask(with: request) {
                (data, response, error) in
                guard error == nil else {
                    print("POST Request in \(postURL) Error: \(String(describing: error))")
                    return
                }
                
                //
                //TODO
                //
                
            }
            DispatchQueue.global(qos: .background).async {
                task.resume()
            }
        }
    }
    
    func put<T:Codable>(url: String, type: T.Type, completion: @escaping (_ result: T?,_ error: Error?) -> Void) {
        if let putURL = URL(string: url) {
            var request = URLRequest(url: putURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
            request.httpMethod = "PUT"
            
            let task = URLSession.shared.dataTask(with: request) {
                (data, response, error) in
                guard error == nil else {
                    print("PUT Request in \(putURL) Error: \(String(describing: error))")
                    return
                }
                
                //
                //TODO
                //
                
            }
            DispatchQueue.global(qos: .background).async {
                task.resume()
            }
        }
    }
    
    func delete<T:Codable>(url: String, type: T.Type, completion: @escaping (_ result: T?,_ error: Error?) -> Void) {
        if let deleteURL = URL(string: url) {
            var request = URLRequest(url: deleteURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
            request.httpMethod = "DELETE"
            
            let task = URLSession.shared.dataTask(with: request) {
                (data, response, error) in
                guard error == nil else {
                    print("DELETE Request in \(deleteURL) Error: \(String(describing: error))")
                    return
                }
                
                //
                //TODO
                //
                
            }
            DispatchQueue.global(qos: .background).async {
                task.resume()
            }
        }
    }
}
