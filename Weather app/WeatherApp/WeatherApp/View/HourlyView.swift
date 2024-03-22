//
//  HourlyView.swift
//  WeatherApp
//
//  Created by Nikhil Lalam on 3/22/24.
//

import SwiftUI

struct HourlyView: View {
    @StateObject var weatherViewModel: WeatherViewModel
    var body: some View {
        if let hourly = weatherViewModel.hourly {
            Divider()
            VStack(alignment: .leading) {
                Text("Hourly Forecast").bold()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(hourly, id: \.dt) { hour in
                            ZStack {
                                VStack {
                                    Text(hour.dt.hourMinuteAmPm(weatherViewModel.timeZoneOffset)).font(.subheadline)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    VStack {
                                        Text("\(hour.temp.roundedString(to: 0))°")
                                        Image(systemName: hour.weather[0].iconImage).renderingMode(.original)
                                    }
                                    .font(.system(size: 20))
                                    .padding()
                                }.frame(width: 70, height: 100)
                                 .padding()
                            }
                            .background(Color(.systemBlue).opacity(0.25))
                            .cornerRadius(12)
                        }
                    }
                }
            }.padding(.horizontal, 8)
        }
    }
}

