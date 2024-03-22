//
//  MainView.swift
//  WeatherApp
//
//  Created by Nikhil Lalam on 3/16/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var weatherViewModel = WeatherViewModel()
    var body: some View {
        if weatherViewModel.isLoading {
            ProgressView("Loading").font(.largeTitle)
        } else {
            ScrollView(showsIndicators: false) {
                VStack {
                    SearchCityWeather(weatherViewModel: weatherViewModel)
                    
                    CurrentWeatherView(weatherViewModel: weatherViewModel)
                        HourlyView(weatherViewModel: weatherViewModel)
                        DailyView(weatherViewModel: weatherViewModel)
                        DetailView(weatherViewModel: weatherViewModel)
                }.animation(.easeInOut(duration: 1))
            }
        }
    }
}

#Preview {
    MainView()
}
