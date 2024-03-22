//
//  DateTimeDoubleExtensions.swift
//  WeatherApp
//
//  Created by Nikhil Lalam on 3/22/24.
//

import Foundation

extension Int {
    var dayDateMonth: String {
        let dateFormatter = DateFormatter ()
        dateFormatter.dateFormat = "EE, MMM d"
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(self)))
    }
    
    func hourMinuteAmPm(_ offset: Int = 0) -> String {
        let dateFormatter = DateFormatter ()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0) // Because API provider use GMT 00:00 as default TimeZone.
        // Or dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(self.advanced(by: offset))))
    }
}

extension Double {
    func roundedString(to digits: Int) -> String {
        String(format: "%.\(digits)f", self)
    }
}
