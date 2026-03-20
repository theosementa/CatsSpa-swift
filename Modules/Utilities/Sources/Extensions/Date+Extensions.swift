//
//  File.swift
//  Utilities
//
//  Created by Theo Sementa on 20/03/2026.
//

import Foundation

public extension Date {
    
    static func create(day: Int, month: Int, year: Int) -> Date {
        var components = DateComponents()
        components.day = day
        components.month = month
        components.year = year
        return Calendar.current.date(from: components) ?? .now
    }
    
}
