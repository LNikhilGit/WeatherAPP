//
//  DetailView.swift
//  WeatherApp
//
//  Created by Nikhil Lalam on 3/22/24.
//

import SwiftUI

struct DetailView: View {
    @StateObject var weatherViewModel: WeatherViewModel
    var body: some View {
        if let current = weatherViewModel.current {
            Divider()
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        CurrentWeatherCell(title: "Sunrise", detail: "\(current.sunrise.hourMinuteAmPm(weatherViewModel.timeZoneOffset))")
                        CurrentWeatherCell(title: "Pressure", detail: "\(current.pressure) hPa")
                        CurrentWeatherCell(title: "Visibility", detail: "\(current.visibility/1000) Km")
                    }.padding(.horizontal)
                    Divider()
                    VStack(alignment: .leading) {
                        CurrentWeatherCell(title: "Sunset", detail: "\(current.sunset.hourMinuteAmPm(weatherViewModel.timeZoneOffset))")
                        CurrentWeatherCell(title: "Wind", detail: "\(current.windSpeedWithDirection)")
                        CurrentWeatherCell(title: "UV Index", detail: current.uvi.roundedString(to: 0))
                    }
                }
            }
             .padding()
        }
    }
}

