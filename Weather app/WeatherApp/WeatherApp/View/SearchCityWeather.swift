//
//  SearchCityWeather.swift
//  WeatherApp
//
//  Created by Nikhil Lalam on 3/22/24.
//

import SwiftUI

struct SearchCityWeather: View {
    @StateObject var weatherViewModel: WeatherViewModel
       
       var body: some View {
           HStack {
             
               Image(systemName: "mappin.and.ellipse")
                   .font(.system(size: 30))
               
               TextField("Search City", text: $weatherViewModel.searchedCityName, onCommit:  {
                   weatherViewModel.fetchWeatherByCityName()
               })
               .padding(5)
               .background(Color(.quaternarySystemFill))
               .cornerRadius(8)
               Button {
                   weatherViewModel.fetchWeatherByCityName()
               } label: {
                   Image(systemName: "magnifyingglass").renderingMode(.original)
                       .font(.system(size: 24))
               }
           }
           .padding(.horizontal)
       }
}

