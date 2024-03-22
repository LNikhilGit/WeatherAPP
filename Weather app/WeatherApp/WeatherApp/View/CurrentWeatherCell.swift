//
//  CurrentWeatherCell.swift
//  WeatherApp
//
//  Created by Nikhil Lalam on 3/22/24.
//

import SwiftUI

struct CurrentWeatherCell: View {
    let title: String
    let detail: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.body).fontWeight(.light)
            Text(detail).bold()
        }
        Divider()
    }
}

