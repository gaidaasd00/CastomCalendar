//
//  String+Extensions.swift
//  CastomCalendar
//
//  Created by Alexey Gaidykov on 25.11.2022.
//

import Foundation

extension String {
    func changeCharEnd() -> String {
        guard let endChar = self.last else { return ""}
        
        var newString = self
        
        if endChar == "я" && newString.count > 3 {
            newString.removeLast()
            newString += "ь"
        } else if newString.count == 3 {
            newString.removeLast()
            newString += "й"
        } else {
            newString.removeLast()
        }
        
        return newString
    }
}
