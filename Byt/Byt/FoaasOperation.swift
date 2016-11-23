//
//  FoaasOperation.swift
//  Byt
//
//  Created by Amber Spadafora on 11/22/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class FoaasOperation: JSONConvertible, DataConvertible {
    var name: String
    var url: String
    var fields: [[String:AnyObject]]
    
    init(name: String, url: String, fields: [[String:AnyObject]]) {
        self.name = name
        self.url = url
        self.fields = fields
    }
    
    convenience required init?(json: [String: AnyObject]) {
        guard let name = json["name"] as? String,
        let url = json["url"] as? String,
            let fields = json["fields"] as? [[String: AnyObject]] else { return nil }
        self.init(name: name, url: url, fields: fields)
    }
    
    convenience required init?(data: Data) {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
            
            if let validData = json {
                self.init(json: validData)
            } else {
                return nil
            }
        }
        catch {
            print("Error occurred: \(error)")
            return nil
        }
    }
    
    
    func toJson() -> [String: AnyObject] {
        let json: [String: AnyObject] = ["name": name as AnyObject, "url" : url as AnyObject, "fields" : fields as AnyObject]
        return json
    }
    
    func toData() throws -> Data {
        let json = self.toJson()
        
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: [])
            return data
        }
        catch {
            throw NSError(domain: "Error converting to Data type", code: 1, userInfo: nil)
        }
    }
    
}
