//
//  DailyView.swift
//  WeatherApp
//
//  Created by Nikhil Lalam on 3/22/24.
//

import SwiftUI

struct DailyView: View {
    @StateObject var weatherViewModel: WeatherViewModel
    var body: some View {
        if let daily = weatherViewModel.daily {
            Divider()
            VStack(alignment: .leading) {
                Text("Daily Forecast").bold()
                ScrollView(.horizontal, showsIndicators: false) {
                    VStack {
                        ForEach(daily, id: \.dt) { day in
                            ZStack {
                                HStack {
                                    Text(daily[0].dt == day.dt ? "Today": day.dt.dayDateMonth).font(.title2)
                                    Spacer()
                                    HStack {
                                        VStack{
                                            Text("Max")
                                            Text("\(day.temp.max.roundedString(to: 0))°")
                                        }
                                        Divider()
                                        VStack{
                                            Text("Min")
                                            Text("\(day.temp.min.roundedString(to: 0))°")
                                        }
                                    }
                                    Spacer()
                                    Image(systemName: day.weather[0].iconImage)
                                        .renderingMode(.original)
                                        .font(.system(size: 25))
                                        .padding(4)
                                    Spacer()
                                    HStack {
                                        VStack{
                                            Text("Rain")
                                            Text("\((day.pop * 100).roundedString(to: 0))%")
                                        }
                                        Divider()
                                        VStack{
                                            Text("Cloud")
                                            Text("\(day.clouds)%")
                                        }
                                    }
                                }.frame(width: 405  , height: 60)
                                    .padding(5)
                            }
                            .background(Color(.systemBlue).opacity(0.35))
                            .cornerRadius(12)
                        }
                    }
                }
            }.padding(.horizontal,8)
        }
    }
}

