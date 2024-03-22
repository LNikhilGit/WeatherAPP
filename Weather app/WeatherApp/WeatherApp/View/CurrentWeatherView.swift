//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Nikhil Lalam on 3/22/24.
//

import SwiftUI

struct CurrentWeatherView: View {
    @StateObject var weatherViewModel: WeatherViewModel
    var body: some View {
        if let current = weatherViewModel.current {
            VStack(spacing: 2) {
                Text(weatherViewModel.currentCityName)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                HStack {
                    Text(current.weather[0].description.capitalized)
                    Divider()
                    Text("Feels Like: \(current.feels_like.roundedString(to: 0))°")
                }.fixedSize()
                HStack {
                    Text("\(current.temp.roundedString(to: 0))°")
                    Divider()
                    Image(systemName: current.weather[0].iconImage).renderingMode(.original)
                }.fixedSize().font(.system(size: 75)).padding()
                HStack {
                    Text("Cloud: \((current.clouds))%")
                    Divider()
                    Text("Humidity: \(current.humidity)%")
                }.fixedSize()
            }
        }
    }
}

