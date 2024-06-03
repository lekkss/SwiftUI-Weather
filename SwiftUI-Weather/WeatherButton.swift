//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Afolabi Oluwasegun on 02/06/2024.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}



struct WeatherBbutton_Preview: View {
    var body: some View {
        WeatherButton(title: "TEst", textColor: .white, backgroundColor: .blue)
    }
}
#Preview {
    WeatherBbutton_Preview()
}
