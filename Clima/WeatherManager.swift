//
//  WeatherManager.swift
//  Clima
//
//  Created by Vlad Katsubo on 9.09.22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=845b75a0e60da38ec931a41fd6215520&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
    }
}
