//
//  WeatherForcast.swift
//  WeatherApp
//
//  Created by Nikhil Lalam on 3/16/24.
//

import Foundation

struct WeatherDataModel: Codable {
    let timezone_offset: Int
    let current: Current
    let daily: [Daily]
    let hourly: [Hourly]
    
    // MARK: - Current Weather Model
    struct Current: Codable {
        let dt: Int
        let sunrise: Int
        let sunset: Int
        let temp: Double
        let feels_like: Double
        let pressure: Int
        let humidity: Int
        let uvi: Double
        let clouds: Int
        let visibility: Int
        let wind_speed: Double
        let wind_deg: Int
        let weather: [Weather]
    }
    // MARK: - Hourly Weather Model
    struct Hourly: Codable {
        let dt: Int
        let temp: Double
        let humidity: Int
        let clouds: Int
        let pop: Double
        let weather: [Weather]
    }
    
    // MARK: - Current Weather Model
    struct Daily: Codable {
        let dt: Int
        let temp: Temp
        let clouds: Int
        let humidity: Int
        let pop: Double
        let weather: [Weather]
    }
    // MARK: - Temp
    struct Temp: Codable {
        let min: Double
        let max: Double
    }
    // MARK: - Sub Detail Model
    struct Weather: Codable {
        let description: String
        let icon: String
    }
}

