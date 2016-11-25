//
//  ApiManager.swift
//  Byt
//
//  Created by Amber Spadafora on 11/24/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class ApiManager {
    
    static let manager = ApiManager()
    static let defaultUrlSession = URLSession(configuration: .default)
    
    private init() {}
    
    internal class func getFoaas(url: URL, completion: @escaping ((Foaas?) -> Void)){
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("applications/json", forHTTPHeaderField: "Accept")
        
        defaultUrlSession.dataTask(with: request){ (data: Data?,_, error: Error?) in
            if error != nil {
                print("There was an error during session: \(error)")
            }
            if data != nil {
                do {
                    let validData = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject]
                    guard let json = validData else { return }
                    completion(Foaas(json: json))
                }
                catch {
                    print(error)
                }
            }
            }
            .resume()
    }
    
    internal class func getOperations(completion: @escaping (([FoaasOperation]?) -> Void)){
        
        var request = URLRequest(url: URL(string: "http://www.foaas.com/operations")!)
        request.httpMethod = "GET"
        request.addValue("applications/json", forHTTPHeaderField: "Accept")

        defaultUrlSession.dataTask(with: request){ (data: Data?,_, error: Error?) in
            if error != nil {
                print("There was an error during getOperations (\(error))")
            }
            if data != nil {
                do {
                    let validData = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: AnyObject]]
                    guard let json = validData else { return }
                    
                    var operations = [FoaasOperation]()
                    operations = json.flatMap { FoaasOperation(json: $0) }
//
                    completion(operations)
                    
                }
                catch {
                    print(error)
                }
            }
        } .resume()
    }
}
