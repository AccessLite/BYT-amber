//
//  FoaasDataManager.swift
//  Byt
//
//  Created by Amber Spadafora on 11/25/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class FoassDataManager {
    
    
    private static let operationsKey: String = "FoaasOperationsKey"
    static let defaults = UserDefaults.standard
    internal private(set) var operations: [FoaasOperation]?
    
    
    
    func save(operations: [FoaasOperation]){
        
        
    }
    
    func load() -> Bool{
        return true
    }
    
    func deleteStoredOperations(){
        FoassDataManager.defaults.set(nil, forKey: FoassDataManager.operationsKey)
    }
    
    
}
