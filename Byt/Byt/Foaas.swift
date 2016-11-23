//
//  Fooas.swift
//  Byt
//
//  Created by Amber Spadafora on 11/22/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class Foaas: JSONConvertible, CustomStringConvertible {
    
    var message: String
    var subtitle: String
    var description: String {
        return "message: \(message) subtitle: \(subtitle)"
    }
    
    init(message: String, subtitle: String){
        self.message = message
        self.subtitle = subtitle
    }
    
    convenience required init?(json: [String : AnyObject]) {
        guard let message = json["message"] as? String,
            let subtitle = json["subtitle"] as? String
                else { return nil }
        self.init(message: message, subtitle: subtitle)
    }
    
    func toJson() -> [String : AnyObject] {
        let json: [String: AnyObject] = ["message" : message as AnyObject,
                                         "subtitle" : subtitle as AnyObject]
        return json
    }
    
}
