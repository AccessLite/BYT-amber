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
    var fields: [FoaasField]
    
    init(name: String, url: String, fields: [FoaasField]) {
        self.name = name
        self.url = url
        self.fields = fields
    }
    
    required convenience init?(json: [String: AnyObject]) {
        guard let name = json["name"] as? String,
            let url = json["url"] as? String,
            let fields = json["fields"] as? [[String: AnyObject]]
        else { return nil }
        
        var fieldsArray: [FoaasField] = []
        
        for element in fields {
            fieldsArray.append(FoaasField(json: element)!)
        }
        
        self.init(name: name, url: url, fields: fieldsArray)
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
        return [ "name": name as AnyObject,
                 "url" : url as AnyObject,
                 "fields" : fields as AnyObject ] // This will not work because [FoaasField] is not a valid type to be stored in UserDefaults. Convert fields into [[String : String]] first
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
