//
//  Race.swift
//  F1_pulse
//
//  Created by Dmitrii Tenshov on 28.11.2023.
//

import Foundation

struct DriverResult {
    var position: Int
    var driver: String
    var time: String
    var points: Int

    init(position: Int, driver: String, time: String, points: Int) {
        self.position = position
        self.driver = driver
        self.time = time
        self.points = points
    }
}

struct RacesResults {
    var name: String
    var race: [DriverResult]

    init(name: String, race: [DriverResult]) {
        self.name = name
        self.race = race
    }
}
