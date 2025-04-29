//
//  Date+Extensions.swift
//  SwiftUIArchitectureExample
//
//  Created by Theo Sementa on 28/04/2025.
//

import Foundation

public extension Date {
    
    var hoursAndMinutes: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
    
    func hoursAndMinutes(from date: Date) -> String {
        let components = Calendar.current.dateComponents([.hour, .minute], from: date, to: self)
        var hours = components.hour ?? 0
        var minutes = (components.minute ?? 0) + (self < date ? 0 : 1)
        
        if minutes >= 60 {
            minutes -= 60
            hours += 1
        }
        
        return String(format: "%dh%02d", abs(hours), abs(minutes))
    }
    
    var dayValue: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    var monthValue: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    var yearValue: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    var monthString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    var yearString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: self)
    }
    
}

public extension Date {
    
    func monthsBetween(_ date: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: self, to: date)
        
        guard let yearDifference = components.year,
              let monthDifference = components.month
        else { return 0 }
        
        return abs(yearDifference * 12 + monthDifference)
    }
    
    func daysBetweenToday() -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self, to: Date())
        return abs(components.day ?? 0)
    }
    
    /// Calculate the number of days between two dates.
    /// - Parameter to: The end date for the calculation.
    /// - Returns: The number of days between the current date and the given date.
    func daysBetween(to date: Date) -> Int? {
        let calendar = Calendar.current
        let startOfCurrentDate = calendar.startOfDay(for: self)
        let startOfOtherDate = calendar.startOfDay(for: date)
        
        let components = calendar.dateComponents([.day], from: startOfCurrentDate, to: startOfOtherDate)
        return components.day
    }
    
    static func create(minute: Int = 0, hour: Int = 0, day: Int, month: Int, year: Int) -> Date? {
        var dateComponents = DateComponents()
        dateComponents.minute = minute
        dateComponents.hour = hour
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        return Calendar.current.date(from: dateComponents)
    }
    
    func toDateComponents() -> DateComponents {
        let comps = Calendar.current.dateComponents([.second, .minute, .hour, .day, .month, .year], from: self)
        return comps
    }
    
}

public extension Date {
    
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    var endOfDay: Date? {
        return Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: self)
    }
    
    var startOfMonth: Date? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: self)
        return calendar.date(from: components)
    }
    
    var endOfMonth: Date? {
        guard let startOfMonth = self.startOfMonth else { return nil }
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfMonth)
    }
    
    var startOfYear: Date? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: self)
        return calendar.date(from: components)
    }
    
    var endOfYear: Date? {
        guard let startOfYear = self.startOfYear else { return nil }
        var components = DateComponents()
        components.year = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfYear)
    }
    
}

public extension Date {
    
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    var isYesterday: Bool {
        return Calendar.current.isDateInYesterday(self)
    }
    
    var isTomorrow: Bool {
        return Calendar.current.isDateInTomorrow(self)
    }
    
    var isMidnight: Bool {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: self)
        return components.hour == 0 && components.minute == 0
    }
    
    var isLessThan24HoursAway: Bool {
        let now = Date()
        let diffInSeconds = self.timeIntervalSince(now)
        return diffInSeconds > 0 && diffInSeconds <= 24 * 3600
    }
    
    var withTemporality: DateTemporality {
        let calendar = Calendar.current
        let now = Date()
        
        let startOfToday = calendar.startOfDay(for: now)
        let startOfDate = calendar.startOfDay(for: self)
        
        if let daysDifference = calendar.dateComponents([.day], from: startOfToday, to: startOfDate).day {
            switch daysDifference {
            case 0:     return DateTemporality.today
            case 1:     return DateTemporality.tomorrow
            case -1:    return DateTemporality.yesterday
            case 2:     return DateTemporality.inTwoDays
            case -2:    return DateTemporality.twoDaysAgo
            default:    break
            }
        }
        
        return DateTemporality.none
    }
    
}

public enum DateTemporality {
    case none, today, tomorrow, yesterday, inTwoDays, twoDaysAgo
}
