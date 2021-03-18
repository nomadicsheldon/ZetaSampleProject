//
//  Extension.swift
//  ZetaAssignment
//
//  Created by Himanshu Rajput on 23/01/21.
//

import Foundation

extension Array {
    
    /// Method to return the object at index if available. If index is beyond bounds, returns nil.
    public func object(at index: Int) -> Element? {
        guard index < self.count, index >= 0 else { return nil }
        return self[index]
    }
}
