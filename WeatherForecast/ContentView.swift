//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Jake Miller on 10/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WeekForecast(averageHigh: 100, averageLow: 5, daysOfSun: 4, daysOfRain: 3)
        
        ScrollView{
            DayForecast(day: "Mon", isRainy: false, high: 70, low: 50)
            DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
            DayForecast(day: "Wed", isRainy: false, high: 90, low: 20)
        }
    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        if isRainy {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var iconColor: Color {
        if isRainy {
            return Color.blue
        } else {
            return Color.yellow
        }
    }
    
    var highTempTextColor: Color {
        if (high > 80) {
            return Color.red
        } else {
            return Color.primary
        }
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(.headline)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(Font.largeTitle)
            Text("High: \(high)º")
                .fontWeight(Font.Weight.medium)
                .foregroundStyle(highTempTextColor)
            Text("Low: \(low)º")
                .fontWeight(Font.Weight.medium)
                .foregroundStyle(Color.secondary)
        }
        .padding()
    }
}

struct WeekForecast: View {
    let averageHigh: Int
    let averageLow: Int
    let daysOfSun: Int
    let daysOfRain: Int
    
    var body: some View {
        Text("Weekly Summary")
            .font(.headline)
        Text("October 7th - 14th")
        HStack {
            Text("Avg High: \(averageHigh)")
                .font(.caption)
            Text("Avg Low: \(averageLow)")
                .font(.caption)
        }
    }
}
