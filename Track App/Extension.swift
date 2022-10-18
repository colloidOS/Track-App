//
//  Extension.swift
//  Track App
//
//  Created by Macintosh HD on 17/08/2021.
//

import Foundation
import SwiftUI

extension Color {
    static let BackGround = Color("BackGround")
    static let Icon = Color("Icon")
    static let Text = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
    
}
    
extension DateFormatter {
    static let AllNumericUSA: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
     return formatter
    }()
}
extension String {
    func dateParsed() -> Date {
    guard    let ParsedDate = DateFormatter.AllNumericUSA.date(from: self) else { return Date() }
    
        
        return ParsedDate
    }
}

extension Date: Strideable{
    
    func formatted() -> String {
        return self.formatted(.dateTime.year().month().day()) 
    }
  
}

extension Double {
    func roundedTo2Digits()  -> Double {
        return (self * 100).rounded() / 100
    }
}
