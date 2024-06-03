//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Afolabi Oluwasegun on 01/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack{
               CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(imageName:isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 77)
                HStack(spacing:25){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temp: 76)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temp: 88)
                    WeatherDayView(dayOfWeek: "THUR", imageName: "cloud.bolt.rain.fill", temp: 55)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temp: 75)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "snow", temp: 25)
                }
                Spacer()
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30,height: 30)
            Text("\(temp)°")
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black: .blue, isNight ? .gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
        .ignoresSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140,height: 140)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 50)
    }
}

