//
//  FoaasField.swift
//  Byt
//
//  Created by Amber Spadafora on 11/22/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class FoaasField: JSONConvertible, CustomStringConvertible {
    
    var name: String
    var field: String
    var description: String {
        return "Name: \(name) Field: \(field)"
    }
    
    init(name: String, field: String) {
        self.name = name
        self.field = field
    }
    
    convenience required init?(json: [String: AnyObject]) {
        guard let name = json["name"] as? String,
        let field = json["field"] as? String
            else { return nil }
        self.init(name: name, field: field)
    }
    
    func toJson() -> [String: AnyObject] {
        let json: [String: AnyObject] = ["name": name as AnyObject, "field" : field as AnyObject]
        return json
    }
    
    
}
