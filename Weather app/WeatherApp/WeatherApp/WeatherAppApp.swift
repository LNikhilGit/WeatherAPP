//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Nikhil Lalam on 3/12/24.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    @StateObject var weatherViewModel = WeatherViewModel()
    var body: some Scene {
        WindowGroup {
            ZStack {
                if weatherViewModel.isLoading {
                    // Loading indicator when app launches..
                    ProgressView("Loading").font(.largeTitle)
                } else {
                        MainView()
                    }
                }
            }
        }
    }
