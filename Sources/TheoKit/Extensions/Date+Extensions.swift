//
//  File.swift
//  
//
//  Created by KaayZenn on 27/05/2024.
//

import Foundation

extension Date {
    
    func lastDayOfYear() -> Date? {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = calendar.component(.year, from: self)
        components.month = 12
        components.day = 31
        
        return calendar.date(from: components)
    }
    
}

// MARK: - Validation
extension Date {
    
    public func isMidnight() -> Bool {
        let calendar = Calendar.current
        
        let components = calendar.dateComponents([.hour, .minute, .second], from: self)
        
        if let hour = components.hour, let minute = components.minute, let second = components.second {
            return hour == 0 && minute == 0 && second == 0
        } else {
            return false
        }
    }
    
}

// MARK: - String
extension Date {
    
    public var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    public var year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: self)
    }
    
    public func toISO8601String() -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter.string(from: self)
    }
    
}

// MARK: - DateComponents
extension Date {
    
    public func toDateComponents() -> DateComponents {
        let comps = Calendar.current.dateComponents([.second, .minute, .hour, .day, .month, .year], from: self)
        return comps
    }
    
}

// MARK: - Others
extension Date {
    
    /// Calculate the number of days between two dates.
    /// - Parameter to: The end date for the calculation.
    /// - Returns: The number of days between the current date and the given date.
    public func daysBetween(to date: Date) -> Int? {
        let calendar = Calendar.current
        let startOfCurrentDate = calendar.startOfDay(for: self)
        let startOfOtherDate = calendar.startOfDay(for: date)
        
        let components = calendar.dateComponents([.day], from: startOfCurrentDate, to: startOfOtherDate)
        return components.day
    }
    
}
