//
//  URL+Extensions.swift
//  GoodWeather
//
//  Created by leticia marques on 12/01/23.
//

import Foundation

extension URL {
    
    static func urlForWeatherAPI(city: String) -> URL? {
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=9d577366a820173fd6a61f3bbad0e474&units=imperial")
    }
}
